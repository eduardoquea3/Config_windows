local icon = require("eduardo.icons")

function hide()
  return vim.o.columns > 100
end

return {
  mode = {
    function()
      return " " .. icon.ui.Vim .. " "
    end,
    padding = { left = 0, right = 0 },
    color = {},
    cond = nil,
  },
  branch = {
    "b:gitsigns_head",
    icon = icon.git.Branch,
    color = { gui = "bold" },
  },
  filename = {
    "filename",
    color = {},
    cond = nil,
  },
  diff = {
    "diff",
    symbols = {
      added = icon.git.LineAdded .. " ",
      modified = icon.git.LineModified .. " ",
      removed = icon.git.LineRemoved .. " ",
    },
    padding = { left = 2, right = 1 },
    diff_color = {
      added = { fg = "#43b933" },
      modified = { fg = "#0180cc" },
      removed = { fg = "#b32817" },
    },
    cond = nil,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = icon.diagnostics.BoldError .. " ",
      warn = icon.diagnostics.BoldWarning .. " ",
      info = icon.diagnostics.BoldInformation .. " ",
      hint = icon.diagnostics.BoldHint .. " ",
    },
    -- cond = conditions.hide_in_width,
  },
  lsp = {
    function()
      local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      local formatters = require("eduardo.lualine.null_ls")
      local supported_formatters = formatters.list_formater(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      local linters = require("eduardo.lualine.null_ls")
      local supported_linters = linters.list_linter(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      local unique_client_names = vim.fn.uniq(buf_client_names)

      local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"

      return language_servers
    end,
    color = { gui = "bold" },
    cond = hide,
  },
  location = { "location" },
  progress = {
    "progress",
    fmt = function()
      return "%P/%L"
    end,
    color = {},
  },

  spaces = {
    function()
      local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
      return icon.ui.Tab .. " " .. shiftwidth
    end,
    padding = 1,
  },
  encoding = {
    "o:encoding",
    fmt = string.upper,
    color = {},
    cond = hide,
  },
  filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } },
  scrollbar = {
    function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    padding = { left = 0, right = 0 },
    color = "SLProgress",
    cond = nil,
  },
}
