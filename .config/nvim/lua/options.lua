local opt = vim.opt

-- autocomplete
opt.autocomplete = true
opt.complete:append("o")
opt.completeopt = { "fuzzy", "menu", "menuone", "noselect", "nearest", "popup" }
opt.pummaxwidth = 60
opt.pumheight = 5

-- line numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2

-- tabs and indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- appearance
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "no"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard by default

-- split locations
opt.splitright = true
opt.splitbelow = true

-- conceal level
opt.conceallevel = 0

-- line wrap and length
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

-- scrolloff
opt.scrolloff = 5
