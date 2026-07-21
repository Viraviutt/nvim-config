return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",

    config = function ()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath('data') .. '/site'
      })

      local parsers = {
        "typescript",
        "tsx",
        "javascript",
        "c_sharp",
        "html",
        "css",
        "lua",
        "json",
        "bash",
        "sql",
        "markdown",
      }

      require("nvim-treesitter").install(parsers)

      local filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "html",
        "css",
        "cs",
        "lua",
        "json",
        "sh",
        "sql",
        "markdown",
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function () 
          vim.treesitter.start() 
          vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.wo[0][0].foldmethod = 'expr'
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
