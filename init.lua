local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Needs to be set before lazy.nvim is called.
vim.g.mapleader = " "

require 'lazy'.setup("plugins", { -- {{{
	defaults = { lazy = true },
	install = { colorscheme = { 'catppuccin', 'habamax' } },
	checker = { enabled = true, concurrency = 1 },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"tarPlugin",
				"tutor",
				"zipPlugin",
				"tohtml",
				"netrwPlugin",
				"editorconfig",
			}
		}
	}
}) -- }}}

require 'core'
