local keymap = require('init.keymaps')

return {
    {
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        keys = keymap.bufferline,
        opts = {
            options = {
                diagnostics = 'nvim_lsp',
                always_show_bufferline = true,
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = '',
                        highlight = 'Directory',
                        text_align = 'left',
                    },
                },
            },
        },
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
    }
}

