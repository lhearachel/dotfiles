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
        config = function()
            local config = require('lspconfig')
            -- config.bashls.setup({})  -- weird nvim_buf_del_keymap error?
            config.clangd.setup({})
            -- config.csharp_ls.setup({}) -- needs dotnet exe
            config.cmake.setup({})
            config.dockerls.setup({})
            config.docker_compose_language_service.setup({})
            config.gradle_ls.setup({})
            config.jsonls.setup({})
            config.jdtls.setup({})
            config.kotlin_language_server.setup({})
            config.ltex.setup({})
            config.lua_ls.setup({})
            config.autotools_ls.setup({})
            config.marksman.setup({})
            config.swift_mesonls.setup({})
            config.jedi_language_server.setup({})
            config.rust_analyzer.setup({})
            config.taplo.setup({})
            config.terraformls.setup({})
            config.tsserver.setup({})
            config.lemminx.setup({})
            config.yamlls.setup({})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}

