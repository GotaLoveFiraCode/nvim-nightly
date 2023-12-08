return {
	'ggandor/leap.nvim',
	dependencies = { 'tpope/vim-repeat' },
	config = function()
		require'leap'.add_default_mappings()
		vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
	end,
	keys = {
		{ 's' },
		{ 'S' },
		{ 'gs' },
	},
}
