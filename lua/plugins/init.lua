return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				"ts_ls",
				"angularls",
				"html",
				"cssls",
				"tailwindcss",
				"omnisharp",
				"lua_ls",
				"jsonls",
				"rust_analyzer",
				"clangd",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
			})

			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--function-arg-placeholders=0",
				},
				init_options = {},
				before_init = function(init_params)
					local filename = vim.api.nvim_buf_get_name(0)
					local flags
					if
						filename:match("%.c$")
						and not filename:match("%.cpp$")
						and not filename:match("%.cc$")
						and not filename:match("%.cxx$")
					then
						flags = { "-std=c17" }
					else
						flags = { "-std=c++17" }
					end
					init_params.init_options = init_params.init_options or {}
					init_params.init_options.fallbackFlags = flags
				end,
			})
		end,
	},
}
