# Sessions, Worktrees & Agents Cheatsheet

## Mental Model

```
One tmux session = one project (or worktree)
Each session has windows for: editor, server, docker, AI, terminal
Switch between sessions = switch between projects
```

## Quick Start

```bash
# Jump to any project (fuzzy search)
ts                       # or: Ctrl+Space f (in tmux)

# Create full dev session with all windows
tp ~/Projects/myapp      # or: Ctrl+Space P (in tmux)

# Create worktree + session for a branch
wta feature-auth --port 3001

# Switch between sessions
Ctrl+Space s             # session picker
Ctrl+Space ( / )         # prev/next session
```

## Tmux Session Commands

| Key / Command           | Action                                  |
| ----------------------- | --------------------------------------- |
| `Ctrl+Space f`          | Sessionizer: fuzzy-find project, open session |
| `Ctrl+Space P`          | Project: create full layout (editor, server, docker, AI, term) |
| `Ctrl+Space s`          | Session picker (built-in)               |
| `Ctrl+Space (` / `)`    | Prev/next session                       |
| `Ctrl+Space S`          | Create named session                    |
| `Ctrl+Space K`          | Kill current session                    |

### Shell Aliases

| Alias     | Command                       |
| --------- | ----------------------------- |
| `ts`      | `tmux-sessionizer` (fuzzy)    |
| `tp`      | `tmux-project` (full layout)  |
| `tl`      | `tmux ls`                     |
| `ta name` | `tmux a -t name`              |
| `tk name` | `tmux kill-session -t name`   |

## Worktree + Session Management

Worktrees let you have multiple branches checked out simultaneously, each in its own directory with its own tmux session.

| Alias / Command         | Action                                    |
| ----------------------- | ----------------------------------------- |
| `wta feature-auth`      | Create worktree + tmux session for branch |
| `wta feature-pay --port 3002` | Same, with custom port              |
| `wtl`                   | List worktrees (shows tmux session status) |
| `wts`                   | Fuzzy-find and switch to a worktree       |
| `wtr feature-auth`      | Remove worktree + kill tmux session       |
| `git wt clean`          | Remove all merged worktrees               |

### Example: Parallel AI Work

```bash
# In your main project repo
cd ~/Projects/myapp

# Create worktrees for two features with different ports
wta feature-auth --port 3001
wta feature-payments --port 3002

# Each gets its own:
#   ~/Projects/myapp-feature-auth/     (worktree)
#   ~/Projects/myapp-feature-payments/ (worktree)
#   tmux session: myapp-feature-auth   (editor, server:3001, docker, AI, term)
#   tmux session: myapp-feature-payments (editor, server:3002, docker, AI, term)

# Switch between them
Ctrl+Space s  # pick from session list

# In each session, Window 4 (agent):
# Run opencode or claude in the worktree context
# Each AI agent sees only its worktree's code

# When done, clean up
wtr feature-auth
wtr feature-payments
```

## Project Session Layout

When you run `tp` or `Ctrl+Space P`, you get:

```
Session: "myapp"
  Window 1 [editor] -> nvim
  Window 2 [server] -> (run your dev server here)
  Window 3 [docker] -> (only if docker-compose.yml exists)
  Window 4 [agent]  -> (run opencode / claude here)
  Window 5 [term]   -> general terminal
```

Switch windows: `Ctrl+Space 1-5` or `Ctrl+Space n/p`

## Port Management

| Command         | Action                              |
| --------------- | ----------------------------------- |
| `ports`         | Show all listening ports            |
| `port 3000`     | Show what's on port 3000            |
| `killport 3000` | Kill process on port 3000           |

### Port Convention for Worktrees

Keep a consistent pattern:

| Branch           | Port |
| ---------------- | ---- |
| main             | 3000 |
| feature-auth     | 3001 |
| feature-payments | 3002 |
| feature-ui       | 3003 |

Pass the port when creating: `wta feature-auth --port 3001`

## Agent Isolation

The key to running multiple AI agents without confusion:

1. **Each worktree = its own directory** -- the AI only sees that branch's code
2. **Each tmux session = isolated windows** -- agents don't mix
3. **Each agent in its own tmux window** -- clear separation from editor/server

### Best Practice

```
Session: myapp-feature-auth
  Window 1 [editor]:  nvim (editing auth code)
  Window 2 [server]:  pnpm dev --port 3001
  Window 4 [agent]:   opencode  <-- this AI sees only the auth worktree

Session: myapp-feature-payments
  Window 1 [editor]:  nvim (editing payments code)
  Window 2 [server]:  pnpm dev --port 3002
  Window 4 [agent]:   claude    <-- different agent, different context
```

Switch between them with `Ctrl+Space s` -- each environment is fully isolated.
