local function reference_lines(item)
  local line = item.line or ""
  local file = item.file
  local lnum = item.pos and item.pos[1]

  if not file or not lnum then
    return { line }, 1
  end

  local first = math.max(1, lnum - 8)
  local last = lnum + 2
  local lines

  if item.buf and vim.api.nvim_buf_is_valid(item.buf) and vim.api.nvim_buf_is_loaded(item.buf) then
    lines = vim.api.nvim_buf_get_lines(item.buf, first - 1, last, false)
  else
    local ok, file_lines = pcall(vim.fn.readfile, file, "", last)
    if ok then
      lines = vim.list_slice(file_lines, first, last)
    end
  end

  return lines or { line }, lnum - first + 1
end

local function is_import_reference(item)
  local line = item.line or ""
  if line:match("^%s*import%s") or line:match("^%s*export%s+.*%s+from%s") or line:match("require%s*%(") then
    return true
  end

  local lines, idx = reference_lines(item)
  for i = idx, 1, -1 do
    local current = lines[i] or ""
    if current:match("^%s*import%s") or current:match("^%s*export%s+{") then
      return true
    end
    if i ~= idx and current:match(";") then
      break
    end
    if current:match("^%s*function%s") or current:match("^%s*class%s") then
      break
    end
  end

  return false
end

return {
  -- Smooth scrolling (Snacks.scroll, built into LazyVim)
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          lsp_references = {
            transform = function(item)
              item.import_ref = is_import_reference(item)
              item.import_ref_sort = item.import_ref and 1 or 0
            end,
            sort = {
              fields = { "import_ref_sort", "score:desc", "idx" },
            },
            format = function(item, picker)
              local ret = Snacks.picker.format.file(item, picker)
              if item.import_ref then
                Snacks.picker.highlight.insert_hl(ret, "Comment")
              end
              return ret
            end,
          },
        },
      },
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
