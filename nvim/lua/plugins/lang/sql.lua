return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "sql",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sqls = {},
      },
    },
  },
}
