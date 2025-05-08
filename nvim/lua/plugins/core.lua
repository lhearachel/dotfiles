return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "classic",
    },
  },
  {
    "williamboman/mason.nvim",
    optional = false,
    version = "^1.0.0",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "^1.0.0",
  }
}
