return {
	'RRethy/vim-illuminate',
	event = { 'BufReadPost', 'BufNewFile' },
	config = function()
		require'illuminate'.configure({
			delay = 0,
			min_count_to_highlight = 2,
		})
	end
}
