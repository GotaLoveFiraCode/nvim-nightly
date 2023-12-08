return {
	'lukas-reineke/indent-blankline.nvim',
	main = 'ibl',
	opts = {
		indent = {
			char = '▏'
		},
		scope = {
			enabled = true,
			show_end = false,
			show_start = false,
			-- highlight = 'CursorLineNr'
		}
	},
	event = { 'BufReadPost', 'BufNewFile' }
}
