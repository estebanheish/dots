local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,

		-- python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.diagnostics.flake8,

		-- django templates
		null_ls.builtins.diagnostics.curlylint

		-- sell
		null_ls.builtins.code_actions.shellcheck,

		-- nix
		null_ls.builtins.diagnostics.deadnix,
		null_ls.builtins.formatting.alejandra,

		-- lua
		null_ls.builtins.formatting.stylua,
	},
})
