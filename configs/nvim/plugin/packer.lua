vim.keymap.set("n", "<leader>pS", "<Cmd>PackerSync<CR>")
vim.keymap.set("n", "<leader>ps", "<Cmd>PackerStatus<CR>")

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("lewis6991/gitsigns.nvim")
	use("lewis6991/impatient.nvim")
	use("numToStr/Comment.nvim")
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	use("j-hui/fidget.nvim")
	use("p00f/nvim-ts-rainbow")
	use("lukas-reineke/indent-blankline.nvim")
	use("NvChad/nvim-colorizer.lua")
	use("jose-elias-alvarez/null-ls.nvim")
	use("echasnovski/mini.nvim")
	use("simrat39/rust-tools.nvim")

	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

	-- colorschemes
	use("decaycs/decay.nvim")
	use("shatur/neovim-ayu")
	use("sainnhe/sonokai")
	use("tanvirtin/monokai.nvim")
	use("Mofiqul/adwaita.nvim")
	use("ray-x/starry.nvim") -- mariana
	use("kdheepak/monochrome.nvim")
	use("fenetikm/falcon")
	use("glepnir/zephyr-nvim")
	use("nyoom-engineering/oxocarbon.nvim")
	use("luisiacc/gruvbox-baby")
	use("atelierbram/Base2Tone-nvim")

	-- use 'olivercederborg/poimandres.nvim'
	-- use 'JoosepAlviste/palenightfall.nvim'
	-- use 'rockerBOO/boo-colorscheme-nvim'
	-- use 'sainnhe/edge'
	-- use 'kvrohit/mellow.nvim'
	use("olimorris/onedarkpro.nvim")
	-- use 'folke/tokyonight.nvim'
	-- use 'tiagovla/tokyodark.nvim'
	-- use 'kvrohit/substrata.nvim'
	-- use 'olivercederborg/poimandres.nvim'
	-- use 'yonlu/omni.vim'
	-- use 'rebelot/kanagawa.nvim'
	-- use "EdenEast/nightfox.nvim"
	-- use 'projekt0n/github-nvim-theme'

	-- use 'rafamadriz/neon'
	-- use 'Abstract-IDE/Abstract-cs'

	-- use 'kyazdani42/blue-moon'

	-- use 'olimorris/onedarkpro.nvim'
	-- use 'rockyzhang24/arctic.nvim'
	-- use 'cpea2506/one_monokai.nvim'
	-- use 'chrsm/paramount-ng.nvim'
	-- use 'shaunsingh/moonlight.nvim'
	-- use 'andersevenrud/nordic.nvim'
	-- use 'shaunsingh/nord.nvim'
	-- use 'bkegley/gloombuddy'
	-- use 'mhartington/oceanic-next'
	-- use 'ramojus/meliora.nvim'
	-- use 'bluz71/vim-moonfly-colors'
	-- use 'bluz71/vim-nightfly-colors'
	-- use 'rose-pine/neovim'
	-- use 'Mofiqul/vscode.nvim'
	-- use 'Mofiqul/dracula.nvim'
	-- use 'ray-x/aurora'
	-- use 'NTBBloodbath/doom-one.nvim'
	-- use 'yazeed1s/minimal.nvim'

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
end)
