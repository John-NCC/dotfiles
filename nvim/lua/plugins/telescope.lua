return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup()

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Buscar archivos" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Buscar texto en archivos" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buscar buffers abiertos" })
    vim.keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Estado de Git" })
  end,
}
