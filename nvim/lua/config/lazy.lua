-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Modificación agregada por John ---
vim.o.autowriteall = true

--vim.fn.timer_start(1000, function()
--  if vim.bo.modified then
--    vim.cmd("write")  -- "writer" no es un comando válido, parece que querías "write"
--  end
--end, {["repeat"] = -1})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.modified then
      vim.cmd("write")
    end
  end,
})


vim.opt.clipboard = "unnamedplus"
vim.o.tabstop = 3      -- Número de espacios que representa un tabulador (tabstop)
vim.o.shiftwidth = 3   -- Cantidad de espacios para el auto-indentado
vim.o.softtabstop = 3  -- Número de espacios que se usan al presionar 'Tab' en el modo de edición

-- Lo siguiente es para que muestre las consultas del plugin dadbod.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.wo.foldenable = false
  end,
})
-------------------------------------

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})



