return {
	'tiagovla/scope.nvim',
	event = 'TabNew',
	config = function()
		require("scope").setup({})
	end,
	keys = {
		{ '<leader>mt', '<CMD>ScopeMoveBuf<CR>' }
	}
}
