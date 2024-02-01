return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
        options = {
            theme = 'dracula',
            disabled_filetypes = {
                statusline = { 'neo-tree', 'dashboard', 'alpha' },
            },
        },
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
}

