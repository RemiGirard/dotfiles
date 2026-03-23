# Additional Tools Cheatsheet

## btop — System Monitor

Interactive system monitor with CPU, memory, network, disk, and process views.

```bash
btop                          # Launch monitor
```

**Inside btop:**
| Key       | Action                    |
|-----------|---------------------------|
| `h`       | Toggle help               |
| `m`       | Cycle memory graph mode   |
| `e`       | Toggle tree view          |
| `f`       | Filter processes          |
| `/`       | Search processes          |
| `k`       | Kill selected process     |
| `s`       | Sort menu                 |
| `←` `→`   | Cycle tabs (proc/net/disk)|
| `Esc`     | Back / close menu         |
| `q`       | Quit                      |

**Config:** `~/.config/btop/btop.conf` (set theme to catppuccin_mocha)

---

## yq — YAML/JSON/TOML Processor

Same syntax as `jq` but for YAML. Also reads JSON, TOML, XML.

```bash
# Read a value
yq '.services.api.image' docker-compose.yml

# Read nested array
yq '.packages.darwin.brews[]' packages.yaml

# Update a value in place
yq -i '.version = "2.0"' config.yaml

# Convert YAML to JSON
yq -o=json config.yaml

# Convert JSON to YAML
yq -P config.json

# Merge two YAML files
yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' base.yaml override.yaml

# Filter array items
yq '.items[] | select(.name == "foo")' data.yaml

# Count items
yq '.items | length' data.yaml

# Add an element to an array
yq -i '.packages.common += ["newpkg"]' packages.yaml

# Delete a key
yq -i 'del(.unwanted_key)' config.yaml

# Read TOML files
yq -p=toml '.section.key' config.toml

# Env variable substitution
yq '.image = env(IMAGE_TAG)' deploy.yaml
```

**Key differences from jq:**
- `-i` for in-place edit (like `sed -i`)
- `-p=toml` / `-p=json` to set input format
- `-o=json` / `-o=toml` to set output format
- `.[]` iterates arrays, same as jq

---

## tldr — Simplified Man Pages

Community-maintained cheatsheets for common commands. Shows practical examples instead of full documentation.

```bash
# Basic usage
tldr tar                      # How to use tar
tldr docker compose           # Multi-word commands work
tldr git stash                # Git subcommands

# Update the local cache (do this first time)
tldr --update

# List all available pages
tldr --list

# Search pages
tldr --list | grep docker

# Show a specific platform's version
tldr -p linux iptables
tldr -p osx pbcopy
```

**When to use `tldr` vs `man`:**
- `tldr` — "how do I do X?" (quick examples)
- `man` — "what does flag --foo do?" (full reference)

---

## dust — Disk Usage Analyzer

Visual, intuitive `du` replacement. Shows a bar chart of what's eating space.

```bash
# Current directory (default)
dust

# Specific path
dust ~/Projects

# Limit depth
dust -d 2

# Show only top N entries
dust -n 10

# Show apparent size (not disk usage)
dust -s

# Reverse sort (smallest first)
dust -r

# Ignore hidden files
dust -i

# Show files, not just directories
dust -f

# Ignore specific directories
dust -X node_modules -X .git

# Combine: top 15 items, depth 2, ignore node_modules
dust -n 15 -d 2 -X node_modules ~/Projects
```

**Common patterns:**
```bash
# What's eating my disk?
dust -n 20 ~

# Which project is the heaviest?
dust -d 1 ~/Projects

# Find bloated node_modules
dust -d 3 -X .git ~/Projects/myapp
```

---

## difftastic (difft) — Structural Diff

AST-aware diff tool. Understands code structure instead of comparing lines. Highlights actual semantic changes.

```bash
# Compare two files
difft old.ts new.ts

# Use with git (one-time)
git difftool --tool=difftastic

# Use with git (set as default difftool)
# Already in gitconfig if you add:
#   [diff] tool = difftastic
#   [difftool "difftastic"] cmd = difft "$LOCAL" "$REMOTE"

# Compare directories
difft old_dir/ new_dir/

# Force a specific language parser
difft --language javascript file1 file2

# Limit context lines
difft --context 3 old.ts new.ts

# Color output modes
difft --color always old.ts new.ts   # Force color
difft --display side-by-side old.ts new.ts  # Side by side (default)
difft --display inline old.ts new.ts        # Inline
```

**When to use `difft` vs `delta`:**
- `delta` — Line-based diffs with syntax highlighting (daily git use)
- `difft` — When you need to understand *what changed structurally* (refactors, moves, renames)

**Supported languages:** TypeScript, JavaScript, Rust, Go, Python, JSON, YAML, CSS, HTML, SQL, Lua, Bash, and 50+ more.

---

## hyperfine — Command Benchmarking

Statistical benchmarking tool. Runs commands multiple times, handles warmup, and compares results.

```bash
# Benchmark a single command
hyperfine 'sleep 0.3'

# Compare two commands
hyperfine 'fd --type f' 'find . -type f'

# Set number of runs
hyperfine --runs 5 'pnpm build'

# Warmup runs (fills caches)
hyperfine --warmup 3 'cat largefile | wc -l'

# Compare with labels
hyperfine -n 'ripgrep' 'rg pattern' -n 'grep' 'grep -r pattern .'

# Export results
hyperfine 'command' --export-markdown bench.md
hyperfine 'command' --export-json bench.json

# Prepare command (runs before each benchmark, not timed)
hyperfine --prepare 'sync; echo 3 | sudo tee /proc/sys/vm/drop_caches' 'cat bigfile'

# Shell startup time (useful for dotfiles tuning)
hyperfine 'zsh -i -c exit' 'bash -i -c exit'

# Ignore failures
hyperfine --ignore-failure 'flaky-command'

# Parameter scan
hyperfine --parameter-scan threads 1 8 'make -j {threads}'
```

**Common patterns:**
```bash
# Is my shell fast?
hyperfine 'zsh -i -c exit'

# Which build tool is faster?
hyperfine -n pnpm 'pnpm build' -n npm 'npm run build'

# Did my optimization help?
hyperfine 'git checkout main -- script.sh && ./script.sh' 'git checkout feat -- script.sh && ./script.sh'
```

---

## MANPAGER — Syntax-Highlighted Man Pages

Already configured in zshrc. Man pages now render with bat's syntax highlighting.

```bash
# Just use man as usual — bat handles the rest
man git
man tmux
man zsh

# If you need plain output (piping, etc.)
MANPAGER=cat man git
```

---

## Starship Prompt — New Modules

Two new modules added to the prompt:

**Python** — Shows version when in a Python project (detects `requirements.txt`, `pyproject.toml`, `.python-version`, `Pipfile`, `__init__.py`).

**Package** — Shows the version from `package.json` when in a Node project. Useful in monorepos to see which package you're in.

Prompt now shows: `directory > git > node > python > rust > package > docker > duration`
