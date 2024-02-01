local M = {}

M.opt_o = {
	autowrite = false,
	confirm = true,
	cursorline = true,
	wrap = false,

	expandtab = true,
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,

	background = 'dark',
	termguicolors = true,

	foldmethod = 'expr',
	foldexpr = 'nvim_treesitter#foldexpr()',
	foldenable = false,

	grepprg = 'rg --vimgrep',
	grepformat = '%f:%l:%c:%m',

	timeout = true,
	timeoutlen = 500,

	number = true,
	relativenumber = false,
}

M.opt_g = {
	mapleader = ' ',
}

function M.load_opts()
	for k, v in pairs(M.opt_o) do vim.o[k] = v end
	for k, v in pairs(M.opt_g) do vim.g[k] = v end
end

return M

