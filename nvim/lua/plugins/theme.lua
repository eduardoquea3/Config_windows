return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- require("eduardo.catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic=true },
        keywords = { italic=true },
        functions = { italic=true },
        variables = { italic=true },
      },
      on_highlights = function (hl,c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end
    },
    config = function (_,opts)
      require("tokyonight").setup(opts)
      vim.cmd[[colorscheme tokyonight]]
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      config=function ()
        require("eduardo.devicons")
      end
    },
    config = function()
      require("eduardo.lualine")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    config = function()
      require("eduardo.bufferline")
    end,
  },
}
