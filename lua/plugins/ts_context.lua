return {
	"nvim-treesitter/nvim-treesitter-context",
	event = { 'BufRead', 'BufNewFile', 'BufWritePost' },
	keys = {
		{ '[c', function() require'treesitter-context'.go_to_context() end, silent = true, desc = "Go to context" }
	},
	dependencies = {
		'nvim-treesitter/nvim-treesitter'
	}
}

