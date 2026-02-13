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
		-- Color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- {
	--   -- Auto Save
	--   "okuuva/auto-save.nvim",
	--   opts = {
	--     debounce_delay = 1000,
	--     ftrigger_events = {
	--       immediate_save = { "FocusLost" }, -- "BufLeave", "FocusLost", "QuitPre"
	--       defer_save = { "InsertLeave", "TextChanged" },
	--       cancel_deferred_save = { "InsertEnter" },
	--     },
	--   },
	-- },
	{
		-- Show keymap available for current buffer
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>k",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		-- WakaTime
		{ "wakatime/vim-wakatime", lazy = false },
	},
	{
		-- Live Preview - md, html, css, js, etc
		"brianhuster/live-preview.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {},
	},
}
