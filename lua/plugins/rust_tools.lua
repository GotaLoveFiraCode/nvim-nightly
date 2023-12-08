return {
	"simrat39/rust-tools.nvim",
	ft = 'rust',

	dependencies = { -- {{{
		{ 'neovim/nvim-lspconfig' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'j-hui/fidget.nvim', config = true }
	}, -- }}}

	config = function() -- {{{
		local rt = require'rust-tools'

		rt.setup { -- {{{
			server = {
				capabilities = require'cmp_nvim_lsp'.default_capabilities(),
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
					vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
					vim.keymap.set("n", "<leader>R", rt.runnables.runnables, { buffer = bufnr })
				end,
			},
		} -- }}}

		rt.inlay_hints.enable()
	end -- }}}
}


