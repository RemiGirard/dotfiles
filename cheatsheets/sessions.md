# Sessions, Worktrees & Agents Cheatsheet

## Mental Model

```
One tmux session = one project (or worktree)
Project layouts prepare windows for: editor, server, docker, AI, terminal
The windows start empty; launch only the tools that project needs
Switch between sessions = switch between projects
```

## Quick Start

```bash
ts                       # fuzzy-find Git root/worktree, open session
tp ~/Projects/myapp      # prepare named empty windows
wta feature-auth         # create worktree + session for a branch
Ctrl+Space s             # switch between sessions
```

## Tmux Session Commands

| Key / Alias           | Action                                         |
| --------------------- | ---------------------------------------------- |
| `Ctrl+Space f` / `ts` | Fuzzy-find a Git root/worktree, open session |
| `Ctrl+Space P` / `tp` | Prepare a named-window project layout         |
| `Ctrl+Space s`        | Session picker                                 |
| `Ctrl+Space (` / `)`  | Prev/next session                              |
| `tl`                  | List sessions                                  |
| `ta name`             | Attach to session                              |
| `tk name`             | Kill session                                   |

## Project Session Layout

```
Session: "myapp"
  Window 1 [editor] -> start your editor
  Window 2 [server] -> start the dev server
  Window 3 [docker] -> optional; only when a Compose file exists
  Window 4 [agent]  -> start Codex or another agent
  Window 5 [term]   -> general terminal
```

When creating a session, `tmux-project --port 3001` exports `PORT=3001` into
its pane shells. It does not start a server or any other command automatically,
and reattaching does not rewrite an existing pane's environment.

## Worktree + Session Management

Worktrees = multiple branches checked out at once, each with its own tmux session.

| Command                       | Action                                    |
| ----------------------------- | ----------------------------------------- |
| `wta branch`                  | Create worktree + tmux session for branch |
| `wta branch --port 3001`      | Same, with custom port                   |
| `wtl`                         | List worktrees (shows session status)     |
| `wts`                         | Fuzzy-find and switch to a worktree       |
| `wtr branch`                  | Remove worktree + kill session            |
| `wt clean`                    | Remove all merged worktrees               |

Branch names containing `/` are normalized for filesystem-safe sibling
directories. For example, `wta feature/auth` uses a path such as
`~/Projects/myapp-feature-auth` while keeping the Git branch name unchanged.

## Example: Parallel AI Work

```bash
cd ~/Projects/myapp

# Create worktrees for two features
wta feature-auth --port 3001
wta feature-payments --port 3002

# Result:
#   ~/Projects/myapp-feature-auth/       (worktree)
#   ~/Projects/myapp-feature-payments/   (worktree)
#   Session: myapp-feature-auth          (port 3001)
#   Session: myapp-feature-payments      (port 3002)

# Switch between them:
Ctrl+Space s

# Start one agent in each worktree's agent window:
#   Session 1, Window 4: codex (auth code)
#   Session 2, Window 4: codex (payments code)

# Clean up:
wtr feature-auth
wtr feature-payments
```

## Port Convention

| Branch           | Port |
| ---------------- | ---- |
| main             | 3000 |
| feature-auth     | 3001 |
| feature-payments | 3002 |
| feature-ui       | 3003 |

## Port Management

| Command         | Action                    |
| --------------- | ------------------------- |
| `ports`         | Show all listening ports  |
| `port 3000`     | Show what's on port 3000  |
| `killport 3000` | Kill process on port 3000 |
