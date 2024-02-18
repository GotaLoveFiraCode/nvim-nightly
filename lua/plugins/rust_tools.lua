return {
	-- "simrat39/rust-tools.nvim",
	'mrcjkb/rustaceanvim',
	ft = 'rust',
	version = '^4',

	dependencies = { -- {{{
		{ 'mfussenegger/nvim-dap' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'j-hui/fidget.nvim', config = true },
		{ 'lvimuser/lsp-inlayhints.nvim', config = function()
			require 'lsp-inlayhints'.setup()
			require 'lsp-inlayhints'.show()
		end},
		{ 'dgagn/diagflow.nvim', config = true },
	}, -- }}}

	init = function()
		vim.g.rustaceanvim = {
			---@type RustaceanLspClientOpts
			server = {
				on_attach = function(client, bufnr)
					local opts = { buffer = bufnr, silent = true }
					local tr = require("trouble")

					vim.keymap.set(
						'n',
						'<leader>ca',
						function()
							vim.cmd.RustLsp('codeAction')
						end,
					opts)

					-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
					vim.keymap.set('n', '<leader>e', function()
						vim.cmd.RustLsp('renderDiagnostic')
					end)
					vim.keymap.set('n', '<leader>xx', function()
						vim.cmd.RustLsp('explainError')
					end)
					vim.keymap.set('n', '<leader>q', function()
						tr.toggle('workspace_diagnostics')
					end)

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
						end,
					opts) -- }}}

					vim.keymap.set('n', '<leader>lf', function() -- {{{ format
						vim.lsp.buf.format { async = true }
						end,
					opts) -- }}}

					vim.keymap.set(
						'n', '<leader>R',
						function()
							vim.cmd.RustLsp('runnables')
						end,
					opts)

					vim.keymap.set(
						'n', '<leader>uu',
					function()
							vim.cmd.RustLsp { 'moveItem', 'up' }
						end,
					opts)
					vim.keymap.set(
						'n', '<leader>dd',
					function()
							vim.cmd.RustLsp { 'moveItem', 'down' }
						end,
					opts)

					vim.keymap.set("n", "<leader>dc", function()
						require'dap'.continue()
					end)
					vim.keymap.set("n", "<leader>dr", function()
						require('dap').run_last()
					end)
					vim.keymap.set("n", "<leader>dn", function()
						require('dap').toggle_breakpoint()
					end)
				end,

				-- settings = {
				-- 	['rust-analyzer'] = {
				-- 		procMacro = {
				-- 			-- server = "/home/ltr/.local/share/rustup/toolchains/stable-x86_64-unknown-linux-gnu/libexec/rust-analyzer-proc-macro-srv"
				-- 			--server = "/home/ltr/.local/share/rustup/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/libexec/rust-analyzer-proc-macro-srv"
				-- 		}
				-- 	}
				-- },
			},
		}
	end
}

