-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.snacks_animate = false
vim.g.lazyvim_picker = "auto"
vim.g.lazyvim_cmp = "auto"
vim.g.ai_cmp = false

local opt = vim.opt
opt.shiftwidth = 4
opt.tabstop = 4

local ft = vim.filetype
ft.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
