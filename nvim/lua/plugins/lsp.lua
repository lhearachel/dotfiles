return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "clangd",
        "dockerfile-language-server",
        "jedi-language-server",
        "json-lsp",
        "marksman",
        "rust-analyzer",
        "swift-mesonlsp",
        "taplo",
        "yaml-language-server",
      },
    },
  },
}
