vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cs", "c", "cpp" },
	callback = function()
		vim.opt_local.cindent = true
		vim.opt_local.autoindent = true
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.smartindent = false
		vim.opt_local.softtabstop = 4
		vim.opt_local.cinoptions = "l1,g0,(0"
	end,
})
