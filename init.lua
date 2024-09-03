-- Always use 4 spaces instead of a TAB character
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set nowrap")

-- Show relative line numbers in normal mode, absolute in insert mode
vim.cmd("set relativenumber")
vim.cmd("autocmd InsertEnter * :set number norelativenumber")
vim.cmd("autocmd InsertLeave * :set relativenumber")

-- Always leave a buffer of lines at the top and bottom of the screen
vim.cmd("set scrolloff=8")

-- Stop highlighting search results after hitting ESC
vim.cmd("nnoremap <esc> :noh<return><esc>")

-- Decrease updatetime significantly to improve LSP diagnostic speed
vim.o.updatetime = 250

-- Fold options for nvim-ufo
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
