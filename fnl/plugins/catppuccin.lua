return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,

	config = function() -- {{{
		require'catppuccin'.setup {
			flavour = "mocha",
			-- transparent_background = true,
			-- term_colors = true,
			-- show_end_of_buffer = true,

			styles = { -- {{{

				loops = { "bold" },
				conditionals = { "italic" },
				booleans = { "bold" },

				-- properties = { "italic" },
				-- types = { "italic" },

			}, -- }}}

			integrations = { -- {{{

				-- illuminate = {
				--	lsp = true -- highlight definition of word.
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

