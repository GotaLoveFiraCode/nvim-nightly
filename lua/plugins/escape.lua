return {
	'max397574/better-escape.nvim',
	config = function()
		require('better_escape').setup {
			mapping = { 'ii' }
		}
	end,
	event = 'InsertEnter'
}
