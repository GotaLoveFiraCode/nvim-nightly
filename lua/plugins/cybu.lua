return {
	'ghillb/cybu.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-lua/plenary.nvim'
	},

	config = function()
		local ok, cybu = pcall(require, 'cybu')
		if not ok then
			print('"cybu" failed to load')
			return
		end
		cybu.setup()
	end,

	keys = {
		{ '<C-up>', '<Plug>(CybuPrev)' },
		{ '<C-down>', '<Plug>(CybuNext)' },
		{ '<C-S-I>', '<Plug>(CybuLastusedPrev)', mode = { 'n', 'v' } },
		{ '<C-I>',     '<Plug>(CybuLastusedNext)', mode = { 'n', 'v' } }
	}
}
