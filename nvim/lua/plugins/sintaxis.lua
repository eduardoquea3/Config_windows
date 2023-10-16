return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "c_sharp",
          "css",
          "html",
          "http",
          "java",
          "javascript",
          "json",
          "kotlin",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "yaml",
        },
        ignore_install = { "luadoc", "wgsl_bevy" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = false,
        },
      })
    end,
  },
  "tpope/vim-surround",
  "mg979/vim-visual-multi",
}
