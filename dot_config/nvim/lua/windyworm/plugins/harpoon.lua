
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      projects = {
        refresh_projects_b4update = false,
      },
    })

    vim.keymap.set("n", "<leader>A", function() harpoon:list():add() end, { desc = "Add file to harpoon" })
    vim.keymap.set("n", "<leader>a", function() harpoon:list():prepend() end, { desc = "Prepend file to harpoon" })

    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle harpoon" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "harpoon file 4" })
  end,
}
