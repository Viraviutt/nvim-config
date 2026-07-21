return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos." },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto en el proyecto." },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers abiertos." },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Ayuda de Neovim." },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Archivos recientes." },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    },
    config = function (_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
}
