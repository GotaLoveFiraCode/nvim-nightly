-- :fennel:1709181429
do
  vim.cmd("let mapleader = ' '")
end
require("core")
do end (vim.opt.rtp):append((vim.fn.stdpath("data") .. "/lazy/lazy.nvim"))
require("lazy").setup(require("index"), {performance = {rtp = {disabled_plugins = {"gzip", "matchit", "matchparen", "tarPlugin", "tutor", "zipPlugin", "tohtml", "netrwPlugin", "editorconfig"}}}})
return vim.cmd("colorscheme kanagawa")