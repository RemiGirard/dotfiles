return {
  -- Free Ctrl+Space for tmux prefix (LazyVim maps it to flash treesitter)
  {
    "folke/flash.nvim",
    keys = {
      { "<c-space>", false },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  desc = "Navigate left (tmux/nvim)" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>",  desc = "Navigate down (tmux/nvim)" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>",    desc = "Navigate up (tmux/nvim)" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right (tmux/nvim)" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
    },
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end,     desc = "Harpoon add file" },
      { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
      { "<leader>1",  function() require("harpoon"):list():select(1) end, desc = "Harpoon file 1" },
      { "<leader>2",  function() require("harpoon"):list():select(2) end, desc = "Harpoon file 2" },
      { "<leader>3",  function() require("harpoon"):list():select(3) end, desc = "Harpoon file 3" },
      { "<leader>4",  function() require("harpoon"):list():select(4) end, desc = "Harpoon file 4" },
      { "<leader>5",  function() require("harpoon"):list():select(5) end, desc = "Harpoon file 5" },
    },
    config = function() require("harpoon"):setup() end,
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    opts = {
      integrations = { diffview = true, telescope = true },
    },
  },
}
