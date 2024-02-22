return {
	'stevearc/resession.nvim',
	config = true,

	keys = {
		{ '<leader>ss', function() require 'resession'.save() end },
		{ '<leader>sl', function() require 'resession'.load() end },
		{ '<leader>sd', function() require 'resession'.delete() end }
	}
}
