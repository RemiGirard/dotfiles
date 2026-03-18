return {
  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
    },
  },
  -- Push nvim statusline into tmux bar
  {
    "vimpostor/vim-tpipeline",
    lazy = false,
    init = function()
      vim.g.tpipeline_autoembed = 1
      vim.g.tpipeline_restore = 1
      vim.opt.laststatus = 0
      vim.opt.showmode = false
    end,
  },
}
