return {
  -- @lhearachel: Language-specific configuration files alongside LSP setup and
  -- anything else that might be necessary or useful.
  { import = "plugins.lang" },

  -- @lhearachel: Everything else here is for a filetype that does not require
  -- LSP configuration.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "asm",
        "csv",
        "desktop", -- Desktop entries
        "diff",
        "disassembly",
        "ebnf", -- EBNF grammars
        "ini",
        "just", -- casey/just
        "kdl",
        "ledger",
        "linkerscript",
        "ninja",
        "printf",
        "rasi", -- Config files for rofi
        "regex",
        "ssh_config",
        "tmux",
        "vim",
        "vimdoc",
        "xml",
      },
    },
  },
}
