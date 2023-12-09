return {
	'ghillb/cybu.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-lua/plenary.nvim'
	},

	config = function()
		local ok, cybu = pcall(require, 'cybu')
		if not ok then
			print('"cybu" failed to load')
			return
		end

		cybu.setup {
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
	end,

	keys = {
		{ '<C-up>', '<Plug>(CybuPrev)' },
		{ '<C-down>', '<Plug>(CybuNext)' },
		{ '<C-S-I>', '<Plug>(CybuLastusedPrev)', mode = { 'n', 'v' } },
		{ '<C-I>',     '<Plug>(CybuLastusedNext)', mode = { 'n', 'v' } }
	}
}
