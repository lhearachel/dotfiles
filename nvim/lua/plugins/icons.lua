return {
  {
    "ziontee113/icon-picker.nvim",
    keys = {
      { "<leader>ia", "<cmd>IconPickerNormal alt_font<cr>", desc = "Alt Fonts" },
      { "<leader>ie", "<cmd>IconPickerNormal emoji<cr>", desc = "Emoji" },
      { "<leader>in", "<cmd>IconPickerNormal nerd_font<cr>", desc = "Nerd Font" },
      { "<leader>is", "<cmd>IconPickerNormal symbols<cr>", desc = "Symbols" },
    },
    opts = {
      noremap = true,
      silent = true,
    },
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          mode = { "n" },
          { "<leader>i", group = "icons", icon = { icon = "󰞅" } },
        },
      },
    },
  },
}
