return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"cssls",
				"eslint",
				"html",
				"jsonls",
				"ts_ls",
				"pyright",
				"tailwindcss",
				"texlab",
				"intelephense", -- Agregado para PHP
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"latexindent",
				"sql-formatter", -- Agregado para formatear SQL
				"sqlfluff", -- Agregado para linting de SQL
				"sqlfmt", -- Agregado para formateo SQL
				"php-cs-fixer", -- Agregado para PHP
				"phpactor", -- Agregado para PHP
				"php-debug-adapter", -- Agregado para PHP
				"phpcbf", -- Agregado para PHP
				"phpcs", -- Agregado para PHP
				"phpmd", -- Agregado para PHP
				"phpstan", -- Agregado para PHP
				"ktlint", -- Agregado para formatear Kotlin
			},
		})
	end,
}
