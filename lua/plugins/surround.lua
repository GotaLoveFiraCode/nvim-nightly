return {
	"kylechui/nvim-surround",
	version = "*",
	config = true,
	keys = {
		{ 'ys' },
		{ 'yS' },
		{ 'cs' },
		{ 'cS' },
		{ 'ds' },
		{ 'S', mode = 'v' },
		{ '<C-g>s', mode = 'i' },
		{ '<C-g>S', mode = 'i' },
	}
}
