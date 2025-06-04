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
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
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
  },
  {
    -- @lhearachel: Overriding the `build` command used for Treesitter to ensure
    -- that asciidoc is still installed on a package update.
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate | TSInstall asciidoc asciidoc_inline query",
    lazy = false,
  }
}
