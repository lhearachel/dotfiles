return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "hyprlang",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hyprls = {},
      },
    },
  },
}
