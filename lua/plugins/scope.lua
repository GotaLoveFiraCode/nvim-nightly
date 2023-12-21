return {
	'jinh0/eyeliner.nvim',

	keys = {
		'f',
		'F',
		't',
		'T'
	},

	config = function()
		vim.api.nvim_set_hl(0, "EyelinerPrimary", { bold = true, fg = '#1e1e2e', bg = '#fab387' })
		vim.api.nvim_set_hl(0, "EyelinerSecondary", { underline = true, bold = true, italic = true, fg = '#94e2d5' })

		require 'eyeliner'.setup {
			highlight_on_key = true,
			dim = true
		}
	end
}
