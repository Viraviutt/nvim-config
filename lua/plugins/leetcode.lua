return {
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		cmd = "Leet",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			plugins = {
				non_standalone = true,
			},
			console = {
				open_on_runcode = true,
			},
			storage = {
				home = "/mnt/c/Users/vrvil/Documents/Proyectos/Practicas/LeetCode/C++",
			},
			injector = {
				cpp = {
					imports = {},
					after = "",
				},
			},
		},
		keys = {
			{ "<leader>ll", function() vim.cmd("Leet list") end,    desc = "LeetCode: listar problemas.",    mode = { "n" } },
			{ "<leader>lr", function() vim.cmd("Leet random") end,  desc = "LeetCode: problema random.",      mode = { "n" } },
			{ "<leader>ld", function() vim.cmd("Leet daily") end,   desc = "LeetCode: daily challenge.",      mode = { "n" } },
			{ "<leader>lt", function() vim.cmd("Leet test") end,    desc = "LeetCode: correr tests.",         mode = { "n" } },
			{ "<leader>ls", function() vim.cmd("Leet submit") end,  desc = "LeetCode: enviar solución.",      mode = { "n" } },
			{ "<leader>lg", function() vim.cmd("Leet lang") end,    desc = "LeetCode: cambiar lenguaje.",     mode = { "n" } },
			{ "<leader>lo", function() vim.cmd("Leet console") end, desc = "LeetCode: consola del problema.", mode = { "n" } },
			{ "<leader>lx", function() vim.cmd("Leet exit") end,    desc = "LeetCode: salir.",                mode = { "n" } },
		},
	},
}
