local default_font = "DankMono Nerd Font"
local default_size = 16

vim.g.neovide_transparency = 0.65

local function set_font(font, size)
  font = font or default_font
  size = size or default_size

  vim.o.guifont = string.format("%s:h%d", font, size)
end

set_font()

local maps = {
  f0 = 10,
  f1 = 12,
  f2 = 14,
  f3 = 16,
  f4 = 18,
  f6 = 20,
}

for key, value in pairs(maps) do
  vim.keymap.set("n", "<leader>" .. key, function()
    set_font(nil, value)
  end)
end
