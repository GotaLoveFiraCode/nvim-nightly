return {
	'Pocco81/true-zen.nvim',
	config = function()
		require 'true-zen'.setup { integrations = { tmux = true } }
	end,
	cmd = { "TZAtaraxis", "TZFocus", "TZNarrow", "TZMinimalist" }
}
