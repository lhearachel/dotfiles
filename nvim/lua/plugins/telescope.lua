return {
  {
    "nvim-telescope/telescope-media-files.nvim",
    -- disabled = true,

    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },

    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("media_files")
      end)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",

    opts = {
      extensions = {
        media_files = {
          filetypes = {
            "png",
            "jpg",
            "jpeg",
            "mp4",
            "webm",
            "pdf",
          },

          find_cmd = "rg",
        },
      },
    },
  },
}
