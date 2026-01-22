-- Variables globales
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Indentación
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.expandtab = true

-- Interfaz
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- Comportamiento
vim.opt.autowriteall = true -- Guardado automático

-- Auto-guardar al salir del modo Insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.modified then
      vim.cmd("write")
    end
  end,
})

-- Ajustes para Dadbod (DBUI)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.wo.foldenable = false
  end,
})
