vim.g.mapleader = " "

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Asignar Ctrl+I para formatear el archivo
vim.api.nvim_set_keymap("n", "<C-i>", ":normal! gg=G<CR>", { noremap = true, silent = true })

-- A continuación se añade los keymaps para el plugin dadbod.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.keymap.set("n", "<leader>S", "<CMD>DBExec<CR>", { buffer = true })
    vim.keymap.set("v", "<leader>S", "<CMD>DBExec<CR>", { buffer = true })
    vim.keymap.set("n", "<leader>W", "<CMD>DBSaveQuery<CR>", { buffer = true })
    vim.keymap.set("n", "<leader>E", "<CMD>DBEditQuery<CR>", { buffer = true })
    vim.keymap.set("n", "<leader>H", "<CMD>DBToggleDetails<CR>", { buffer = true })
    vim.keymap.set("n", "<leader>R", "<CMD>DBRedraw<CR>", { buffer = true })
    vim.keymap.set("n", "o", "<CMD>DBUIOpenConnection<CR>", { buffer = true })
  end,
})
