return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf }
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
					end
					map("n", "gd", vim.lsp.buf.definition, "LSP: Ir a definición.")
					map("n", "gD", vim.lsp.buf.declaration, "LSP: Ir a declaración.")
					map("n", "gi", vim.lsp.buf.implementation, "LSP: Ir a implementación.")
					map("n", "gr", vim.lsp.buf.references, "LSP: Referencias.")
					map("n", "K", function()
						vim.lsp.buf.hover({
							border = "rounded",
							max_width = 100,
							max_height = 30,
						})
					end, "LSP: Hover.")
					map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Renombrar.")
					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code Action.")
					map("n", "<leader>ds", vim.lsp.buf.document_symbol, "LSP: Símbolos de documento.")
					map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "LSP: Símbolos de workspace.")
					map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "LSP: Agregar folder.")
					map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "LSP: Quitar folder.")
					map("n", "]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, "Siguiente diagnóstico.")
					map("n", "[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, "Anterior diagnóstico.")
					map("n", "<leader>de", vim.diagnostic.open_float, "LSP: Mostrar diagnóstico en float.")
					map("n", "<leader>q", vim.diagnostic.setloclist, "LSP: Diagnóstico a loclist.")
				end,
			})
		end,
	},
}
