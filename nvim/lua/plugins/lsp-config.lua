local keymap = require('init.keymaps')

return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
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
        event = { 'BufReadPre', 'BufNewFile' },
        keys = keymap.lsp,
        config = function()
            local lsp = require('lspconfig')

            lsp.clangd.setup({})
            lsp.cmake.setup({})
            lsp.dockerls.setup({})
            lsp.docker_compose_language_service.setup({})
            lsp.gradle_ls.setup({})
            lsp.jsonls.setup({})
            lsp.jdtls.setup({})
            lsp.kotlin_language_server.setup({})
            lsp.ltex.setup({})
            lsp.lua_ls.setup({})
            lsp.autotools_ls.setup({})
            lsp.marksman.setup({})
            lsp.swift_mesonls.setup({})
            lsp.jedi_language_server.setup({})
            lsp.rust_analyzer.setup({})
            lsp.taplo.setup({})
            lsp.terraformls.setup({})
            lsp.tsserver.setup({})
            lsp.lemminx.setup({})
            lsp.yamlls.setup({})
        end
    },
}

