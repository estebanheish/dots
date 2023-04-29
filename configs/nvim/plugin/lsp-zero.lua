-- lsp zero
local lsp = require("lsp-zero")
lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.configure("hls", {
	force_setup = true,
})

local rust_lsp = lsp.build_options("rust_analyzer", {})

lsp.setup()

require("rust-tools").setup({ server = rust_lsp })

vim.opt.signcolumn = "yes"
vim.keymap.set("n", "<leader>w", vim.lsp.buf.format)
