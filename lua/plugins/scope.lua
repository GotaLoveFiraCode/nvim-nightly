return {
	'unblevable/quick-scope',
	init = function()
		vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
	end,

	keys = {
		'f',
		'F',
		't',
		'T'
	},

	config = function()
		vim.api.nvim_set_hl(0, "QuickScopePrimary", { underline = true, italic = true, bold = true, fg = '#89b4fa' })
		vim.api.nvim_set_hl(0, "QuickScopeSecondary", { underline = true, italic = true, fg = '#f5c2e7' })
	end
}
