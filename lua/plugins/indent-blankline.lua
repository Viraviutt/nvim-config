return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl",
		---@type ibl.config
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			indent = { char = "▏" },
			scope = { enabled = true },
		},
		config = function(_, opts)
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IblScope", { fg = "#cba6f7", bold = true })
			end)

			require("ibl").setup(opts)
		end,
	},
}
