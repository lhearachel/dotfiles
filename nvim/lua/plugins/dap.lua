return {
  {
    "mfussenegger/nvim-dap",

    -- Flip the Step Over/Out keybinds
    -- stylua: ignore
    keys = {
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
    },
  },
}
