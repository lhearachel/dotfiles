local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git', 'clone', '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('init.settings').load_opts()
require('lazy').setup({
    spec = {
        {
            import = 'plugins'
        }
    },

    defaults = {
        lazy = false,
        version = false,
    },

    install = {
        missing = true,
    },

    ui = {
        wrap = true,
        border = 'rounded',
        size = { width = 0.8, height = 0.8 },
    }
})

