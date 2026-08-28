# Codex Cheatsheet

Shortcuts are shown for macOS. On Linux/Windows, use `Ctrl` where Codex uses `CmdOrCtrl`.

## Launch

```bash
codex                    # Start interactive CLI in the current directory
codex "fix the tests"    # Start with an initial prompt
codex app                # Open the desktop app
codex resume             # Resume a previous CLI session
codex resume --last      # Resume the most recent CLI session
codex exec "..."         # Run non-interactively
codex review             # Run a non-interactive code review
codex doctor             # Diagnose install/config/auth/runtime
```

## App Basics

| Keys                  | Action                 |
| --------------------- | ---------------------- |
| `Cmd+Shift+/`         | Show keyboard shortcuts |
| `Cmd+K`               | Command menu           |
| `Cmd+Shift+P`         | Command menu           |
| `Cmd+,`               | Settings               |
| `Cmd+N`               | New chat               |
| `Cmd+Shift+O`         | New chat               |
| `Cmd+Alt+N`           | Quick chat             |
| `Cmd+Shift+N`         | New window             |
| `Cmd+W`               | Close tab/window       |

## Find And Open

| Keys          | Action                    |
| ------------- | ------------------------- |
| `Cmd+G`       | Search chats              |
| `Cmd+P`       | Search files              |
| `Cmd+F`       | Find in current thread    |
| `Cmd+O`       | Open folder               |
| `Cmd+L`       | Focus browser address bar |
| `Cmd+R`       | Reload browser page       |
| `Cmd+Shift+R` | Force reload browser page |

## Panels

| Keys            | Action               |
| --------------- | -------------------- |
| `Cmd+B`         | Toggle sidebar       |
| `Cmd+Shift+E`   | Toggle file tree     |
| `Cmd+J`         | Toggle bottom panel  |
| ``Ctrl+` ``     | Open terminal        |
| `Cmd+T`         | Open browser tab     |
| `Cmd+Shift+B`   | Toggle browser panel |
| `Cmd+Alt+B`     | Toggle side panel    |
| `Ctrl+Shift+G`  | Open review tab      |

## Chat Navigation

| Keys              | Action             |
| ----------------- | ------------------ |
| `Cmd+1` ... `9`   | Go to chat slot    |
| `Cmd+Shift+[`     | Previous chat      |
| `Cmd+Shift+]`     | Next chat          |
| `Ctrl+Shift+Tab`  | Previous recent    |
| `Ctrl+Tab`        | Next recent        |
| `Cmd+[`           | Back               |
| `Cmd+]`           | Forward            |

## Thread Actions

| Keys              | Action                     |
| ----------------- | -------------------------- |
| `Cmd+Shift+A`     | Archive chat               |
| `Cmd+Alt+P`       | Pin/unpin chat             |
| `Cmd+Alt+R`       | Rename chat                |
| `Cmd+Alt+L`       | Copy deeplink              |
| `Cmd+Alt+C`       | Copy session ID            |
| `Cmd+Shift+C`     | Copy working directory     |
| `Cmd+Alt+Shift+C` | Copy conversation path     |

## Composer And Approvals

| Keys             | Action              |
| ---------------- | ------------------- |
| `Ctrl+Shift+M`   | Open model picker   |
| `Ctrl+Shift+V`   | Start voice mode    |
| `Ctrl+Shift+D`   | Start dictation     |
| `Enter`          | Approve prompt      |
| `Esc`            | Decline prompt      |

## CLI Options Worth Remembering

| Command / Flag                  | Use                                      |
| ------------------------------- | ---------------------------------------- |
| `codex -C ~/Projects/app`       | Start with a specific working directory  |
| `codex --add-dir ../shared`     | Add another writable directory           |
| `codex -m <model>`              | Pick a model for the session             |
| `codex --search`                | Enable web search for the run            |
| `codex --no-alt-screen`         | Keep terminal scrollback visible         |
| `codex -s workspace-write`      | Use workspace-write sandbox              |
| `codex -a on-request`           | Let Codex ask for approvals as needed    |

## Config

| File                        | Purpose                                      |
| --------------------------- | -------------------------------------------- |
| `~/.codex/config.toml`      | Main Codex config                            |
| `~/.codex/keybindings.json` | Custom app keybindings                       |
| `~/.codex/AGENTS.md`        | Shared working agreements for every project |
| `AGENTS.md`                 | Repository-specific guidance                 |
| `~/.codex/agents/*.toml`    | Personal custom-agent roles                  |

Codex combines global guidance with the `AGENTS.md` files closest to the
current working directory. Start a new task after changing those files so the
instruction chain is rebuilt. See the official [AGENTS.md documentation](https://learn.chatgpt.com/docs/agent-configuration/agents-md).

## Custom Agents

This setup manages three focused roles:

| Role               | Best use                                                |
| ------------------ | ------------------------------------------------------- |
| `repo_explorer`    | Read-only codebase mapping and evidence gathering       |
| `reviewer`         | Read-only correctness, security, and regression review  |
| `browser_debugger` | Reproduce and diagnose browser behavior without editing |

Ask Codex to delegate an independent subtask to one of these roles by name.
Keep implementation ownership in one agent when several agents are exploring
in parallel. See the official [subagents documentation](https://learn.chatgpt.com/docs/agent-configuration/subagents).

## Session Storage

```bash
du -sh ~/.codex/sessions       # Measure saved transcript storage
codex archive <session>        # Hide a session but keep its transcript
codex delete <session>         # Permanently remove it after review
```

Archiving is organizational and does not reclaim transcript space. Prefer the
supported `codex delete` command over removing session files by hand.
