return {
	{
		"danymat/neogen",
		cmd = { "Neogen" },
		opts = {
			enabled = true,
		},
		keys = {
			{
				"<leader>dg",
				function()
					require("neogen").generate()
				end,
				mode = "n",
				desc = "Neogen: generar doc para firma actual.",
			},
			{
				"<leader>dc",
				function()
					require("neogen").generate({ type = "class" })
				end,
				mode = "n",
				desc = "Neogen: generar doc para clase.",
			},
			{
				"<leader>df",
				function()
					require("neogen").generate({ type = "func" })
				end,
				mode = "n",
				desc = "Neogen: generar doc para funcion.",
			},
		},
	},
}
