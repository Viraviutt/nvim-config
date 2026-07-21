return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				telescope = true,
				neotree = true,
				which_key = true,
				native_lsp = {
					enabled = true,
				},
				mason = true,
				dap = true,
				dap_ui = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
