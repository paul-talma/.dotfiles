local opt = vim.opt

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
opt.relativenumber = true -- TODO: change to absolute in insert mode
opt.number = true
opt.numberwidth = 2 -- set number column width to 2 {default 4}

-- block cursor
opt.guicursor = "a:block-blinkwait700-blinkon300-blinkoff50"

-- tabs and indents
opt.tabstop = 2 -- tab width (spaces)
opt.shiftwidth = 2 -- indent width (spaces)
opt.expandtab = false -- turn tabs into spaces
opt.autoindent = true -- copy indent from current line when starting a new one
opt.smartindent = true

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true -- doesn't ignore case if capital letters present

-- highlight cursor line
opt.cursorline = false

-- appearance
opt.termguicolors = true
opt.background = "dark" -- defaults scheme to dark mode
-- opt.signcolumn = "yes"
opt.showmode = false
opt.cmdwinheight = 1 -- check that this works

-- backspace
-- opt.backspace = "indent, eol, start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard by default

-- split locations
opt.splitright = true
opt.splitbelow = true

-- editing
opt.updatetime = 100
opt.wrap = true
opt.textwidth = 80
opt.breakindent = true
opt.scrolloff = 10
