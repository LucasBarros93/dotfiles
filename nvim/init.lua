-- ~/.config/nvim/init.lua

vim.opt.number = true -- mostrar número das linhas
vim.opt.relativenumber = true -- número relativo (pra navegação rápida)
vim.opt.mouse = "a" -- ativar mouse
vim.opt.clipboard = "unnamedplus" -- usar clipboard do sistema
vim.opt.expandtab = true -- converter tabs em espaços
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.undofile = true

vim.keymap.set("i", "jk", "<Esc>", { noremap = false })
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { silent = true })

vim.keymap.set("n", "<leader>o", ":put _<CR>", { silent = true })
vim.keymap.set("n", "<leader>O", ":put! _<CR>", { silent = true })

require("config.lazy")
