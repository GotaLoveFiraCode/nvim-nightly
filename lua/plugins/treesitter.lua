return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require'nvim-treesitter.configs'.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false
			},
			indent = {
				enable = true,
			},
			matchup = {
				enable = true,
			},
			textsubjects = {
				enable = true,
				-- prev_selection = ',',
				keymaps = {
					['.'] = 'textsubjects-smart',
					[';'] = 'textsubjects-container-outer',
					[','] = 'textsubjects-container-inner',
				}
			}
		})
	end,
}
