local pack = "lazy"

local function bootstrap(url)
	local name = url:gsub(".*/", "")
	local path = vim.fn.stdpath("data") .. "/lazy/" .. name
	vim.opt.rtp:prepend(path)

	if vim.fn.isdirectory(path) == 0 then
		print(":: Installing '" .. name .. "' in data dir.")
		vim.fn.system {"git", "clone", url, path}

		vim.cmd "redraw"
		print(":: Finished installing " .. name)
	end
end

bootstrap("https://github.com/udayvir-singh/tangerine.nvim")
bootstrap("https://github.com/udayvir-singh/hibiscus.nvim")

require 'tangerine'.setup {}

-- @@ OLD LAZY.NVIM CONFIG @@


-- Needs to be set before lazy.nvim is called.

-- require 'lazy'.setup("plugins", { -- {{{
-- 	defaults = { lazy = true },
-- 	install = { colorscheme = { 'catppuccin', 'habamax' } },
-- 	checker = { enabled = true, concurrency = 1 },
-- 	performance = {
-- 		rtp = {
-- 			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "tarPlugin",
				-- "tutor",
				-- "zipPlugin",
				-- "tohtml",
				-- "netrwPlugin",
				-- "editorconfig",
-- 			}
-- 		}
-- 	}
-- }) -- }}}

-- require 'core'
