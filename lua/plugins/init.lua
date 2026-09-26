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
				update_in_insert = true,
			})

			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--function-arg-placeholders=0",
				},
				init_options = {
					fallbackFlags = {},
				},
				on_attach = function(client, bufnr)
					if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
						pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
					end
					if vim.lsp.semantic_tokens then
						vim.lsp.semantic_tokens.refresh_delay = 600
					end
				end,
			})

			-- Silencia stale semantic_tokens "Content modified" errors de clangd.
			local _lsp_log_info = vim.lsp.log.info
			vim.lsp.log.info = function(method, msg, ...)
				if method == "semantic_tokens" and type(msg) == "table" then
					local m = msg.message or msg[2] or ""
					if type(m) == "string" and m:match("Content modified") then
						return
					end
				end
				return _lsp_log_info(method, msg, ...)
			end
		end,
	},
}
