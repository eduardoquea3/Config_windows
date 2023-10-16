--[[ local filetype_attach = setmetatable({}, {
  __index = function()
    return function() end
  end,
}) ]]

local key = vim.keymap.set

return function(client, bufnr)
  -- local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  --vim.api.nvim_create_autocmd('BufWritePre',{
  --  buffer = bufnr,
  --  callback = function ()
  --    vim.lsp.buf.format()
  --  end
  --})

  key("n", "gd", vim.lsp.buf.definition, { desc = "Definicion" })
  -- key("n", "K", ":Lspsaga hover_doc<cr>", { desc = "Documentacion" })
  key("n", "K", vim.lsp.buf.hover, { desc = "Documentacion" })
  key("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code-Action" })
  key("i","<c-h>",vim.lsp.buf.signature_help,{buffer=0,desc="Signature Help"})
  key("n", "<leader>oo", ":SymbolsOutline<cr>", { desc = "Outline" })
  key("n", "<leader>lf", ":Telescope lsp_references<cr>", { desc = "Finder lsp" })
  key("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename lsp" })
  key("n", "[d", ":Lspsaga diagnostic_jump_prev<cr>", { desc = "Saltar al anterior" })
  key("n", "]d", ":Lspsaga diagnostic_jump_next<cr>", { desc = "Saltar al siguiente" })

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  if client.server_capabilities.inlayHintPorveder then
    vim.lsp.inlay_hint(bufnr, true)
  end
  -- filetype_attach[filetype](client, bufnr)
end
