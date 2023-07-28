-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", { "nvim-0.5" }) ~= 1 then
	vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
	return
end

vim.api.nvim_command("packadd packer.nvim")

local no_errors, error_msg = pcall(function()
	_G._packer = _G._packer or {}
	_G._packer.inside_compile = true

	local time
	local profile_info
	local should_profile = false
	if should_profile then
		local hrtime = vim.loop.hrtime
		profile_info = {}
		time = function(chunk, start)
			if start then
				profile_info[chunk] = hrtime()
			else
				profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
			end
		end
	else
		time = function(chunk, start) end
	end

	local function save_profiles(threshold)
		local sorted_times = {}
		for chunk_name, time_taken in pairs(profile_info) do
			sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
		end
		table.sort(sorted_times, function(a, b)
			return a[2] > b[2]
		end)
		local results = {}
		for i, elem in ipairs(sorted_times) do
			if not threshold or threshold and elem[2] > threshold then
				results[i] = elem[1] .. " took " .. elem[2] .. "ms"
			end
		end
		if threshold then
			table.insert(results, "(Only showing plugins that took longer than " .. threshold .. " ms " .. "to load)")
		end

		_G._packer.profile_output = results
	end

	time([[Luarocks path setup]], true)
	local package_path_str =
		"/home/heis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/heis/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/heis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/heis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
	local install_cpath_pattern = "/home/heis/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
	if not string.find(package.path, package_path_str, 1, true) then
		package.path = package.path .. ";" .. package_path_str
	end

	if not string.find(package.cpath, install_cpath_pattern, 1, true) then
		package.cpath = package.cpath .. ";" .. install_cpath_pattern
	end

	time([[Luarocks path setup]], false)
	time([[try_loadstring definition]], true)
	local function try_loadstring(s, component, name)
		local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
		if not success then
			vim.schedule(function()
				vim.api.nvim_notify(
					"packer.nvim: Error running " .. component .. " for " .. name .. ": " .. result,
					vim.log.levels.ERROR,
					{}
				)
			end)
		end
		return result
	end

	time([[try_loadstring definition]], false)
	time([[Defining packer_plugins]], true)
	_G.packer_plugins = {
		["Base2Tone-nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/Base2Tone-nvim",
			url = "https://github.com/atelierbram/Base2Tone-nvim",
		},
		["Comment.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/Comment.nvim",
			url = "https://github.com/numToStr/Comment.nvim",
		},
		LuaSnip = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/LuaSnip",
			url = "https://github.com/L3MON4D3/LuaSnip",
		},
		["adwaita.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/adwaita.nvim",
			url = "https://github.com/Mofiqul/adwaita.nvim",
		},
		["cmp-buffer"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/cmp-buffer",
			url = "https://github.com/hrsh7th/cmp-buffer",
		},
		["cmp-nvim-lsp"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
			url = "https://github.com/hrsh7th/cmp-nvim-lsp",
		},
		["cmp-nvim-lua"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
			url = "https://github.com/hrsh7th/cmp-nvim-lua",
		},
		["cmp-path"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/cmp-path",
			url = "https://github.com/hrsh7th/cmp-path",
		},
		cmp_luasnip = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
			url = "https://github.com/saadparwaiz1/cmp_luasnip",
		},
		["decay.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/decay.nvim",
			url = "https://github.com/decaycs/decay.nvim",
		},
		falcon = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/falcon",
			url = "https://github.com/fenetikm/falcon",
		},
		["fidget.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/fidget.nvim",
			url = "https://github.com/j-hui/fidget.nvim",
		},
		["friendly-snippets"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/friendly-snippets",
			url = "https://github.com/rafamadriz/friendly-snippets",
		},
		["gitsigns.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
			url = "https://github.com/lewis6991/gitsigns.nvim",
		},
		["gruvbox-baby"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
			url = "https://github.com/luisiacc/gruvbox-baby",
		},
		["impatient.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/impatient.nvim",
			url = "https://github.com/lewis6991/impatient.nvim",
		},
		["indent-blankline.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
			url = "https://github.com/lukas-reineke/indent-blankline.nvim",
		},
		["lsp-zero.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
			url = "https://github.com/VonHeikemen/lsp-zero.nvim",
		},
		["lsp_lines.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
			url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		},
		["lualine.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/lualine.nvim",
			url = "https://github.com/nvim-lualine/lualine.nvim",
		},
		["mason-lspconfig.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
			url = "https://github.com/williamboman/mason-lspconfig.nvim",
		},
		["mason.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/mason.nvim",
			url = "https://github.com/williamboman/mason.nvim",
		},
		["monochrome.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/monochrome.nvim",
			url = "https://github.com/kdheepak/monochrome.nvim",
		},
		["monokai.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/monokai.nvim",
			url = "https://github.com/tanvirtin/monokai.nvim",
		},
		neogit = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/neogit",
			url = "https://github.com/TimUntersberger/neogit",
		},
		["neovim-ayu"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/neovim-ayu",
			url = "https://github.com/shatur/neovim-ayu",
		},
		["nvim-cmp"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/nvim-cmp",
			url = "https://github.com/hrsh7th/nvim-cmp",
		},
		["nvim-lspconfig"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
			url = "https://github.com/neovim/nvim-lspconfig",
		},
		["nvim-treesitter"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
			url = "https://github.com/nvim-treesitter/nvim-treesitter",
		},
		["nvim-ts-rainbow"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
			url = "https://github.com/p00f/nvim-ts-rainbow",
		},
		["nvim-web-devicons"] = {
			loaded = false,
			needs_bufread = false,
			path = "/home/heis/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
			url = "https://github.com/kyazdani42/nvim-web-devicons",
		},
		["oxocarbon.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/oxocarbon.nvim",
			url = "https://github.com/nyoom-engineering/oxocarbon.nvim",
		},
		["packer.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/packer.nvim",
			url = "https://github.com/wbthomason/packer.nvim",
		},
		["plenary.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/plenary.nvim",
			url = "https://github.com/nvim-lua/plenary.nvim",
		},
		["poimandres.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/poimandres.nvim",
			url = "https://github.com/olivercederborg/poimandres.nvim",
		},
		sonokai = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/sonokai",
			url = "https://github.com/sainnhe/sonokai",
		},
		["starry.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/starry.nvim",
			url = "https://github.com/ray-x/starry.nvim",
		},
		["telescope.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/telescope.nvim",
			url = "https://github.com/nvim-telescope/telescope.nvim",
		},
		["tokyonight.nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
			url = "https://github.com/folke/tokyonight.nvim",
		},
		["zephyr-nvim"] = {
			loaded = true,
			path = "/home/heis/.local/share/nvim/site/pack/packer/start/zephyr-nvim",
			url = "https://github.com/glepnir/zephyr-nvim",
		},
	}

	time([[Defining packer_plugins]], false)

	_G._packer.inside_compile = false
	if _G._packer.needs_bufread == true then
		vim.cmd("doautocmd BufRead")
	end
	_G._packer.needs_bufread = false

	if should_profile then
		save_profiles()
	end
end)

if not no_errors then
	error_msg = error_msg:gsub('"', '\\"')
	vim.api.nvim_command(
		'echohl ErrorMsg | echom "Error in packer_compiled: '
			.. error_msg
			.. '" | echom "Please check your config for correctness" | echohl None'
	)
end