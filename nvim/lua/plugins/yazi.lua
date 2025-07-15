return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",

    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },

    keys = {
      {
        "<leader>e",
        "<cmd>Yazi cwd<cr>",
        desc = "Yazi (cwd)",
      },
    },
  }
}
