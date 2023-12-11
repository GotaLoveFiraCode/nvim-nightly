return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',

	dependencies = { -- {{{
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		{ 'nvim-telescope/telescope-frecency.nvim' },
		{ 'nvim-telescope/telescope-file-browser.nvim' },
	}, -- }}}

	keys = { -- {{{
		{ '<Leader><Return>', "<CMD>Telescope frecency workspace=CWD<CR>" },
		{ '<Leader><Leader><Return>', "<CMD>Telescope frecency<CR>" },
		{ '<Leader>tr', require 'telescope.builtin'.git_files  },
		{ '<Leader>ts', require 'telescope.builtin'.find_files },
		{ '<Leader>tn', require 'telescope.builtin'.live_grep  },
		{ '<Leader>ta', require 'telescope.builtin'.buffers    },

		{ '-', function() -- {{{ file browser
			require 'telescope'.extensions.file_browser.file_browser()
		end }, --}}}
	}, -- }}}

	config = function() -- {{{
		require 'telescope'.setup { --{{{
			extensions = {
				frecency = {
					show_scores = true,
					workspaces = {
						["d"] = "/home/ltr/.config",
						["c"] = "/home/ltr/Desktop/code"
					}
				},
			}
		} -- }}}

		require 'telescope'.load_extension 'fzf' -- fzf keybinds, speed
		require 'telescope'.load_extension 'frecency' -- mozilla algo
		require 'telescope'.load_extension 'file_browser' -- oil alternative
	end, -- }}}
}
