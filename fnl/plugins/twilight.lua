return {
	'folke/twilight.nvim',
	opts = {
		context = 10,
		expand = {
			"function_item",
			-- "method",
			"loop_expression",
			"if_expression",
			"match_expression",
		},
	},
	ft = 'rust',
}
