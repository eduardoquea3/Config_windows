local lspconfig = require("lspconfig")

local handler = require("eduardo.lsp.handler")
local lsp_attach = require("eduardo.lsp.attach")
local tailwind = require("eduardo.lsp.tailwind")

local lsp_flags = {
  debounce_text_changes = 150,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local default = {
  capabilities = capabilities,
  on_attach = lsp_attach,
  flags = lsp_flags,
  handlers = handler,
}

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = lsp_attach,
  flags = lsp_flags,
  handlers = handler,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})
lspconfig.jsonls.setup(default)
lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = lsp_attach,
  flags = lsp_flags,
  handlers = handler,
  cmd = { "vscode-html-language-server", "--stdio" },
})
lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = lsp_attach,
  flags = lsp_flags,
  handlers = handler,
  cmd = { "vscode-css-language-server", "--stdio" },
})
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  on_attach = lsp_attach,
  flags = lsp_flags,
  handlers = handler,
  filetypes = {
    "astro",
    "css",
    "html",
    "htmldjango",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "typescriptreact",
    "vue",
  },
})
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = lsp_attach,
  flags = lsp_flags,
  handlers = handler,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "bufnr" },
      },
    },
  },
})
lspconfig.pyright.setup(default)
lspconfig.yamlls.setup(default)
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = lsp_attach,
  flags = lsp_flags,
  handlers = handler,
  settings = {
    ["rust_analyzer"] = {
      checkOnSave = {
        allFeatures = true,
        overrideCommand = {
          "cargo",
          "clippy",
          "--workspace",
          "--message-format-json",
          "--all-targets",
          "--all-features",
        },
      },
    },
  },
})
lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = tailwind,
  flags = lsp_flags,
  handlers = handler,
  filetypes = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
})
lspconfig.astro.setup(default)
lspconfig.jdtls.setup(default)
lspconfig.csharp_ls.setup(default)
