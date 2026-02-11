return {
	{
		-- Plugin for integration between LuaLSP and Neovim
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "html", "cssls", "ts_ls", "zunba", "phpactor" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local mason_lsp = require("mason-lspconfig")
			mason_lsp.setup()
			local servers = mason_lsp.get_installed_servers()

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
				vim.lsp.enable(server)
			end

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Documentation" })
			vim.keymap.set("n", "<F2>", vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set("n", "<F3>", "<cmd>Telescope lsp_references<CR>", { desc = "Show References" })
			vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code Actions" })
		end,
	},
}
