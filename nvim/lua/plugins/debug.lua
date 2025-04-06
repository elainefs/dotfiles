return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			-- UI Configurations
			dapui.setup()
			require("nvim-dap-virtual-text").setup()

			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Keymap for Debug
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<F6>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F8>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>tb", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>lr", dapui.toggle, { desc = "Debug: See last session result." })

			-- Configurations for Python
			-- Make sure you have "debugpy" installed
			dap.adapters.python = {
				type = "executable",
				command = vim.fn.systemlist("pyenv which python")[1],
				args = { "-m", "debugpy.adapter" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Debug Arquivo Python",
					program = "${file}",
					pythonPath = function()
						return vim.fn.exepath("python")
					end,
				},
			}

			-- Configurations for JavaScript (Node.js)
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "127.0.0.1",
				port = 8123,
				executable = {
					command = "js-debug-adapter",
				},
			}

			for _, language in ipairs({ "typescript", "javascript" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						runtimeExecutable = "node",
					},
				}
			end
		end,
	},
}
