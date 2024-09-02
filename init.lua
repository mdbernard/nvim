vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set nowrap")

vim.cmd("set relativenumber")
vim.cmd("autocmd InsertEnter * :set number norelativenumber")
vim.cmd("autocmd InsertLeave * :set relativenumber")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
