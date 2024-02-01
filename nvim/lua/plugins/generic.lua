return {
    -- trim whitespace
    {
        'cappyzawa/trim.nvim',
        cmd = 'Trim',
        opts = {
            trim_on_write = true,
            trim_first_line = false,
        },
    },
    -- indent guides
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        main = 'ibl',
        opts = {
            indent = {
                char = '|',
                tab_char = '|',
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    'help',
                    'alpha',
                    'dashboard',
                    'neo-tree',
                    'Trouble',
                    'lazy',
                    'mason'
                },
            },
        },
    },
    -- minimal autopairs
    {
        'echasnovski/mini.pairs',
        event = 'VeryLazy',
        opts = {
            modes = {
                insert = true,
                command = false,
                terminal = false,
            },
        },
    },
    -- whichkey
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            plugins = {
                spelling = true
            },
        },
    },
}

