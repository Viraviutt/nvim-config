return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 300,
      },
    },
    config = function (_, opts)
      require("gitsigns").setup(opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "GitSignsAttached",
        callback = function (args)
          local gs = package.loaded.gitsigns
          local keymap_opts = { buffer = args.buf }

          vim.keymap.set("n", "]h", gs.next_hunk, keymap_opts) -- Siguiente cambio.
          vim.keymap.set("n", "[h", gs.prev_hunk, keymap_opts) -- Cambio anterior.
          vim.keymap.set("n", "<leader>hp", gs.preview_hunk, keymap_opts) -- Ver el diff completo.
        end,
      })
    end,
  },
}
