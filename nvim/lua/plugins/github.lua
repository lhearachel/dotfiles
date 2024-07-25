return {
  {
    "pwntester/octo.nvim",
    keys = {
      { "<leader>o", "<cmd>Octo<cr>", desc = "Octo" },
    },
  },

  {
    "ruifm/gitlinker.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>gy", group = "yank remote URL" },
      },
    },
  },
}
