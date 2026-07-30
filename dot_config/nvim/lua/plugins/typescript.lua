local function location_range(location)
  return location.targetSelectionRange or location.targetRange or location.range
end

local function location_uri(location)
  return location.targetUri or location.uri
end

local function cursor_in_range(cursor, range)
  if not range then
    return false
  end

  local line = cursor[1] - 1
  local char = cursor[2]
  local start = range.start
  local finish = range["end"]

  if line < start.line or line > finish.line then
    return false
  end
  if line == start.line and char < start.character then
    return false
  end
  if line == finish.line and char > finish.character then
    return false
  end

  return true
end

local function smart_definition_or_references()
  local buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()
  local clients = vim.lsp.get_clients({ bufnr = buf, method = "textDocument/definition" })

  if #clients == 0 then
    Snacks.picker.lsp_definitions()
    return
  end

  local client = clients[1]
  local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
  local cursor = vim.api.nvim_win_get_cursor(win)
  local current_uri = vim.uri_from_bufnr(buf)

  client:request("textDocument/definition", params, function(err, result)
    if err or not result or vim.tbl_isempty(result) then
      vim.schedule(function()
        Snacks.picker.lsp_definitions()
      end)
      return
    end

    local locations = vim.islist(result) and result or { result }
    local on_definition = vim.iter(locations):any(function(location)
      return location_uri(location) == current_uri and cursor_in_range(cursor, location_range(location))
    end)

    vim.schedule(function()
      if on_definition then
        Snacks.picker.lsp_references()
      else
        Snacks.picker.lsp_definitions()
      end
    end)
  end, buf)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "gd", smart_definition_or_references, desc = "Smart definition/references", nowait = true },
            { "gr", function() Snacks.picker.lsp_references() end, desc = "References", nowait = true },
            { "grr", function() Snacks.picker.lsp_references() end, desc = "References" },
          },
        },
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
            javascript = {
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
          },
        },
      },
    },
  },
}
