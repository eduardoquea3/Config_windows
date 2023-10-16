vim.g.mapleader = " "

vim.opt.mouse = "a"
vim.opt.guifont = "DankMono Nerd Font"

vim.foldlevelstart = 99
if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.splitkeep = "screen"
  vim.opt.shortmess = "filnxtToOFWIcC"
end
vim.opt.listchars:append("space: ")
vim.opt.listchars:append("eol: ")

local default_options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  foldmethod = "manual",
  foldexpr = "",
  guifont = "monospace:h17",
  hidden = true,
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 1000,
  title = true,
  undofile = true,
  updatetime = 100,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = true,
  scrolloff = 8,
  sidescrolloff = 8,
  showcmd = false,
  ruler = false,
  laststatus = 3,
  relativenumber = true,
  softtabstop = 2,
  smartindent = true,
  errorbells = false,
  autowrite = true,
  list = true,
  equalalways = false,
  timeout = true,
  foldcolumn = "1",
  foldlevel = 99,
  foldenable = true,
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  shell = "pwsh",
}

for k, v in pairs(default_options) do
  vim.opt[k] = v
end
