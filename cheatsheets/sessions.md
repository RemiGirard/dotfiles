# Sessions, Worktrees & Agents Cheatsheet

## Mental Model

```
One tmux session = one project (or worktree)
Each session has windows for: editor, server, docker, AI, terminal
Switch between sessions = switch between projects
```

## Quick Start

```bash
ts                       # fuzzy-find project, open session
tp ~/Projects/myapp      # create full dev layout
wta feature-auth         # create worktree + session for a branch
Ctrl+Space s             # switch between sessions
```

## Tmux Session Commands

| Key / Alias           | Action                                         |
| --------------------- | ---------------------------------------------- |
| `Ctrl+Space f` / `ts` | Sessionizer: fuzzy-find project, open session |
| `Ctrl+Space P` / `tp` | Project: create full dev layout               |
| `Ctrl+Space s`        | Session picker                                 |
| `Ctrl+Space (` / `)`  | Prev/next session                              |
| `tl`                  | List sessions                                  |
| `ta name`             | Attach to session                              |
| `tk name`             | Kill session                                   |

## Project Session Layout

```
Session: "myapp"
  Window 1 [editor] -> nvim
  Window 2 [server] -> run your dev server
  Window 3 [docker] -> (only if docker-compose exists)
  Window 4 [agent]  -> opencode / claude
  Window 5 [term]   -> general terminal
```

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

# Each AI agent only sees its worktree's code:
#   Session 1, Window 4: opencode (auth code)
#   Session 2, Window 4: claude (payments code)

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
