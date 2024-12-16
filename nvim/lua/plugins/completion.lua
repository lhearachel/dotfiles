return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select-and-accept", "fallback" },
        ["<C-c>"] = { "cancel", "fallback" },
      },
      completion = {
        list = {
          selection = "auto_insert",
        },
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
}
