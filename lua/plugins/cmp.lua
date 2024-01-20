---@diagnostic disable: missing-fields
return {
	"hrsh7th/nvim-cmp",
	event = 'InsertEnter',

	dependencies = { -- {{{
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },

		-- SUUUUUPER big performance costs
		{ 'lukas-reineke/cmp-rg' },

		{ 'ray-x/cmp-treesitter' },
		{ 'onsails/lspkind.nvim' },
		{ 'saadparwaiz1/cmp_luasnip' },
	}, -- }}}

	config = function() -- {{{
		local cmp = require 'cmp'

		cmp.setup { -- {{{
			snippet = { -- {{{
				expand = function(args)
					require'luasnip'.lsp_expand(args.body)
				end,
			}, -- }}}

			mapping = cmp.mapping.preset.insert { -- {{{
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<C-y>'] = cmp.mapping.confirm { select = true },
			}, -- }}}

			window = { -- {{{
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered({
					col_offset = -6,
					side_padding = 0,
				})
			}, -- }}}

			formatting = { -- {{{
				fields = { 'menu', 'abbr', 'kind' },
				format = require 'lspkind'.cmp_format {
					mode = 'symbol_text',
					symbol_map = { Codeium = "", TabNine = "", },
					menu = {
						nvim_lsp_signature_help = '[SIG]',
						nvim_lsp = '[LSP]',
						luasnip = '[SNP]',
						treesitter = '[TRS]',
						nvim_lua = '[LUA]',
						path = '[PTH]',
						rg = '[RGP]',
						buffer = '[BUF]',
						codeium = '[CDM]',
						cmp_tabnine = '[TB9]',
					}
				}
			}, -- }}}

			sources = cmp.config.sources ( -- {{{
				{
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'path' },
				},
				{
					{ name = 'nvim_lua' },
					{ name = 'cmp_tabnine' },
					{ name = 'codeium' },
					{ name = 'nvim_lsp',   priority = 2, keyword_length = 2 },
                    { name = 'luasnip',    priority = 3 },
					{ name = 'treesitter', keyword_length = 2 },
				},
				{
					{ name = 'rg', keyword_length = 3 },
					{ name = 'buffer' },
				}
			), -- }}}

			sorting = { -- {{{
				comparators = {
					-- prefer first source candidates
					cmp.config.compare.offset,
					-- fuzzy finding is more of a fall back
					cmp.config.compare.exact,

					-- literally, was it recently used
					cmp.config.compare.recently_used,
					-- is it near the cursor
					cmp.config.compare.locality,

					-- score, i.e. priority, order, etc.
					cmp.config.compare.score,

					-- don’t start with _
					function(entry1, entry2) -- {{{
						local _, entry1_under = entry1.completion_item.label:find "^_+"
						local _, entry2_under = entry2.completion_item.label:find "^_+"
						entry1_under = entry1_under or 0
						entry2_under = entry2_under or 0
						if entry1_under > entry2_under then
							return false
						elseif entry1_under < entry2_under then
							return true
						end
					end, -- }}}

					-- is it in the same scope (similar to locality)
					cmp.config.compare.scopes,
					-- lsp only, what kind of suggestion is it.
					-- Text is ranked lower, snippets higher
					cmp.config.compare.kind,
					-- is it short
					-- cmp.config.compare.length,
					-- No idea.
					cmp.config.compare.sort_text,
					-- Something to do with ID's, don't really know.
					cmp.config.compare.order,
				}
			}, -- }}}
		} -- }}}

		cmp.setup.cmdline (':', { -- {{{ Cmd Line
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources (
				{
					{ name = 'path' }
				},
				{
					{ name = 'cmdline' }
				}
			)
		}) -- }}}

		vim.keymap.set ( -- {{{
			{ "i", "s" },
			"<C-a>",
			function()
				require 'luasnip'.jump(1)
			end,
			{ silent = true }
		) -- }}}
	end -- }}}
}

