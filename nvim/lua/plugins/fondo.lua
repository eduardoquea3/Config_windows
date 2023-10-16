return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local function key(shortcut)
      shortcut.icon_hl = shortcut.icon_hl or 'Title'
      shortcut.desc_hl = shortcut.desc_hl or 'String'
      shortcut.key_hl = shortcut.key_hl or 'Keyword'
      return shortcut
    end
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "",
          "",
          "",
          "",
          " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
          " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
          " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
          " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
          " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
          " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
          "",
          "",
        },
        center = {
          key({ icon = " ", desc = "Find Files", key = "f", action = "Telescope find_files" }),
          key({ icon = " ", desc = "Find Oldfiles", key = "o", action = "Telescope oldfiles" }),
          key({ icon = " ", desc = "Find Word", key = "g", action = "Telescope live_grep" }),
          key({ icon = "󰒲 ", desc = "Plugins", key = "<leader>lp", action = "Lazy" }),
          key({ icon = " ", desc = "Project", key = "p", action = "Telescope project" }),
          key({ icon = " ", desc = "Help", key = "fh", action = "Telescope help_tags" }),
          key({ icon = " ", desc = "Quit", key = "q", action = "quit" }),
        },
        footer = { "🎉 No Code, No Bug 🎉", "🎉 如无必要，勿增实体 🎉" },
      },
    })
  end,
}
