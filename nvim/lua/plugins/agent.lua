return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          { "<leader>a", group = "ai", icon = { icon = "󰧑 ", color = "pink" }, mode = { "n", "v" } },
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = false }, -- @lhearachel: I don't want automatic suggestions.
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },

    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Open action palette", mode = { "n", "v" } },
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle chat agent", mode = { "n", "v" } },
      { "<leader>ap", "<cmd>CodeCompanionChat Add<cr>", desc = "Add selected to chat", mode = { "v" } },
    },

    opts = {
      strategies = {
        chat = {
          roles = {
            llm = function(adapter) return " " .. adapter.formatted_name end,

            user = " @lhearachel",
          },
        },
      },

      display = {
        action_palette = { provider = "default" },
        diff = { provider = "mini_diff" },
        chat = {
          icons = {
            pinned_buffer = "📌 ",
            watched_buffer = "👀 ",
          },
        },
      },
    },
  },
}
