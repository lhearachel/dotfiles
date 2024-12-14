return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "dockerfile",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dockerls = {},
      },
    },
  },
}
