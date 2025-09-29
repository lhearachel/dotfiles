-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("which-key").add({
  "<leader>fj",
  "<cmd>!./journal/newdaily.sh<CR>",
  desc = "New Daily Entry",
  icon = { icon = "󰈔", color = "cyan" },
})
