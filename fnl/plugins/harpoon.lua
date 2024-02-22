return {
	'ThePrimeagen/harpoon',
	enabled = false,
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },

	keys = {
		-- This basically means harpoon is a set of reserved marks.
		-- Hapoon also remembers your location *inside* the file, so very
		-- similar--if not the same--to global marks.

		-- harpoon updated it’s api (i.e. *harpoon2*).
		-- { 'mt', function() require 'harpoon':list():append() end },

		-- { '\'t', function()
		-- 	require 'harpoon'.ui:toggle_quick_menu(require 'harpoon':list())
		-- end },

		-- { '\'1', function() require 'harpoon':list():select(1) end },
		-- { '\'2', function() require 'harpoon':list():select(2) end },
		-- { '\'3', function() require 'harpoon':list():select(3) end },
		-- { '\'4', function() require 'harpoon':list():select(4) end },

		-- since I mostly use trailblazer, I had to change my config.
		-- {  },
	},

	config = function()
		require 'harpoon':setup()
	end
}

