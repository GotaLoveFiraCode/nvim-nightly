return {
	'lewis6991/gitsigns.nvim',
	-- opts = { current_line_blame = true },
	config = true,
	event = { 'BufReadPost', 'BufNewFile' },
	keys = {
		{ ']c', function() require('gitsigns').next_hunk() end },
		{ '[c', function() require('gitsigns').prev_hunk() end },
		{ 'ih', ':<C-U>Gitsigns select_hunk<CR>', mode = { 'o', 'x' } }
	}
}

