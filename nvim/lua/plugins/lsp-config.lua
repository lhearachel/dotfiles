return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    -- 'bashls',
                    'clangd',
                    -- 'csharp_ls',
                    'cmake',
                    'dockerls',
                    'docker_compose_language_service',
                    'gradle_ls',
                    'jsonls',
                    'jdtls',                     -- java
                    'kotlin_language_server',
                    'ltex',
                    'lua_ls',
                    'autotools_ls',              -- make
                    'marksman',                  -- markdown
                    'swift_mesonls',             -- meson
                    'jedi_language_server',      -- python
                    'rust_analyzer',
                    'taplo',                     -- toml
                    'terraformls',
                    'tsserver',                  -- typescript (+javascript)
                    'lemminx',                   -- xml
                    'yamlls',
                }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = {
                clangd = {},
                cmake = {},
                dockerls = {},
                docker_compose_language_service = {},
                gradle_ls = {},
                jsonls = {},
                jdtls = {},
                kotlin_language_server = {},
                ltex = {},
                lua_ls = {},
                autotools_ls = {},
                marksman = {},
                swift_mesonls = {},
                jedi_language_server = {},
                rust_analyzer = {},
                taplo = {},
                terraformls = {},
                tsserver = {},
                lemminx = {},
                yamlls = {},
            }
        },
        config = function()
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}

