return {
	'Aasim-A/scrollEOF.nvim',
	config = function()
		require 'scrollEOF'.setup()
	end,
	event = { 'BufReadPost', 'BufNewFile' }
}
