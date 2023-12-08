return {
	'karb94/neoscroll.nvim',
	config = function()
		require "neoscroll".setup { stop_eof = false }
	end,
	keys = {
		'<c-d>',
		'<c-u>',
		'<c-y>',
		'<c-e>',
		'<c-b>',
		'<c-f>',
		'zz',
	}
}

