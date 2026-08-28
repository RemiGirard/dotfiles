#!/usr/bin/env bash
# Validate the source state without changing the live machine.

set -euo pipefail

full=0
skip_status=0
while [[ $# -gt 0 ]]; do
    case "$1" in
        --full) full=1 ;;
        --skip-status) skip_status=1 ;;
        -h|--help)
            echo "Usage: dotfiles-check [--full] [--skip-status]"
            echo "  --full         Also start Neovim headlessly with this source config"
            echo "  --skip-status  Skip comparison with the live home directory"
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 2
            ;;
    esac
    shift
done

for required_command in bash chezmoi git jq luac rg shellcheck zsh; do
    if ! command -v "$required_command" >/dev/null 2>&1; then
        echo "Missing validation dependency: $required_command" >&2
        exit 1
    fi
done

source_dir=$(chezmoi source-path)
cd "$source_dir"

echo "==> Checking Git whitespace"
git diff --check
git diff --cached --check

echo "==> Checking shell scripts"
while IFS= read -r source_file; do
    first_line=$(sed -n '1p' "$source_file")
    case "$first_line" in
        *bash*) bash -n "$source_file"; shellcheck "$source_file" ;;
        *zsh*) zsh -n "$source_file" ;;
        *'/sh') sh -n "$source_file"; shellcheck "$source_file" ;;
    esac
done < <(rg --files -g '*.sh' -g 'executable_*' | LC_ALL=C sort)

render_dir=$(mktemp -d "${TMPDIR:-/tmp}/dotfiles-check.XXXXXX")
trap 'rm -rf "$render_dir"' EXIT

echo "==> Rendering Darwin and Linux scripts"
for platform_spec in darwin:arm64 linux:amd64 linux:arm64; do
    platform=${platform_spec%%:*}
    architecture=${platform_spec#*:}
    while IFS= read -r template_file; do
        rendered_file="$render_dir/${platform}-${architecture}-$(basename "${template_file%.tmpl}")"
        chezmoi execute-template \
            --override-data "{\"chezmoi\":{\"os\":\"$platform\",\"arch\":\"$architecture\"}}" \
            -f "$template_file" > "$rendered_file"
        if [[ -s "$rendered_file" ]]; then
            bash -n "$rendered_file"
            shellcheck -s bash "$rendered_file"
        fi
    done < <(rg --files -g 'run_*.sh.tmpl' | LC_ALL=C sort)
done

echo "==> Checking rendered JSON"
chezmoi execute-template -f dot_config/opencode/opencode.json.tmpl | jq -e . >/dev/null
jq -e . dot_config/nvim/lazy-lock.json >/dev/null

echo "==> Checking Lua"
while IFS= read -r lua_file; do
    luac -p "$lua_file"
done < <(rg --files dot_config/nvim dot_hammerspoon -g '*.lua' | LC_ALL=C sort)

if [[ "$skip_status" -eq 0 ]]; then
    echo "==> Comparing source with the live home directory"
    chezmoi --no-pager --no-tty status
fi

if [[ "$full" -eq 1 ]]; then
    if ! command -v nvim >/dev/null 2>&1; then
        echo "Missing validation dependency: nvim" >&2
        exit 1
    fi
    echo "==> Starting Neovim headlessly"
    cp -R "$source_dir/dot_config/nvim" "$render_dir/nvim"
    mkdir -p "$render_dir/cache" "$render_dir/state"
    XDG_CONFIG_HOME="$render_dir" \
        XDG_CACHE_HOME="$render_dir/cache" \
        XDG_STATE_HOME="$render_dir/state" \
        nvim --headless -u "$render_dir/nvim/init.lua" \
            '+if v:errmsg !=# "" | cquit | endif' '+qa'
fi

echo "==> Dotfiles validation passed"
