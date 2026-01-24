vim.g.mapleader = " "

vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.completeopt = { "menuone", "popup", "noinsert" }

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.listchars = { tab = ' ', multispace = '|   ', eol = '󰌑', extends = "…", nbsp = "␣", precedes = "…" }
vim.opt.list = false
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 5
vim.opt.laststatus = 3

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })
vim.keymap.set("v", "<", "<gv", { desc = "Outdent and keep selection" })

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})

vim.pack.add({
    "https://github.com/vague-theme/vague.nvim",
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/EdenEast/nightfox.nvim",
})

vim.cmd("colorscheme carbonfox")

require('mini.pick').setup()
vim.keymap.set({ "n" }, "<leader>f", ':Pick files<CR>')
vim.keymap.set({ "n" }, "<leader>/", ':Pick grep_live<CR>')
vim.keymap.set({ "n" }, "<leader>h", ':Pick help<CR>')

require("oil").setup()
vim.keymap.set({ 'n' }, "<leader>e", ':Oil<CR>')

vim.lsp.enable({ 'lua_ls', 'nil_ls', 'hls', 'rust_analyzer', 'basedpyright', 'taplo' })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    vim.keymap.set({ "n" }, "<leader>r", vim.lsp.buf.format, { desc = "lsp format buffer" })
    vim.keymap.set("n", "cd", vim.lsp.buf.rename, { desc = "LSP Rename" })
  end,
})
vim.keymap.set({ "n" }, "<leader>l", vim.diagnostic.open_float, { desc = "open diagnostics pop up" })

