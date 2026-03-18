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
  -- Move statusline to top
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.disabled_filetypes = opts.options.disabled_filetypes or {}
      opts.options.disabled_filetypes.winbar = { "snacks_dashboard", "neo-tree", "lazy", "mason" }
      -- Move sections from statusline to winbar
      opts.winbar = opts.sections
      opts.sections = {}
      opts.options.globalstatus = true
      vim.o.laststatus = 0
    end,
  },
}
