return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "asm-lsp",
        "bash-language-server",
        "csharp-language-server",
        "mesonlsp",
        "debugpy",
      },
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    opts = {
      inlay_hints = {
        inline = true,
        only_current_line = true,
      },
    },
  },
}
