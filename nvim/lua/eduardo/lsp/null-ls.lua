local null_ls = require("null-ls")
local b = null_ls.builtins

null_ls.setup({
  sources = {
    --formatting
    b.formatting.autopep8,
    b.formatting.xmlformat,
    b.formatting.taplo,
    b.formatting.eslint.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    }),
    b.formatting.prettier.with({
      filetypes = {
        "css",
        "html",
        "json",
        "yaml",
        "markdown",
      },
    }),
    b.formatting.stylua.with({
      filetypes = {
        "lua",
      },
    }),
    b.formatting.astyle.with({
      filetypes = {
        "java",
        "cs",
        "cpp",
        "c",
      },
    }),

    --diagnostics
    b.diagnostics.eslint.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    }),
    b.diagnostics.luacheck.with({
      extra_args = { "--config-path", vim.fn.expand("~/AppData/Local/nvim/.luacheckrc") },
    }),
    b.diagnostics.flake8,
  },
})
