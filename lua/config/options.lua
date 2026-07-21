local opt = vim.opt

-- Identacion
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- UI
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 250

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Clipboard compartido
opt.clipboard = "unnamedplus"

-- Folding

opt.foldlevelstart = 99
