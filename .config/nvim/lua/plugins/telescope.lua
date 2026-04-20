return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",

			build = "make",

			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						--['<C-k>'] = require('telescope.actions').move_selection_previous, -- move to prev result
						--['<C-j>'] = require('telescope.actions').move_selection_next, -- move to next result
						--['<C-l>'] = require('telescope.actions').select_default, -- open file
					},
				},
			},
			pickers = {
				find_files = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					hidden = true,
				},
			},
			live_grep = {
				file_ignore_patterns = { "node_modules", ".git", ".venv" },
				additional_args = function(_)
					return { "--hidden" }
				end,
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_cursor(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>w", builtin.grep_string, { desc = "Search current Word" })
		vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Search Files" })
		vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Search by Grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Search Recent Files" })
		-- vim.keymap.set("n", "<leader>s", builtin.resume, { desc = "Search Resume" })
		--vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
	end,
}
