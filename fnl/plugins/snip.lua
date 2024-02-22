return {
	'L3MON4D3/LuaSnip',
	event = 'InsertEnter',
	build = 'make install_jsregexp',

	dependencies = {
		'rafamadriz/friendly-snippets',
		'honza/vim-snippets',
		-- 'molleweide/LuaSnip-snippets.nvim',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/nvim-cmp'
	},

	config = function()
		require 'luasnip.loaders.from_vscode'.lazy_load()
		require 'luasnip.loaders.from_snipmate'.lazy_load()
	end
}

