return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			local parsers = {
				"typescript",
				"tsx",
				"javascript",
				"c_sharp",
				"c",
				"cpp",
				"html",
				"css",
				"lua",
				"json",
				"bash",
				"sql",
				"markdown",
				"rust",
				"cmake",
			}

			require("nvim-treesitter").install(parsers)

			local filetypes = {
				"typescript",
				"typescriptreact",
				"javascript",
				"c",
				"cpp",
				"html",
				"css",
				"lua",
				"json",
				"sh",
				"sql",
				"markdown",
				"rust",
				"cmake",
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function(args)
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldmethod = "expr"

					if args.match ~= "cs" then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
