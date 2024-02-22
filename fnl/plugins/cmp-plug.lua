-- Cmp dependencies + lazy loading
local M = {}

table.insert(M, {
	'hrsh7th/cmp-cmdline',
	event = 'CmdlineEnter',
	dependencies = { 'hrsh7th/nvim-cmp' },
})

table.insert(M, {
	'hrsh7th/cmp-nvim-lua',
	ft = 'lua',
	dependencies = { 'hrsh7th/nvim-cmp' }
})

table.insert(M, {
	'hrsh7th/cmp-nvim-lsp',
	event = 'LspAttach',
	dependencies = {
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp-signature-help'
	},
})

-- table.insert(M, {
-- 	'tzachar/cmp-tabnine',
-- 	build = './install.sh',
-- 	dependencies = 'hrsh7th/nvim-cmp',
-- 	event = 'VeryLazy'
-- })

return M
