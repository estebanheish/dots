local o = vim.o -- global
local bo = vim.bo -- buffer-local
local wo = vim.wo -- window-local
-- binds
local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap

o.ignorecase = true
o.smartcase = true
o.mouse = 'a'
-- o.number = true
o.relativenumber = true
o.cursorline = true
o.number = true
o.splitbelow = true
o.splitright = true
o.scrolloff = 5
o.ts = 4
o.sw = 4
o.sts = 4
o.et = true
o.completeopt = 'menu,menuone,noselect'
o.termguicolors = true
o.cmdheight = 1
o.updatetime = 300
o.laststatus = 3

-- leader
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- util
local options = { noremap = true }

-- Basics
map('n', '<leader>h', ':nohlsearch<cr>', options)
map('n', '<leader>y', ':Ex<cr>', options)

-- buffers
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)
map('n', '[b', ':bprev<cr>', options)
map('n', ']b', ':bnext<cr>', options)
map('n', '[B', ':bfirst<cr>', options)
map('n', ']B', ':blast<cr>', options)

-- split navigation
map('n', '<C-h>', '<C-w>h', options)
map('n', '<C-j>', '<C-w>j', options)
map('n', '<C-k>', '<C-w>k', options)
map('n', '<C-l>', '<C-w>l', options)

-- remove ex mode
map('n', 'Q', '<Nop>', {})

-- highlight yanked text momentarily
vim.api.nvim_command("au TextYankPost * silent! lua vim.highlight.on_yank()")
