return {
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Autoclose tags html and more
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
	{
		-- Show available keymaps for current buffer when press <leader> key
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = { preset = "helix" },
	},
	{
		-- Show outline
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {},
	},
	{
		-- WakaTime
		"wakatime/vim-wakatime",
		lazy = false,
		opts = {
			status_bar_enabled = false,
		},
	},
}
