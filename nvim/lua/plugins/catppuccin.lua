return {
    'catppuccin/nvim',
    lazy = false, -- always load on start
    name = 'catppuccin',
    priority = 1000,
    config = function()
        vim.cmd.colorscheme 'catppuccin'
    end
}

