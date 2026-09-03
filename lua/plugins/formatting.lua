return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"prettier",
				"csharpier",
				"stylua",
				"eslint_d",
				"clang-format",
				"cmakelang",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = "ConformInfo",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				cs = { "csharpier" },
				rust = { "rustfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				cmake = { "cmake-format" },
			},
			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 3000,
			},
		},
	},
}
