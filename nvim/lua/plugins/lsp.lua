return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "csharp-language-server",
        "dockerfile-language-server",
        "json-lsp",
        "marksman",
        "pylama",
        "pyright",
        "rust-analyzer",
        "mesonlsp",
        "taplo",
        "yaml-language-server",
      },
    },
  },
}
