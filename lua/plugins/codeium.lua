return {
	'Exafunction/codeium.nvim',
	-- event = 'InsertEnter',
	-- event = { 'BufRead', 'BufNewFile' },

	---: Because it’s so slow you need to give it some time.
	event = 'VeryLazy',

	-- dependencies = {
	-- 	'nvim-lua/plenary.nvim',
	-- 	'hrsh7th/nvim-cmp',
	-- },

	config = true
}
