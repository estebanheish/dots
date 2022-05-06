local o = vim.o    -- global
local bo = vim.bo  -- buffer-local
local wo = vim.wo  -- window-local

o.smartcase = true
o.mouse = 'a'
o.number = true
o.relativenumber = true
o.splitbelow = true
o.splitright = true
o.scrolloff = 5
o.ts = 4
o.sw = 4
o.sts = 4
o.et = true
o.completeopt = 'menu,menuone,noselect'
o.termguicolors = true
o.cmdheight=2
o.updatetime=300


-- rust 
vim.cmd("let g:rustfmt_autosave = 1")
