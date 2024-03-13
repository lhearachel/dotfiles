return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        -- Match my editor's appearance
        font = "CaskaydiaMono NFM=34",
        theme = "Catppuccin-macchiato",

        -- Clean up the background, focus on the code
        background = "#0000",
        pad_horiz = 10,
        pad_vert = 10,
        no_window_controls = true,
        shadow_blur_radius = 0,
        shadow_color = "#0000",

        -- Clipboard only
        to_clipboard = true,
      })
    end,
  },
}
