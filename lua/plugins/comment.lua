return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			mappings = false,
			pre_hook = function(ctx)
				local commentstring = ctx.ctype == "c" or ctx.ctype == "cpp"
				local location = ctx.location
				if commentstring and location then
					location.scm = location.scm:gsub("/%*%s*/", "//")
				end
				return require("Comment.api").get_comment(ctx)
			end,
		},
		config = function(_, opts)
			require("Comment").setup(opts)
			vim.keymap.set("n", "gcc", function()
				require("Comment.api").toggle.linewise.current()
			end, { desc = "Toggle comment line" })
			vim.keymap.set("n", "gbc", function()
				require("Comment.api").toggle.blockwise.current()
			end, { desc = "Toggle comment block" })
		end,
	},
}
