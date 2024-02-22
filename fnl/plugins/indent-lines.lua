return {
	'lukas-reineke/indent-blankline.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	main = 'ibl',
	commit = '0dca9284bce128e60da18693d92999968d6cb523',

	opts = {
		indent = {
			char = '▏'
		},
		scope = {
			enabled = true,
			show_end = false,
			show_start = false,
		}
	},
}
