return {
  {
    "knubie/vim-kitty-navigator",
    keys = {
      { "<C-h>", ":KittyNavigateLeft <CR>", { nnoremap = true, silent = true } },
      { "<C-j>", ":KittyNavigateDown <CR>", { nnoremap = true, silent = true } },
      { "<C-k>", ":KittyNavigateUp <CR>", { nnoremap = true, silent = true } },
      { "<C-l>", ":KittyNavigateRight <CR>", { nnoremap = true, silent = true } },
    },
  },
}
