---@diagnostic disable: need-check-nil
return {
	'LeonHeidelbach/trailblazer.nvim',

	keys = {
		-- { '<leader>bn', function() require 'trailblazer'.new_trail_mark() end },
		-- { '<leader>rt', function() require 'trailblazer'.track_back() end },
		-- { '<leader>rb', function() require 'trailblazer'.peek_move_previous_up() end },
		-- { '<leader>rf', function() require 'trailblazer'.peek_move_next_down() end },
		-- { '<leader>ro', function() require 'trailblazer'.toggle_trail_mark_list() end }

		{ 'mt', function() require 'trailblazer'.new_trail_mark() end },
		{ '<leader>\'', function() require 'trailblazer'.track_back() end },
		{ '\'p', function() require 'trailblazer'.peek_move_previous_up() end },
		{ '\'d', function() require 'trailblazer'.peek_move_next_down() end },
		{ '<leader><leader>\'', function() require 'trailblazer'.toggle_trail_mark_list() end }
	},

	config = function()

		local color = require 'catppuccin.palettes'.get_palette 'mocha'

		require 'trailblazer'.setup({
			auto_save_trailblazer_state_on_exit  = true,

			trail_options = {
				available_trail_mark_modes = {
					"global_chron",
					"buffer_local_chron",
					"buffer_local_line_sorted"
				},

				symbol_line_enabled = false,
			},

			hl_groups = {
				TrailBlazerTrailMark = {
					guifg = color.crust,
					guibg = "none",
					gui = "bold",
				},

				TrailBlazerTrailMarkNext = {
					guifg = color.crust,
					guibg = color.green,
					gui = "bold",
				},

				TrailBlazerTrailMarkPrevious = {
					guifg = color.crust,
					guibg = color.red,
					gui = "bold",
				},

				TrailBlazerTrailMarkCursor = {
					guifg = color.crust,
					guibg = color.peach,
					gui = "bold",
				},

				TrailBlazerTrailMarkNewest = {
					guifg = color.crust,
					guibg = color.teal,
					gui = "bold",
				},

				TrailBlazerTrailMarkGlobalChron = {
					guifg = "none",
					guibg = color.surface2,
					gui = "bold",
				},
			}
		})
	end,
}
