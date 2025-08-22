return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",

    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },

    opts = {
      open_for_directories = true,
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
