-- :fennel:1708562880
do
  vim.cmd("let mapleader = ' '")
end
require("core")
local alpha_plugin = require("plugins.alpha")
local comment_plugin = require("plugins.comment")
local leap_plugin = require("plugins.leap")
do end (vim.opt.rtp):append((vim.fn.stdpath("data") .. "/lazy/lazy.nvim"))
local nvim_treesitter_plugin
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  return treesitter.setup({auto_install = true, highlight = {enable = true}, indent = {enable = true}, matchup = {enable = true}, textsubjects = {enable = true, keymaps = {["."] = "textsubjects-smart", [";"] = "textsubjects-container-outer", [","] = "textsubjects-container-inner"}}})
end
nvim_treesitter_plugin = {"nvim-treesitter/nvim-treesitter", event = "VeryLazy", build = ":TSUpdate", config = _1_}
local nvim_lspconfig_plugin
local function _2_()
  return vim.keymap.set({"n"}, "<leader>e", vim.diagnostic.open_float, {silent = true})
end
nvim_lspconfig_plugin = {"neovim/nvim-lspconfig", dependencies = {"j-hui/fidget.nvim"}, config = _2_}
local plugins = {"udayvir-singh/tangerine.nvim", "udayvir-singh/hibiscus.nvim", "jaawerth/fennel.vim", {"NMAC427/guess-indent.nvim", config = true}, nvim_treesitter_plugin, {"rebelot/kanagawa.nvim", opts = {compile = true}}, "andymass/vim-matchup", {"kylechui/nvim-surround", version = "*", config = true, event = "VeryLazy"}, {"m4xshen/autoclose.nvim", opts = {options = {pair_spaces = true}}, event = "VeryLazy"}, nvim_lspconfig_plugin, alpha_plugin, comment_plugin, leap_plugin}
do
  local lazy = require("lazy")
  lazy.setup(plugins)
end
return vim.cmd("colorscheme kanagawa")