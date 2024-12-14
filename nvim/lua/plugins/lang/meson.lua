return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "meson",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mesonlsp = {},
      },
    },
  },
}
