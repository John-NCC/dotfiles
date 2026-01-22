return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        width = 30,
      },
    })
    
    -- Keymaps específicos de NeoTree
    vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle Explorer" })
    vim.keymap.set("n", "<leader>r", "<CMD>Neotree focus<CR>", { desc = "Focus Explorer" })
  end,
}
