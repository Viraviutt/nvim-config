return {
  {
    "jake-stewart/multicursor.nvim",
    -- El bloque lazy del README oficial usa `branch = "1.0"`, pero esa rama
    -- ya no existe en el repo. Se omite para que lazy.nvim use `main`.
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Mapeos VS Code: añadir/saltar cursor por coincidencia de palabra/selección.
      -- Solo `n,x` para no chocar con nvim-cmp (que usa <C-n>/<C-p> en insert).
      set({ "n", "x" }, "<C-d>", function() mc.matchAddCursor(1) end,
        { desc = "Añadir siguiente ocurrencia al multicursor." })
      set({ "n", "x" }, "<C-D>", mc.matchAllAddCursors,
        { desc = "Añadir cursors en todas las ocurrencias." })
      set({ "n", "x" }, "<C-n>", mc.nextCursor,
        { desc = "Mover al siguiente cursor." })
      set({ "n", "x" }, "<C-p>", mc.prevCursor,
        { desc = "Mover al cursor anterior." })

      -- Mouse: añadir cursor con Ctrl+Click / arrastrar.
      set("n", "<C-LeftMouse>", mc.handleMouse)
      set("n", "<C-LeftDrag>", mc.handleMouseDrag)
      set("n", "<C-LeftRelease>", mc.handleMouseRelease)

      -- Layer: <Esc> solo se intercepta cuando hay multicursor activo.
      -- Si los cursors están bloqueados, los desbloquea; si están activos, los limpia.
      mc.addKeymapLayer(function(layerSet)
        layerSet("n", "<Esc>", function()
          if mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end, { desc = "Limpiar multicursor." })
      end)

      -- Personalización de highlights (defaults del plugin adaptados a catppuccin).
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}
