local componente = require("eduardo.lualine.componentes")
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      "neo-tree","TelescopePrompt","dashboard","help","qt"
    },
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { componente.branch },
    lualine_c = { componente.diff },
    lualine_x = { componente.diagnostics, componente.lsp, componente.spaces, componente.filetype },
    lualine_y = { componente.location },
    lualine_z = { componente.filename },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
