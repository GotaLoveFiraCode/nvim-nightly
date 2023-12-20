return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,

	config = function() -- {{{
		require'catppuccin'.setup {
			-- flavour = "mocha",
			-- transparent_background = false,
			-- term_colors = true,
			-- show_end_of_buffer = true,

			styles = { -- {{{
				functions = { "bold" },
				loops = { "italic" },
				types = { "italic" },
				conditionals = { "italic" },
				booleans = { "italic" },
			}, -- }}}

			integrations = { -- {{{

				-- illuminate = {
				-- 	lsp = true -- highlight definition of word.
				-- },

				-- treesitter_context = true,
				lsp_trouble = true,
				leap = true,
				fidget = true,
				harpoon = true,
				headlines = true,
				indent_blankline = { scope_color = "lavender" },
			}, -- }}}
		}

		vim.cmd.colorscheme('catppuccin')
	end -- }}}
}

