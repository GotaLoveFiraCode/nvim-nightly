return {
	'LeonHeidelbach/trailblazer.nvim',
	config = true,
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
	}
}
