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
				extra_keymaps = true,
				scroll_limit = 100,
				always_scroll = true,
			}
		end,

		keys = {
			'gg',
			'G',
			'{',
			'}',
			'n',
			'N',
			'#',
			'*',
		}
	} -- }}}
}

