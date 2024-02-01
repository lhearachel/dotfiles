return {
    'nvimtools/none-ls.nvim',
    config = function()
        local null_ls = require('null-ls')
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.alex,
                null_ls.builtins.diagnostics.gccdiag,
                null_ls.builtins.diagnostics.ktlint,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.diagnostics.proselint,
                null_ls.builtins.diagnostics.pylint,
            },
        })
    end
}

