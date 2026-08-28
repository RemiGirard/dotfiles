# Global working agreements

- Read and follow the closest repository-specific `AGENTS.md` before acting.
- Preserve unrelated dirty work. Stage only files that belong to the requested change, then report staged and unstaged state together with the validation performed.
- Never expose secrets or include credentials in commands, logs, patches, commits, or messages.
- Distinguish verified results from partial validation, inference, and blockers.
- Use subagents for independent, read-heavy work when useful; keep a single writer for overlapping files.
- Create pull requests as drafts unless the user explicitly asks for a ready-for-review pull request.

## Fulll frontend conventions

When working in a Fulll frontend repository, and when closer repository guidance does not override these rules:

- Name issue branches `<type>/<issue-number>-<short-kebab-case-name>`, using `feat` for features and `fix` for fixes.
- Follow the repository's established Conventional Commit scope, commonly `<type>(<frontend-scope>): <description>` or an issue-number scope.
- When a task is explicitly frontend-only, leave `back-end/` and `backend/` unchanged and report that their diff is empty. Backend work is allowed only when it is explicitly in scope.
