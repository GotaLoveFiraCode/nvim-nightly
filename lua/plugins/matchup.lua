return {
	'andymass/vim-matchup',
	event = { 'BufRead', 'BufNewFile', 'BufWritePost' },
	init = function()
		vim.g.matchup_matchparen_offscreen = { method = 'popup' }
	end
}
