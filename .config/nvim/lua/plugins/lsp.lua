return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{ "mason-org/mason-lspconfig.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Servers with custom settings
			local server_settings = {
				pyright = {
					-- Resolve the venv python path at attach time so pyright always
					-- finds the correct interpreter regardless of working directory.
					before_init = function(_, config)
						local venv = vim.fn.finddir(".venv", vim.fn.getcwd() .. ";")
						if venv ~= "" then
							local python = venv .. "/bin/python"
							if vim.fn.executable(python) == 1 then
								config.settings.python.pythonPath = python
							end
						end
					end,
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "standard",
								autoImportCompletions = true,
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
				pylsp = {
					-- Auto-detect Django settings module by searching for settings.py.
					-- Handles projects where the app folder has different names.
					before_init = function(_, config)
						local root = vim.fn.getcwd()
						-- Try settings.py first, then settings/base.py
						local found = vim.fn.glob(root .. "/*/settings.py")
						if found == "" then
							found = vim.fn.glob(root .. "/*/settings/base.py")
						end
						if found ~= "" then
							-- Convert absolute path to dotted module name
							-- e.g. /home/user/project/myapp/settings.py -> myapp.settings
							local module = found:gsub(root .. "/", ""):gsub("/", "."):gsub("%.py$", "")
							table.insert(
								config.settings.pylsp.plugins.pylint.args,
								"--django-settings-module=" .. module
							)
						end
					end,
					settings = {
						pylsp = {
							plugins = {
								pyflakes = { enabled = false },
								pycodestyle = { enabled = false },
								autopep8 = { enabled = false },
								yapf = { enabled = false },
								mccabe = { enabled = false },
								pylsp_mypy = { enabled = false },
								pylsp_isort = { enabled = false },
								pylsp_black = { enabled = false },
								pylint = {
									enabled = true,
									args = {
										"--load-plugins=pylint_django",
									},
								},
							},
						},
					},
				},
				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders=1",
					},
				},
				bashls = {
					filetypes = { "sh", "bash", "zsh" },
				},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim", "require" } },
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						},
					},
				},
			}

			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"pylsp",
					"clangd",
					"bashls",
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"jsonls",
					"phpactor",
				},
				automatic_enable = false,
			})

			-- Enable all installed servers, applying custom settings where defined
			local installed = require("mason-lspconfig").get_installed_servers()
			for _, name in ipairs(installed) do
				local settings = server_settings[name] or {}
				vim.lsp.config(
					name,
					vim.tbl_deep_extend("force", settings, {
						capabilities = capabilities,
					})
				)
				vim.lsp.enable(name)
			end

			-- Keymaps and features when a LSP is attached on a buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
				callback = function(ev)
					local map = function(keys, fn, desc)
						vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
					end

					map("K", vim.lsp.buf.hover, "Documentation")
					map("gd", vim.lsp.buf.definition, "Go to definition")
					map("gD", vim.lsp.buf.declaration, "Go to declaration")
					map("gi", vim.lsp.buf.implementation, "Implementations")
					map("go", vim.lsp.buf.type_definition, "Type definition")
					map("gr", vim.lsp.buf.references, "References")
					map("gs", vim.lsp.buf.rename, "Rename symbol")
					map("ga", vim.lsp.buf.code_action, "Code actions")
					map("<leader>ld", vim.diagnostic.open_float, "Diagnostic float")
					map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
					map("]d", vim.diagnostic.goto_next, "Next diagnostic")
				end,
			})

			-- Configuration for Diagnostic Sign
			vim.diagnostic.config({
				virtual_text = {
					spacing = 3,
					prefix = "●",
				},
				float = {
					border = "rounded",
					style = "minimal",
					focusable = true,
					close_events = {
						"BufLeave",
						"CursorMoved",
						"InsertEnter",
						"FocusLost",
					},
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "󰌵",
					},
				},
			})
		end,
	},
}
