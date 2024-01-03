---@diagnostic disable: need-check-nil, return-type-mismatch
return {
	'willothy/nvim-cokeline',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = { 'BufRead', 'BufNewFile', 'BufWrite' },

	keys = {
		{ '<leader>bf', function() require 'cokeline.mappings'.pick('focus')        end },
		{ '<leader>bc', function() require 'cokeline.mappings'.pick('close')        end },
		{ '<C-right>',   function() require 'cokeline.mappings'.by_step('focus', 1)  end },
		{ '<C-left>',  function() require 'cokeline.mappings'.by_step('focus', -1) end }
	},

	config = function()

		local color = require 'catppuccin.palettes'.get_palette 'mocha'
		local is_picking_focus = require('cokeline.mappings').is_picking_focus
		local is_picking_close = require('cokeline.mappings').is_picking_close

		local red = vim.g.terminal_color_1
		local yellow = vim.g.terminal_color_3

		require('cokeline').setup({
			-- Only show the bufferline when there are at least this many visible buffers.
			-- default: `1`.
			---@type integer
			show_if_buffers_are_at_least = 2,

			-- buffers = {
			-- 	new_buffers_position = 'number'
			-- },

			mappings = {
				-- Disables mouse mappings
				-- default: `false`.
				---@type boolean
				disable_mouse = true,
			},

			pick = {
				-- The list of letters that are valid as pick letters. Sorted by
				-- keyboard reachability by default, but may require tweaking for
				-- non-QWERTY keyboard layouts.
				-- default: `'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP'`
				---@type string
				letters = 'tnseriaogmdhc,x.blpufyw-q\';=TNSERIAOGMDHCXBLPUFYWQ',
			},

			-- The default highlight group values.
			-- The `fg`, `bg`, and `sp` keys are either colors in hexadecimal format or
			-- functions taking a `buffer` parameter and returning a color in
			-- hexadecimal format. Style attributes work the same way, but functions
			-- should return boolean values. #28293a
			default_hl = {
				fg = function(buffer)
					return buffer.is_focused
						and color.text
						 or color.overlay2
				end,

				bg = function(buffer)
					return buffer.is_focused
						and color.base
						 or color.mantle
				end,

				-- default: unset.
				sp = nil,

				bold = function(buffer)
						return buffer.is_focused
				end,

				italic = function(buffer)
						return buffer.is_focused
				end,

				underline = nil,
				undercurl = nil,
				strikethrough = nil,
			},

			-- The highlight group used to fill the tabline space
			-- fill_hl = 'TabLineFill',
			fill_hl = 'CursorColumn',

			components = {
				{
					text = ' ',
				},
				{
					text = function(buffer)
						return
							(is_picking_focus() or is_picking_close())
							and buffer.pick_letter .. ' '
							or buffer.devicon.icon
					end,
					fg = function(buffer)
						return
							(is_picking_focus() and yellow)
							or (is_picking_close() and red)
							or buffer.devicon.color
					end,
					italic = function()
						return
							(is_picking_focus() or is_picking_close())
					end,
					bold = function()
						return
							(is_picking_focus() or is_picking_close())
					end
				},
				{
					text = function(buffer) return buffer.unique_prefix end,
					fg = color.overlay2,
					italic = true
				},
				{
					-- text = function(buffer) return buffer.filename .. ' ' end
					text = function(buffer) return buffer.filename end
				},

				-- {
				-- 	text = '×',
				-- 	on_click = function(_, _, _, _, buffer)
				-- 		buffer:delete()
				-- 	end
				-- },

				{
					text = ' ',
				}
			},

			tabs = {
				placement = "right",
				components = {
					{
						text = ' ',

						fg = function(TabPage)
							return TabPage.is_active and color.text or color.overlay2
						end,

						bg = function(TabPage)
							return TabPage.is_active and color.base or color.mantle
						end
					},
					{
						text = function(TabPage)
							return TabPage.number .. ' '
						end,

						bold = function(TabPage)
							return TabPage.is_active
						end,

						fg = function(TabPage)
							return TabPage.is_active and color.lavender or color.overlay2
						end,

						bg = function(TabPage)
							return TabPage.is_active and color.base or color.mantle
						end
					},
				}
			},

			-- Left sidebar to integrate nicely with file explorer plugins.
			-- This is a table containing a `filetype` key and a list of `components` to
			-- be rendered in the sidebar.
			-- The last component will be automatically space padded if necessary
			-- to ensure the sidebar and the window below it have the same width.
			---@type table | false
			sidebar = false,
		})
	end,
}
