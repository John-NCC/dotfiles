local map = vim.keymap.set

-- Básicos
map("n", "<leader>w", "<CMD>update<CR>", { desc = "Guardar" })
map("n", "<leader>q", "<CMD>q<CR>", { desc = "Salir" })
map("i", "jk", "<ESC>", { desc = "Salir Insert" })

-- Ventanas
map("n", "<leader>o", "<CMD>vsplit<CR>", { desc = "Split Vertical" })
map("n", "<leader>p", "<CMD>split<CR>", { desc = "Split Horizontal" })

-- Navegación Ventanas
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Formato rápido
map("n", "<C-i>", "gg=G<C-o>", { desc = "Indentación Auto" })

-- Dadbod SQL
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    local opts = { buffer = true }
    map("n", "<leader>S", "<CMD>DBExec<CR>", opts)
    map("v", "<leader>S", "<CMD>DBExec<CR>", opts)
    map("n", "<leader>W", "<CMD>DBSaveQuery<CR>", opts)
    map("n", "<leader>E", "<CMD>DBEditQuery<CR>", opts)
    map("n", "<leader>H", "<CMD>DBToggleDetails<CR>", opts)
    map("n", "<leader>R", "<CMD>DBRedraw<CR>", opts)
    map("n", "o", "<CMD>DBUIOpenConnection<CR>", opts)
  end,
})
