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
  -- Move statusline to top via winbar
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local sections = vim.deepcopy(opts.sections or {})
      opts.winbar = sections
      opts.inactive_winbar = {
        lualine_c = { "filename" },
      }
      opts.sections = {}
      opts.inactive_sections = {}
      opts.options = opts.options or {}
      opts.options.globalstatus = false
      opts.options.disabled_filetypes = opts.options.disabled_filetypes or {}
      opts.options.disabled_filetypes.winbar = { "snacks_dashboard", "neo-tree", "lazy", "mason", "toggleterm", "Trouble" }
      vim.o.laststatus = 0
    end,
  },
}
