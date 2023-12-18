return {

	{ -- {{{ Old scroll plugin
		'karb94/neoscroll.nvim',

		config = function()
			require "neoscroll".setup {
				stop_eof = false,
				easing_function = 'sine',
				-- easing_function = 'circular',
			}
		end,

		keys = {
			'<c-y>',
			'<c-e>',
			'zz',
			'<c-b>',
			'<c-f>',
			'<c-u>',
			'<c-d>',
		}
	}, -- }}}

	{ -- {{{ other scroll plugin
		'declancm/cinnamon.nvim',

		config = function()
			require 'cinnamon'.setup {
				default_keymaps = false,
				extra_keymaps = true,
				always_scroll = true,
				max_length = 50,
				scroll_limit = -1,
			}
		end,

		keys = {
			'gg',
			'G',
			'{',
			'}',
			'0',
			'^',
			'$',
			'n',
			'N',
			'#',
			'*'
		}
	} -- }}}
}

