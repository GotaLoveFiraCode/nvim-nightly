return {
	'lukas-reineke/headlines.nvim',
	ft = 'markdown',
	dependencies = 'nvim-treesitter/nvim-treesitter',
	opts = {
		markdown = {
			dash_string = "—",
			fat_headline_lower_string = "▀"
		}
	},
}

