return {
	'rebelot/heirline.nvim',
	event = 'UIEnter',

	dependencies = {-- {{{
        { 'nvim-tree/nvim-web-devicons' },
		{ 'lewis6991/gitsigns.nvim' },
    },-- }}}

	config = function()
		local conditions = require 'heirline.conditions'
		local utils = require 'heirline.utils'

		--[[--------------------------------------------------------------[[{{{
		--
		-- base = "#1e1e2e",
	  	-- blue = "#89b4fa",
		-- crust = "#11111b",
		-- flamingo = "#f2cdcd",
		-- green = "#a6e3a1",
		-- lavender = "#b4befe",
		-- mantle = "#181825",
		-- maroon = "#eba0ac",
		-- mauve = "#cba6f7",
		-- overlay0 = "#6c7086",
		-- overlay1 = "#7f849c",
		-- overlay2 = "#9399b2",
		-- peach = "#fab387",
		-- pink = "#f5c2e7",
		-- red = "#f38ba8",
		-- rosewater = "#f5e0dc",
		-- sapphire = "#74c7ec",
		-- sky = "#89dceb",
		-- subtext0 = "#a6adc8",
		-- subtext1 = "#bac2de",
		-- surface0 = "#313244",
		-- surface1 = "#45475a",
		-- surface2 = "#585b70",
		-- teal = "#94e2d5",
		-- text = "#cdd6f4",
		-- yellow = "#f9e2af"
		--    󰉖 󰈙 󰅡    
		--]]--------------------------------------------------------------]]}}}
		local colors = require 'catppuccin.palettes'.get_palette 'mocha'
		require 'heirline'.load_colors(colors)

		local Align = { provider = '%=' }
		local Space = { provider = ' ' }
		local SpaceR = { provider = ' → ', hl = {fg = 'overlay0'} }
		local SpaceL = { provider = ' ← ', hl = {fg = 'overlay0'} }

		local ViMode = {-- {{{
			init = function(self)
				self.mode = vim.fn.mode(1)
			end,

			static = {
				mode_names = {-- {{{
					n = "NORMAL",
					no = "N?",
					nov = "N?",
					noV = "N?",
					["no\22"] = "N?",
					niI = "Ni",
					niR = "Nr",
					niV = "Nv",
					nt = "Nt",
					v = "VISUAL",
					vs = "Vs",
					V = "V_",
					Vs = "Vs",
					["\22"] = "^V",
					["\22s"] = "^V",
					s = "S",
					S = "S_",
					["\19"] = "^S",
					i = "INSERT",
					ic = "Ic",
					ix = "Ix",
					R = "R",
					Rc = "Rc",
					Rx = "Rx",
					Rv = "Rv",
					Rvc = "Rv",
					Rvx = "Rv",
					c = "COMMAND",
					cv = "Ex",
					r = "...",
					rm = "M",
					["r?"] = "?",
					["!"] = "SHELL",
					t = "TERMINAL",
				},-- }}}

				mode_colors = {
					n = 'lavender',
					i = 'green',
					v = 'flamingo',
					V = 'flamingo',
					["\22"] = 'flamingo',
					c = 'peach',
					s = 'maroon',
					S = 'maroon',
					['\19'] = 'maroon',
					R = 'maroon',
					r = 'teal',
					['!'] = 'green',
					t = 'green',
				}
			},

			provider = function(self)
				return ' %2(' ..self.mode_names[self.mode].. '%)'
			end,

			hl = function(self)
				local mode = self.mode:sub(1, 1)
				return { fg = self.mode_colors[mode], bold = true}
			end,

			update = {
				'ModeChanged',
				pattern = "*:*",
				callback = vim.schedule_wrap(function()
					vim.cmd('redrawstatus')
				end),
			},
		} -- }}}

		local FileNameBlock = {-- {{{
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
		}-- }}}

		local FileIcon = {-- {{{
			init = function(self)
				local filename = self.filename
				local extension = vim.fn.fnamemodify(filename, ':e')
				self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
			end,
			provider = function(self)
				return self.icon and (self.icon .. ' ')
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end
		}-- }}}

		local FileName = {-- {{{
			flexible = 30,
			{
				provider = function(self)
					local filename = vim.fn.fnamemodify(self.filename, ':.')
					if filename == '' then return '[Scratch]' end
					if not conditions.width_percent_below(#filename, 0.25) then
						filename = vim.fn.pathshorten(filename)
					end
					return filename
				end,
			},
			{
				provider = function()
					return vim.fn.expand('%:t')
				end
			},
			hl = { fg = 'sapphire' },
		}-- }}}

		local FileFlags = {-- {{{
			{
				condition = function()
					return vim.bo.modified
				end,
				provider = ' ',
				hl = { fg = 'green' },
			},
			{
				condition = function()
					return not vim.bo.modifiable or vim.bo.readonly
				end,
				provider = ' ',
				hl = { fg = 'peach' },
			},
		}-- }}}

		local FileNameModifer = {-- {{{
			hl = function()
				if vim.bo.modified then
					return { fg = 'sky', bold = true, force=true }
				end
			end,
		}-- }}}

		FileNameBlock = utils.insert(FileNameBlock,-- {{{
			FileIcon,
			utils.insert(FileNameModifer, FileName),
			FileFlags,
			{ provider = '%<' }
		)-- }}}

		local FileType = {-- {{{
			provider = function()
				-- return string.upper(vim.bo.filetype)
				return vim.bo.filetype
			end,
			hl = { fg = 'lavender' },
		}-- }}}

		local FileEncoding = {-- {{{
			provider = function()
				local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
				-- return string.upper(enc)
				return enc
			end,
			hl = { fg = 'pink' }
		}-- }}}

		local FileFormat = {-- {{{
			provider = function()
				local fmt = vim.bo.fileformat
				return fmt
			end,
			hl = { fg = 'rosewater' }
		}-- }}}

		local FileSize = {-- {{{
			provider = function()
				local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
				local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
				fsize = (fsize < 0 and 0) or fsize
				if fsize < 1024 then
					return fsize .. suffix[1]
				end
				local i = math.floor((math.log(fsize) / math.log(1024)))
				return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
			end,
			-- hl = { fg = 'maroon', bold = true }
			hl = { fg = 'maroon' }
		}-- }}}

		local FileLastModified = {-- {{{
			provider = function()
				local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
				return (ftime > 0) and os.date("%c", ftime)
			end,
			hl = { fg = 'flamingo' }
		}-- }}}

		local Ruler = {-- {{{
			-- %l = current line number
			-- %L = number of lines in the buffer
			-- %c = column number
			-- %P = percentage through file of displayed window
			provider = '%7(%l/%3L%):%2c — %P ',
			hl = { fg = 'sky', bold = true }
		}-- }}}

		local ScrollBar = {-- {{{
			static = {
				sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
			},
			provider = function(self)
				local curr_line = vim.api.nvim_win_get_cursor(0)[1]
				local lines = vim.api.nvim_buf_line_count(0)
				local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
				return string.rep(self.sbar[i], 2)
			end,
			hl = { fg = 'sky', bg = 'surface0' },
		}-- }}}

		local LSPActive = {-- {{{
			condition = conditions.lsp_attached,
			update = { 'LspAttach', 'LspDetach' },
			-- provider = ' [LSP]',
			{
				provider = function()
					local names = {}
					for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
						table.insert(names, server.name)
					end
					return '󰅡 ' .. table.concat(names, ', 󰅡 ')
				end,
				hl = { fg = 'green', bold = true },
			},
			-- {
			-- 	provider = ' ← ',
			-- 	hl = { fg = 'overlay1' },
			-- }
		}-- }}}

		local Git = {-- {{{
			condition = conditions.is_git_repo,

			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self
			end,

			hl = { fg = 'mauve' },

			{
				provider = function(self)
					return " " .. self.status_dict.head
				end,
				hl = { bold = true }
			},
			{
				condition = function(self)
					return self.has_changes
				end,
				provider = "(",
				hl = { fg = 'overlay0' }
			},
			{
				provider = function(self)
					local count = self.status_dict.added or 0
					return count > 0 and (" " .. count)
				end,
				hl = { fg = 'teal' },
			},
			{
				provider = function(self)
					local count = self.status_dict.changed or 0
					return count > 0 and ("  " .. count)
				end,
				hl = { fg = 'peach' },
			},
			{
				provider = function(self)
					local count = self.status_dict.removed or 0
					return count > 0 and ("  " .. count)
				end,
				hl = { fg = 'red' },
			},
			{
				condition = function(self)
					return self.has_changes
				end,
				provider = ")",
				hl = { fg = 'overlay0' }
			},
			{
				condition = conditions.lsp_attached,
				provider = " ← ",
				hl = { fg = 'subtext0' }
			},
		}-- }}}

		local SearchCount = { --{{{
			condition = function()
				return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
			end,

			init = function(self)
				local ok, search = pcall(vim.fn.searchcount)
				if ok and search.total > 0 then
					self.search = search
				end
			end,
			provider = function(self)
				local search = self.search
				return string.format("[%d/%d]", search.current, math.min(search.total, search.maxcount))
			end,
			hl = { fg = 'subtext0' }
		} -- }}}

		local MacroRec = { -- {{{
			condition = function()
				return vim.fn.reg_recording() ~= '' and vim.o.cmdheight == 0
			end,
			provider = ' ',
			hl = { fg = 'yellow', bold = true },
			utils.surround({ "[", "]" }, nil, {
				provider = function()
					return vim.fn.reg_recording()
				end,
				hl = { fg = 'green', bold = true },
			}),
			update = {
				'RecordingEnter',
				'RecordingLeave',
			}
		} -- }}}

		-- assembling status line
		ViMode = utils.surround({ "", "" }, "surface0", { ViMode, MacroRec })
		LspG = utils.surround({ "", "" }, "surface0", { Git, LSPActive })

		local Nothing = { provider = "" }

		local DefaultStatusline = {-- {{{
			ViMode, Space, FileNameBlock, -- not flexible
			{ flexible = 40, Align, SpaceR },
			{ flexible = 20, { FileType, SpaceL }, Nothing },
			{ flexible = 10, { FileFormat, SpaceL }, Nothing },
			{ flexible = 10, { FileEncoding, SpaceL }, Nothing },
			{ flexible = 20, { FileSize, Space }, Nothing },
			{ flexible = 30, {
				utils.surround({ "", "" }, "surface0", { Ruler })
			}, {
				utils.surround({ "", "" }, "surface0", { Ruler })
			}},
			{ flexible = 30, ScrollBar, Nothing }
		}-- }}}

		local GitLSPStatusline = {-- {{{
			condition = function()
				if (conditions.lsp_attached() or conditions.is_git_repo()) then
					return true
				else
					return false
				end
			end,

			ViMode, Space, FileNameBlock, -- not flexible
			{ flexible = 40, Align, SpaceR },
			{ flexible = 30, { SearchCount, Space }, Nothing },
			{ flexible = 1, { LspG, Space }, Nothing },
			{ flexible = 20, { FileType, SpaceL }, Nothing },
			{ flexible = 10, { FileFormat, SpaceL }, Nothing },
			{ flexible = 10, { FileEncoding, SpaceL }, Nothing },
			{ flexible = 20, { FileSize, Space }, Nothing },
			{ flexible = 30, {
				utils.surround({ "", "" }, "surface0", { Ruler })
			}, {
				utils.surround({ "", "" }, "surface0", { Ruler })
			}},
			{ flexible = 30, ScrollBar, Nothing }
		}-- }}}

		local InactiveStatusline = {-- {{{
			condition = conditions.is_not_active,
			FileType, SpaceR, FileName, Align,
		}-- }}}

		local StatusLines = {-- {{{

			hl = function()
				if conditions.is_active() then
					return {
						bg = "mantle",
						fg = "text"
					}
				else
					return {
						bg = "base",
						force = true
					}
				end
			end,

			fallthrough = false,

			InactiveStatusline, GitLSPStatusline, DefaultStatusline,
		}-- }}}

		require('heirline').setup({
			statusline = StatusLines,
		})
	end
}
