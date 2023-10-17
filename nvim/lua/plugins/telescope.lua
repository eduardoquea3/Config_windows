return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.0",
  event = "VeryLazy",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/popup.nvim",
    {
      "nvim-lua/plenary.nvim",
      cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" },
      lazy = true,
    },
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local icon = require("eduardo.icons")
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close,
          },
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            -- ["<C-q>"] = actions.close,
            ["<C-e>"] = actions.select_default,
          },
        },
        vimgrep_arugments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        prompt_prefix = icon.ui.Telescope .. "  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
      --[[ pickers = {
        find_files = {
          find_commadn = { "rg", "--files", "--hidden", "--glob", "--line-number" },
        },
        file_browser = {
          find_commadn = { "--hidden", "--line-number", "--files", "rg" },
        },
      }, ]]
      extensions = {
        file_browser = {
          mappings = {
            ["i"] = {
              ["<C-l>"] = require("telescope").extensions.file_browser.actions.change_cwd,
              ["<C-h>"] = require("telescope").extensions.file_browser.actions.change_cwd,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      },
    })
    require("telescope").load_extension("project")
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("ui-select")
  end,
}
