local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap

-- leader
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- util
options = { noremap = true }

-- Basics
map('n', '<leader><esc>', ':nohlsearch<cr>', options)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<cr>', options)
map('n', '<leader>fg', ':Telescope live_grep<cr>', options)
map('n', '<leader>fb', ':Telescope buffers<cr>', options)
map('n', '<leader>fh', ':Telescope help_tags<cr>', options)

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
map('n', 'Q', '<Nop>', { })

-- Inlay Hints
map('n', '<Leader>T', ":lua require'lsp_extensions'.inlay_hints()", options)

-- lsp 
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', options)
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', options)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', options)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
map('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', options)
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', options)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)
map('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', options)
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", options)
