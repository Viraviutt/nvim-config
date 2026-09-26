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
			-- Workarounds: terminal intercepta <C-v> y <C-c> es SIGINT-prone.
			-- Registrados via which-key para que el popup no se dispare al presionarlos.
			{
				"<leader>v",
				"<C-v>",
				desc = "Modo visual block.",
				mode = "n",
			},
			{
				"<leader>y",
				"<cmd>silent %y+<cr>",
				desc = "Copiar todo el buffer al portapapeles.",
				mode = "n",
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
