return {
	'RRethy/vim-illuminate',
	event = { 'BufRead', 'BufNewFile' },
	config = function()
		require'illuminate'.configure({
			delay = 300,
			min_count_to_highlight = 2,
		})
	end
}
