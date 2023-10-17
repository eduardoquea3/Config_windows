local opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["<c-space"] = { "ilocal", "hola" },
  g = {
    name = "git",
    j = { "<cmd>GitGutterNextHunk<cr>", "Saltar al proximo cambio" },
    k = { "<cmd>GitGutterPrevHunk<cr>", "Saltar al anterior cambio" },
  },
  ["<C-a>"] = { "zo", "Abrir pliege" },
  ["<C-c>"] = { "zc", "Cerrar pliege" },
  ["/"] = { ":SearchBoxIncSearch<cr>", "Abrir buscador" },
  ["<S-Tab>"] = { ":bprevious<cr>", "Tabular atras" },
  ["<Tab>"] = { ":bnext<cr>", "Tabular" },
  ["<C-h>"] = { "<C-w>h", "Movements" },
  ["<C-j>"] = { "<C-w>j", "Movements" },
  ["<C-k>"] = { "<C-w>k", "Movements" },
  ["<C-l>"] = { "<C-w>l", "Movements" },
  ["<C-m>"] = { require("ufo").peekFoldedLinesUnderCursor, "Previsualizar pliegue" },
  ["<C-s>"] = {
    function()
      vim.lsp.buf.format({ async = true })
    end,
    "Formateo con null-ls",
  },
  ["<A-j>"] = { ":m .+1<cr>==", "Mover abajo linea" },
  ["<A-k>"] = { ":m .-2<cr>==", "Mover arriba linea" },
  c = {
    p = { "<cmd>CccPick<cr>", "Color Picker" },
    c = { "<cmd>CccConvert<cr>", "Color convert" },
  },
}

local lopts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local lmappings = {
  ["<leader>"] = { ":Telescope buffers<cr>", "Buffers" },
  s = {
    name = "Harpoon",
    s = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Harpoon Menu",
    },
    a = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Harpoon add file",
    },
    u = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Harpoon go to file 1",
    },
    i = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Harpoon go to file 2",
    },
    j = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Harpoon go to file 3",
    },
    k = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Harpoon go to file 4",
    },
    l = {
      function()
        require("harpoon.ui").nav_file(5)
      end,
      "Harpoon go to file 5",
    },
  },
  e = { ":Neotree toggle<cr>", "Abrir neotree" },
  a = { ":WhichKey<cr>", "Mostrar atajos" },
  r = {
    r = { ":luafile %<cr>", "Actualizar config" },
  },
  q = { ":confirm qall<cr>", "Cerrar neovim" },
  w = { ":w<cr>", "Guardar archivo" },
  g = {
    name = "Lazygit",
    g = { ":LazyGit<cr>", "Abrir lazygit" },
  },
  v = {
    name = "buffer",
    d = { ":bdelete<cr>", "Eliminar buffer" },
  },
  f = {
    name = "Telecope",
    f = { ":Telescope find_files<cr>", "Buscar Archivos" },
    g = { ":Telescope live_grep<cr>", "Buscar por Palabras" },
    d = { ":Telescope diagnostics<cr>", "Buscar por Diagnosticos" },
    p = { ":Telescope project<cr>", "Ver Projectos" },
    b = { ":Telescope file_browser hidden=true<cr>", "Ver Carpetas" },
    o = { ":Telescope oldfiles<cr>", "Recientes" },
    s = { ":Telescope lsp_document_symbols<cr>", "Simbolos en el documento" },
  },
  m = {
    name = "Markdown",
    i = { "<cmd>MarkdownPreview<cr>", "Previsualizar markdown" },
    s = { "<cmd>MarkdownPreviewStop<cr>", "Parar previsualización markdown" },
    c = { "<cmd>MarkdownPreviewToggle<cr>", "Cambiar previsualización markdown" },
  },
}

local topts = {
  mode = "t",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local tmappings = {
  ["<Esc>"] = { "<C-\\><C-n>", "Modo normal terminal" },
}

local vopts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local vmappings = {
  ["<leader>"] = {
    s = { ":SearchBoxIncSearch visual_mode=true<cr>", "Searching" },
  },
}

local iopts = {
  mode = "i",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local imappings = {
  ["<A-h>"] = { "<left>", "Movements" },
  ["<A-j>"] = { "<down>", "Movements" },
  ["<A-k>"] = { "<up>", "Movements" },
  ["<A-l>"] = { "<right>", "Movements" },
  ["<C-b>"] = { "<C-left>", "Movements" },
  ["<C-e>"] = { "<C-right>", "Movements" },
  ["<C-c>"] = { "<Esc><cmd>CccPick<cr>", "Color-Picker" },
  ["<C-j>"] = { "<Esc><cmd>m .+1<cr>==i", "Mover abajo linea" },
  ["<C-l>"] = { "<Esc>", "Mode Normal" },
  ["<C-k>"] = { "<Esc><cmd>m .-2<cr>==i", "Mover arriba linea" },
  ["<C-s>"] = { "<Esc><cmd>wa<cr>i", "Guardar archivo" },
}

local which_key = require("which-key")

which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(tmappings, topts)
which_key.register(imappings, iopts)
which_key.register(lmappings, lopts)
