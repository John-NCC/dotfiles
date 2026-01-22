return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<F7>]], -- Tecla para abrir/cerrar
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })
  end,
}
