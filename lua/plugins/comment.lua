return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			pre_hook = function(ctx)
				local commentstring = ctx.ctype == "c" or ctz.ctype == "cpp"
				local location = ctx.location
				if commentstring and location then
					location.scm = location.scm:gsub("/%*%s*/", "//")
				end
				return require("Comment.api").get_comment(ctx)
			end,
		},
	},
}
