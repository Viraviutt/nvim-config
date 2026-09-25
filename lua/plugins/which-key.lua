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

			require("which-key").register({
				{ "", group = "Refactor" },
				{ "", group = "Debug (DAP)" },
				{ "", group = "Code Action" },
				{ "", group = "LSP" },
			})
		end,
	},
}
