return {
  -- Smooth scrolling (Snacks.scroll, built into LazyVim)
  {
    "folke/snacks.nvim",
    opts = {
      scroll = {
        animate = {
          duration = { step = 10, total = 200 },
          easing = "linear",
        },
      },
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
