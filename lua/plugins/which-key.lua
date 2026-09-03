return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { marks = true, registers = true, spelling = true },
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
			},
		},
		config = function(_, opts)
			require("which-key").setup(opts)

			local grp = vim.api.nvim_create_augroup("WhichKeyGroups", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = grp,
				pattern = { "c", "cpp", "cs", "lua", "rust" },
				callback = function()
					local m = {
						a = { name = "Code Action" },
						d = { name = "Debug (DAP)" },
						l = { name = "LSP" },
						r = { name = "Refactor" },
					}
					require("which-key").add(m, { mode = "n", buffer = 0 })
				end,
			})
		end,
	},
}
