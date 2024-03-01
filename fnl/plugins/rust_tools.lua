return {
	-- "simrat39/rust-tools.nvim",
	'mrcjkb/rustaceanvim',
	ft = 'rust',
	version = '^4',

	dependencies = { -- {{{
		{ 'mfussenegger/nvim-dap', dependencies = {
			{ 'nvim-treesitter/nvim-treesitter' },
			{ 'theHamsta/nvim-dap-virtual-text', config = function()
				require('nvim-dap-virtual-text').setup()
			end},
		}},
		{ 'nvim-lua/plenary.nvim' },
		{ 'j-hui/fidget.nvim', config = true },
		{ 'lvimuser/lsp-inlayhints.nvim', config = function()
			require 'lsp-inlayhints'.setup()
			require 'lsp-inlayhints'.show()
		end},
		{ 'dgagn/diagflow.nvim', config = true },
		-- { 'nvim-telescope/telescope.nvim' },
	}, -- }}}

	init = function()
		-- nvim-dap catppuccin integration.
		local sign = vim.fn.sign_define

		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

		vim.g.rustaceanvim = {
			---@type RustaceanLspClientOpts
			server = {
				on_attach = function(client, bufnr)
					local opts = { buffer = bufnr, silent = true }

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

					vim.keymap.set('n', '<leader>q', require 'telescope.builtin'.diagnostics)
					vim.keymap.set('n', 'gd', require 'telescope.builtin'.lsp_definitions, opts)
					vim.keymap.set('n', '<leader>D', require 'telescope.builtin'.lsp_type_definitions, opts)
					vim.keymap.set('n', 'gr', require 'telescope.builtin'.lsp_references, opts)

					-- {{{ Normal mappings
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					--vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', 'gi', require 'telescope.builtin'.lsp_implementations, opts)
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
			},
		}
	end
}

