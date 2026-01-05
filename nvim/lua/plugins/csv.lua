return {
  {
    "hat0uma/csvview.nvim",

    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      view = { display_mode = "border" },
      keymaps = {
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },

        -- Excel-like navigation:
        --   - <Tab> and <S-Tab> move horizontally between fields.
        --   - <Enter> and <S-Enter> move vertically between rows.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      }
    },
    ft = {
      "csv",
      "tsv",
    },
    cmd = {
      "CsvViewEnable",
      "CsvViewDisable",
      "CsvViewToggle",
    },
  },
}
