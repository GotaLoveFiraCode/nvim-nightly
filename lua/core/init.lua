-- General Settings (i.e. vim.opt) {{{
vim.opt.scs = true
vim.opt.sta = true
vim.opt.si  = true
vim.opt.ts  = 4
vim.opt.et  = false
vim.opt.sw  = 4
vim.opt.nu  = true
vim.opt.rnu = true
vim.opt.cul = true
vim.opt.spr = true
vim.opt.so  = 8
vim.opt.swf = false
vim.opt.ls  = 3
vim.opt.sm  = true
vim.opt.tgc = true
vim.opt.ut  = 300
vim.opt.to  = true
vim.opt.tm  = 300
vim.opt.cc  = "80"
vim.opt.bri = true -- causes indent-blankline to break if true (in some ver.)
vim.opt.udf = true
vim.opt.wrap = false
vim.opt.bg = 'dark'
vim.opt.tags = './tags;$HOME'
vim.opt.title = true
vim.opt.fde = 'nvim_treesitter#foldexpr()'

-- vim.opt.fdm = 'marker'
-- vim.opt.cmdheight = 0
-- vim.opt.completeopt = { 'menu', 'menuone', 'noinsert' }
-- vim.opt.fdc='auto:3'
-- vim.o.fillchars = [[foldopen:▼,foldclose:⏵,foldsep: ]]
-- vim.o.statuscolumn = '%=%l%s%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▼" : "⏵") : " " }'
-- vim.o.statuscolumn='%=%l%s%{foldlevel(v:lnum) > 0 ? (foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▼" : "⏵") : "│") : " " }'
-- }}}

-- Remove bg from folds
vim.api.nvim_set_hl(0, 'Folded', {bg = nil, fg = '#89b4fa'})

-- <leader>oo == fold paragraph/open fold {{{
vim.keymap.set('n', '<leader>oo', function()
	local foldclosed = vim.fn.foldclosed(vim.fn.line("."))
	if foldclosed == -1 then
		vim.cmd([[silent! normal! zfip]])
	else
		vim.cmd("silent! normal! zo")
	end
end)
-- }}}

-- {{{ <leader>o<leader> == switch foldmethod
vim.keymap.set('n', '<leader>o<leader>', function()
	if vim.o.foldmethod == 'manual' then
		vim.opt.foldmethod = 'marker'
	elseif vim.o.foldmethod == 'marker' then
		vim.opt.foldmethod = 'expr'
	elseif vim.o.foldmethod == 'expr' then
		vim.opt.foldmethod = 'manual'
	end
	print(vim.cmd.set("foldmethod?"))
end)
-- }}}

-- keymaps… {{{
vim.keymap.set('n', '<C-s>', vim.cmd.w)
vim.keymap.set('n', '<M-u>', vim.cmd.noh)
vim.keymap.set({'n', 'v'}, '<C-p>', '"+')

vim.keymap.set('n', 'g-', ':')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '0', '^')
vim.keymap.set('n', '^', '0')
-- }}}

-- for front-end neovide, nvim ignores this {{{
if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font:h14:#e-subpixelantialias:#h-full"
	vim.opt.linespace = 1
	 vim.g.neovide_padding_top = 4
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_theme = 'dark'
	vim.g.neovide_refresh_rate = 144
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
-- }}}
