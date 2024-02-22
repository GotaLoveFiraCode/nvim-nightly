return {
	'folke/neodev.nvim',

	dependencies = { -- {{{
		'neovim/nvim-lspconfig',
		{ 'j-hui/fidget.nvim', config = true }
	}, -- }}}

	event = { -- {{{ Lazy loading
		"BufNewFile /home/ltr/.config/nvim-nightly/**.lua",
		"BufReadPost /home/ltr/.config/nvim-nightly/**.lua"
	}, -- }}}

	config = function() -- {{{
		require 'neodev'.setup({
			override = function(root_dir, library)
				if root_dir:find("/home/ltr/.config/nvim-nightly") then
					library.enabled = true
					library.plugins = true
				end
			end
		})

		require'lspconfig'.lua_ls.setup {
			capabilities = require 'cmp_nvim_lsp'.default_capabilities()
		}
	end -- }}}
}

