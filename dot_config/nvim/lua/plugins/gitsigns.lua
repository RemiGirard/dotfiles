return {
  -- Always-on greyed inline blame for the current line.
  -- Toggle at runtime with :Gitsigns toggle_current_line_blame
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
        virt_text_pos = "eol",
      },
    },
  },
}
