return {
	'neovim/nvim-lspconfig',
	ft = 'c',

	dependencies = { -- {{{
		-- 'folke/trouble.nvim',
		-- 'hrsh9th/cmp-nvim-lsp',
		'nvim-telescope/telescope.nvim',
		'p00f/clangd_extensions.nvim',
		{ 'j-hui/fidget.nvim', opts = {
			notification = {
				window = {
					winblend = 0,
				}
			}
		}}
	}, -- }}}

	config = function() -- {{{
		local tr = require("trouble")

		vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
		vim.keymap.set('n', '<leader>q', function()
			tr.toggle("workspace_diagnostics")
		end)

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),

			callback = function(ev) -- {{{ Other mappings
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- See `:help vim.lsp.*` for documentation
				local opts = { buffer = ev.buf }

				vim.keymap.set('n', 'gd', function() -- {{{ Trouble & Telescope
					tr.toggle('lsp_definitions')
				end, opts)
				vim.keymap.set('n', '<leader>D', function()
					tr.toggle('lsp_type_definitions')
				end, opts)
				vim.keymap.set('n', 'gr', function()
					tr.toggle('lsp_references')
				end, opts)
				-- }}}

				-- {{{ Normal mappings
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<leader>kk', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
				-- }}}

				vim.keymap.set( -- {{{ workspace management
					'n',
					'<leader>wa',
					vim.lsp.buf.add_workspace_folder,
				opts)
				vim.keymap.set(
					'n',
					'<leader>wr',
					vim.lsp.buf.remove_workspace_folder,
				opts)
				vim.keymap.set('n', '<leader>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts) -- }}}

				vim.keymap.set ( -- {{{ Code actions: <leader>ca
					{ 'n', 'v' },
					'<leader>ca',
					vim.lsp.buf.code_action,
				opts) -- }}}
				vim.keymap.set('n', '<leader>lf', function() -- {{{ format
					vim.lsp.buf.format { async = true }
				end, opts) -- }}}
			end, -- }}}
		})

		-- integrate cmp {{{
		require 'lspconfig'.util.default_config = vim.tbl_deep_extend("force",
			require 'lspconfig'.util.default_config,
			{ capabilities = require 'cmp_nvim_lsp'.default_capabilities() })

		require('lspconfig').clangd.setup {
			on_attach = function() -- add inlay hints
				require('clangd_extensions.inlay_hints').setup_autocmd()
				require('clangd_extensions.inlay_hints').set_inlay_hints()
			end,
		}
		require('lspconfig').ccls.setup {}
		-- }}}

		local notify = vim.notify
		vim.notify = function(msg, ...)
			if msg:match 'warning: multiple different client offset_encodings' then
				return
			end

			notify(msg, ...)
		end
	end, -- }}}
}

