return {
	'mbbill/undotree',
	cmd = 'UndotreeToggle',
	init = function()
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
	keys = {
		{ '<f5>', '<CMD>UndotreeToggle<CR>' }
	},
}
