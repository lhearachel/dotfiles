return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                'bash',
                'c',
                'cpp',
                'c_sharp',
                'cmake',
                'dockerfile',
                'gitattributes',
                'gitignore',
                'java',
                'javascript',
                'json',
                'kotlin',
                'latex',
                'lua',
                'make',
                'markdown',
                'meson',
                'python',
                'rust',
                'toml',
                'typescript',
                'yaml',
            },
        })
    end
}

