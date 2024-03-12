-- :fennel:1710012244
local nvim_treesitter_plugin
local function _1_()
  return require("nvim-treesitter.configs").setup({auto_install = true, highlight = {enable = true}, indent = {enable = true}, matchup = {enable = true}, textsubjects = {enable = true, keymaps = {["."] = "textsubjects-smart", [";"] = "textsubjects-container-outer", [","] = "textsubjects-container-inner"}}})
end
nvim_treesitter_plugin = {"nvim-treesitter/nvim-treesitter", event = "VeryLazy", build = ":TSUpdate", config = _1_}
local nvim_cybu_plugin
local function _2_()
  return require("cybu").setup({position = {anchor = "bottomleft"}, style = {path = "relative", border = "rounded", separator = " ", prefix = "\226\128\166", padding = 1, devicons = {enabled = true, colored = true, truncate = true}, highlights = {current_buffer = "CybuFocus", adjacent_buffers = "CybuAdjacent", border = "CybuBorder"}}})
end
nvim_cybu_plugin = {"ghillb/cybu.nvim", dependencies = {"nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim"}, keys = {{"<C-up>", "<Plug>(CybuPrev)"}, {"<C-down>", "<Plug>(CybuNext)"}, {"C-I", "<Plug>(CybuLastusedNext)", mode = {"n", "v"}}}, config = _2_}
local nvim_telescope_plugin
local function _3_()
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("frecency")
  return require("telescope").load_extension("file_browser")
end
nvim_telescope_plugin = {"nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-frecency.nvim", "nvim-telescope/telescope-file-browser.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, keys = {{"<Leader><Return>", "<CMD>Telescope frecency workspace=CWD<CR>"}, {"<Leader><Leader><Return>", "<CMD>Telescope frecency<CR>"}, {"<Leader>tr", "<CMD>Telescope git_files<CR>"}, {"<Leader>ts", "<CMD>Telescope find_files theme=ivy<CR>"}, {"<Leader>tn", "<CMD>Telescope live_grep<CR>"}, {"<Leader>ta", "<CMD>Telescope buffers theme=dropdown<CR>"}, {"<Leader>th", "<CMD>Telescope help_tags<CR>"}, {"-", "<CMD>Telescope file_browser<CR>"}}, config = _3_}
local nvim_sg_plugin = {"sourcegraph/sg.nvim", dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"}, config = true}
local leap_plugin = require("plugins.leap")
local lspconfig_plugin = require("plugins.lspconfig")
local gitsigns_plugin = require("plugins.gitsigns")
local indent_lines_plugin = require("plugins.indent-lines")
local reticle_plugin = require("plugins.reticle")
local rustaceanvim_plugin = require("plugins.rust_tools")
local scroll_plugin = require("plugins.scroll")
local spider_plugin = require("plugins.spider")
local undotree_plugin = require("plugins.undotree")
local cmp_plugin = require("plugins.cmp")
local cmp_plug_plugin = require("plugins.cmp-plug")
local codeium_plugin = require("plugins.codeium")
local luasnip_plugin = require("plugins.snip")
local various_textobjs = require("plugins.textobj")
local unimpaired_plugin = require("plugins.unimpaired")
local function _4_()
  return require("nvim_comment").setup({comment_empty = false})
end
return {"udayvir-singh/tangerine.nvim", "udayvir-singh/hibiscus.nvim", "jaawerth/fennel.vim", "andymass/vim-matchup", "Bekaboo/deadcolumn.nvim", {"NMAC427/guess-indent.nvim", config = true}, {"rebelot/kanagawa.nvim", opts = {compile = true}}, {"anuvyklack/pretty-fold.nvim", opts = {fill_char = "\194\183"}}, {"kylechui/nvim-surround", version = "*", config = true, event = "VeryLazy"}, {"m4xshen/autoclose.nvim", opts = {options = {pair_spaces = true}}, event = "VeryLazy"}, {"terrortylor/nvim-comment", keys = {{"gcc"}, {"gc", mode = {"n", "v"}}}, config = _4_}, {"norcalli/nvim-colorizer.lua", config = true, keys = {{"<Leader>ct", vim.cmd.ColorizerToggle}, {"<Leader>cc", vim.cmd.ColorizerReloadAllBuffers}}}, {"jinh0/eyeliner.nvim", keys = {"f", "F", "t", "T"}, opts = {highlight_on_key = true, dim = true}}, nvim_cybu_plugin, nvim_telescope_plugin, nvim_treesitter_plugin, leap_plugin, gitsigns_plugin, reticle_plugin, rustaceanvim_plugin, scroll_plugin, spider_plugin, undotree_plugin, cmp_plugin, cmp_plug_plugin, codeium_plugin, luasnip_plugin, unimpaired_plugin, various_textobjs}