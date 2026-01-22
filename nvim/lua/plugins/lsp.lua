return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      mason.setup({ ui = { icons = { package_installed = "✓" } } })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier", "stylua", "isort", "black", "pylint", "eslint_d",
          "sql-formatter", "php-cs-fixer", "ktlint",
        },
      })

      local capabilities = cmp_nvim_lsp.default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end

      -- AQUÍ ESTÁ LA CORRECCIÓN: handlers dentro de setup
      mason_lspconfig.setup({
        ensure_installed = {
          "ts_ls", "html", "cssls", "tailwindcss", "pyright",
          "jsonls", "eslint", "lua_ls", "intelephense", "kotlin_language_server",
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                Lua = { diagnostics = { globals = { "vim" } } },
              },
            })
          end,
        },
      })
    end,
  },
}
