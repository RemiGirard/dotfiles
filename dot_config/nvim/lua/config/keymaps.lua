local map = vim.keymap.set

local function search_word_under_cursor(backward)
  local word = vim.fn.expand("<cword>")
  if word == "" then
    return
  end

  vim.fn.setreg("/", "\\V\\<" .. vim.fn.escape(word, "\\") .. "\\>")
  vim.opt.hlsearch = true
  vim.cmd.normal({ backward and "Nzzzv" or "nzzzv", bang = true })
end

local function jump_usage(count)
  count = count or 1
  if package.loaded["snacks"] and Snacks.words.is_enabled() then
    local words, current = Snacks.words.get()
    if current then
      Snacks.words.jump(count, true)
      return
    end
  end

  search_word_under_cursor(count < 0)
end

map("n", ";", ":", { desc = "Command mode with ;" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "kj", "<Esc>", { desc = "Exit insert mode" })

map("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })
-- NOTE: <C-d>/<C-u> handled by Snacks.scroll (plugins/ui.lua) for smooth scrolling
map("n", "n", "nzzzv", { desc = "Next search (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search (centered)" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("x", "<leader>p", '"_dP', { desc = "Paste without yank" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy line to clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yank" })

-- NOTE: <leader>w is LazyVim's window prefix; use <C-s> to save instead
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map("n", "U", "<C-r>", { desc = "Redo" })

map("n", "]q", "<cmd>cnext<cr>zz", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<cr>zz", { desc = "Prev quickfix" })
map("n", "gn", function() jump_usage(vim.v.count1) end, { desc = "Next usage/occurrence" })
map("n", "gN", function() jump_usage(-vim.v.count1) end, { desc = "Prev usage/occurrence" })

map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

