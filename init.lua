local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- needs to be set before lazy
vim.g.mapleader = " "

-- {{{
require 'lazy'.setup("plugins", {
	defaults = { lazy = true },
	install = { colorscheme = { 'catppuccin', 'slate' } },
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
})
-- }}}

require 'core'
