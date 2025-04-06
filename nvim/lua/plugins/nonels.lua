return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		-- Formatters & linters for mason to install
		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier", -- ts/js, md, html, css formatter
				"stylua", -- lua formatter
				"shfmt", -- Shell formatter
				"djlint", -- Django Template formatter
				"ruff", -- Python linter and formatter
				"phpcbf", -- Formatter for PHP
				"phpcs", -- Linter for PHP
			},
			automatic_installation = true,
		})

		local sources = {
			formatting.prettier.with({
				filetypes = { "html", "css", "javascript", "typescript", "jsx", "json", "yaml", "markdown" },
			}),
			formatting.stylua,
			formatting.shfmt.with({ args = { "-i", "4" } }),
			formatting.djlint.with({ extra_args = { "--profile=django" } }),
			formatting.phpcbf.with({ extra_args = { "--standard=PSR12" } }),
			diagnostics.phpcs.with({ extra_args = { "--standard=PSR12" } }),
			require("none-ls.formatting.ruff").with({
				extra_args = { "--extend-select", "I" },
			}),
			require("none-ls.formatting.ruff_format"),
		}

		null_ls.setup({
			sources = sources,
		})

		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format()
			vim.cmd("write")
		end, { desc = "Format and Save Buffer" })
	end,
}
