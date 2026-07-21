return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
 
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "ts_ls",
        "angularls",
        "html",
        "cssls",
        "tailwindcss",
        "omnisharp",
        "lua_ls",
        "jsonls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
  },
}

