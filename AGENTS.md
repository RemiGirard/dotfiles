# Chezmoi repository guidance

- Treat this repository as the source of truth. Edit chezmoi source files and templates, not their rendered copies in the home directory.
- Preserve unrelated user changes. Inspect both Git state and `chezmoi status` before and after making changes.
- Keep templates portable across Darwin and Linux. Run `dotfiles-check` after changes; use `dotfiles-check --full` when Neovim configuration changes.
- Never print, decrypt, or commit plaintext secrets. Keep sensitive values in the repository's encrypted sources and preserve the plaintext-secret denylist.
- Treat live-file drift as potentially intentional. Review `chezmoi diff` and import wanted live changes before applying over them; prefer a targeted apply when practical.
- Keep persistent QA artifacts under `.artifacts/` and out of committed source; use the system temporary directory for disposable validation scratch space.
