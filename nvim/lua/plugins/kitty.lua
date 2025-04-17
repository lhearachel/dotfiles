return {
  {
    "knubie/vim-kitty-navigator",
    build = {
      "cp ./*.py ~/.config/kitty",
    },
    keys = {
      { "<C-h>", ":KittyNavigateLeft <CR>", { nnoremap = true, silent = true } },
      { "<C-j>", ":KittyNavigateDown <CR>", { nnoremap = true, silent = true } },
      { "<C-k>", ":KittyNavigateUp <CR>", { nnoremap = true, silent = true } },
      { "<C-l>", ":KittyNavigateRight <CR>", { nnoremap = true, silent = true } },
    },
  },
}
