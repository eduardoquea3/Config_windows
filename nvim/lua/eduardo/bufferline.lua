local icon = require("eduardo.icons")
require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    buffer_close_icon = icon.ui.Close,
    modified_icon = icon.ui.Circle,
    close_icon = icon.ui.BoldClose,
    color_icons = true,
    show_buffer_icons = true,
    always_show_bufferline = false,
    offsets = {
      {
        filetype = 'neo-tree',
        text = "File Explorer",
        highlight = "Directory",
        separator = true
      },
    },
  },
})
