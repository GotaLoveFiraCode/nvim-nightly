return {
	'norcalli/nvim-colorizer.lua',
	config = true,
	keys = {
		{ '<leader>ct', vim.cmd.ColorizerToggle, desc = "Toggle Color HL" },
		{ '<leader>cc', vim.cmd.ColorizerReloadAllBuffers, desc = "Reload Color" }
	}
}

