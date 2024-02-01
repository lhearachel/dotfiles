local M = {}

M.basic = {
    {
        '<C-h>',
        '<C-W>h',
        desc = 'Focus pane to the left',
    },
    {
        '<C-k>',
        '<C-W>k',
        desc = 'Focus pane directly up',
    },
    {
        '<C-j>',
        '<C-W>j',
        desc = 'Focus pane directly down',
    },
    {
        '<C-l>',
        '<C-W>l',
        desc = 'Focus pane to the right',
    },
}

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

M.bufferline = {
    {
        '<leader>bp',
        '<cmd>BufferLineTogglePin<CR>',
        desc = 'Toggle pin',
    },
    {
        '<leader>bP',
        '<cmd>BufferLineGroupClose ungrouped<CR>',
        desc = 'Close non-pinned buffers',
    },
    {
        '<leader>bo',
        '<cmd>BufferLineCloseOthers<CR>',
        desc = 'Close other buffers',
    },
    {
        '<leader>br',
        '<cmd>BufferLineCloseRight<CR>',
        desc = 'Close buffers to the right',
    },
    {
        '<leader>bl',
        '<cmd>BufferLineCloseLeft<CR>',
        desc = 'Close buffers to the left',
    },
    {
        '<S-h>',
        '<cmd>BufferLineCyclePrev<CR>',
        desc = 'Previous buffer',
    },
    {
        '<S-l>',
        '<cmd>BufferLineCycleNext<CR>',
        desc = 'Next buffer',
    },
    {
        '<leader>x',
        '<cmd>bd<CR>',
        desc = 'Close current buffer',
    },
}

function M.load_keymaps()
    for _, km in ipairs(M.basic) do
        local mode = km.mode or { 'n', 'v', 'o' }
        vim.keymap.set(mode, km[1], km[2], { desc = km.desc })
    end
end

return M

