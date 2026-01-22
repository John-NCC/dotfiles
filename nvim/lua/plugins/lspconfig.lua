return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
	config = function()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end

  -- Lista de servidores que quieres usar
  local servers = { "ts_ls", "pyright", "html", "cssls", "tailwindcss", "jsonls", "eslint", "kotlin_language_server" }

  for _, server in ipairs(servers) do
    -- Define la configuración para ese servidor
    vim.lsp.config(server, {
      on_attach = on_attach,
      capabilities = capabilities,
    })
    -- Actívalo
    vim.lsp.enable(server)
  end
end
}

