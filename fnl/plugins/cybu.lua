return {
	'ghillb/cybu.nvim',
	-- this is a fantastic plugin, but with cokeline and all,
	-- it’s kinda unnecessary.
	enabled = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-lua/plenary.nvim'
	},

	keys = {
		{ '<C-up>',   '<Plug>(CybuPrev)' },
		{ '<C-down>', '<Plug>(CybuNext)' },
		{ '<C-I>',    '<Plug>(CybuLastusedNext)', mode = { 'n', 'v' } }
	},

	config = function()

		-- local ok, cybu = pcall(require, 'cybu')
		-- if not ok then
		-- 	print('"cybu" failed to load')
		-- 	return
		-- end

		require 'cybu'.setup {
			position = {
				anchor = "bottomleft",
				-- topleft, topcenter, topright,
				-- centerleft, center, centerright,
				-- bottomleft, bottomcenter, bottomright
			},

			style = {
				path = "relative",            -- absolute, relative, tail (filename only)
				border = "rounded",           -- single, double, rounded, none
				separator = " ",              -- string used as separator
				prefix = "…",                 -- string used as prefix for truncated paths
				padding = 1,                  -- left & right padding in number of spaces

				devicons = {
					enabled = true,             -- enable or disable web dev icons
					colored = true,             -- enable color for web dev icons
					truncate = true,            -- truncate wide icons to one char width
				},

				highlights = {                -- see highlights via :highlight
					current_buffer = "CybuFocus",       -- current / selected buffer
					adjacent_buffers = "CybuAdjacent",  -- buffers not in focus
					background = "CybuBackground",      -- window background
					border = "CybuBorder",              -- border of the window
				},
			},
		}
	end
}
