return {
  {
    "renerocksai/telekasten.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
    },

    opts = {
      home = vim.fn.expand("$DEX"),
      dailies = vim.fn.expand("$DEX/journal"),
      templates = vim.fn.expand("$DEX/templates"),

      template_new_note = vim.fn.expand("$DEX/templates/note.md"),
      template_new_daily = vim.fn.expand("$DEX/templates/daily.md"),

      new_note_filename = 'title',
      uuid_type = '%Y%m%d%H%M',
      uuid_sep = '-',

      dailies_create_nonexisting = true,

      command_palette_theme = 'dropdown',

      show_tags_theme = 'dropdown',

      media_previewer = 'viu-previewer',
    },

    keys = {
      { "<leader>t?", "<cmd>Telekasten panel<CR>", desc = "Open panel" },
      { "<leader>t.", "<cmd>Telekasten goto_today<CR>", desc = "Open today's notes" },
      { "<leader>tf", "<cmd>Telekasten find_notes<CR>", desc = "Find notes (by name)" },
      { "<leader>tg", "<cmd>Telekasten search_notes<CR>", desc = "Search notes (grep)" },
      { "<leader>tn", "<cmd>Telekasten new_note<CR>", desc = "New note (bare)" },
      { "<leader>tt", "<cmd>Telekasten new_templated_note<CR>", desc = "New note (template)" },
      { "<leader>tb", "<cmd>Telekasten show_backlinks<CR>", desc = "Show backlinks" },
      { "<leader>ty", "<cmd>Telekasten yank_notelink<CR>", desc = "Yank link to current note" },
      { "<leader>tm", "<cmd>Telekasten insert_img_link<CR>", desc = "Insert media file" },
      { "<leader>tr", "<cmd>Telekasten rename_note<CR>", desc = "Rename current note" },

      { "[[", mode = { "i" }, "<cmd>Telekasten insert_link<CR>" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>"] = {
          t = { name = "+notes" },
        },
      },
    },
  },
}
