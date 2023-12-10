return {
	'tiagovla/scope.nvim',
	event = 'VeryLazy',
	config = function()
		require("scope").setup({})
	end,
	keys = {
		{ '<leader>mt', '<CMD>ScopeMoveBuf<CR>' }
	}
}
