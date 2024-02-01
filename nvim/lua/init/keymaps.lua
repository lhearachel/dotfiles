local M = {}

M.neotree = {
    {
        '<leader>e',
        '<cmd>Neotree toggle<CR>',
        desc = 'Toggle Neotree',
    },
    {
        '<leader>o',
        '<cmd>Neotree focus<CR>',
        desc = 'Focus Neotree',
    },
}

M.telescope = {
    {
        '<leader>ff',
        '<cmd>Telescope find_files<CR>',
        desc = 'Find files',
    },
    {
        '<leader>fg',
        '<cmd>Telescope live_grep<CR>',
        desc = 'grep in files',
    },
    {
        '<leader>fb',
        '<cmd>Telescope buffers<CR>',
        desc = 'Find buffers',
    },
    {
        '<leader>fo',
        '<cmd>Telescope oldfiles<CR>',
        desc = 'Find old files',
    },
    {
        '<leader>fm',
        '<cmd>Telescope man_pages<CR>',
        desc = 'Find man pages',
    },
    {
        '<leader>ft',
        '<cmd>Telescope treesitter<CR>',
        desc = 'Find from Treesitter',
    },
}

M.lsp = {
    {
        'gD',
        vim.lsp.buf.declaration,
        desc = 'Goto declaration',
    },
    {
        'gd',
        '<cmd>Telescope lsp_definitions<CR>',
        desc = 'Goto definition',
    },
    {
        '<leader>fr',
        '<cmd>Telescope lsp_references<CR>',
        desc = 'Find references',
    },
    {
        'gi',
        '<cmd>Telescope lsp_implementations<CR>',
        desc = 'Goto implementation',
    },
    {
        'gt',
        '<cmd>Telescope lsp_type_definitions<CR>',
        desc = 'Goto type definition',
    },
    {
        'K',
        vim.lsp.buf.hover,
        desc = 'Hover',
    },
    {
        '<leader>ca',
        vim.lsp.buf.code_action,
        desc = 'Code Action',
    },
}

M.markdown = {
    {
        '<leader>mp',
        '<cmd>MarkdownPreview<CR>',
        desc = 'Preview Markdown',
    },
}

return M

