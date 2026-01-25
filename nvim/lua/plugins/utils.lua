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
		-- Beautify Notify
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {},
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		},
	},
	{
		-- Wakatime
		{ "wakatime/vim-wakatime", lazy = false },
	},
	{
		-- Indentation guides
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				smart_indent_cap = true,
			},
			scope = {
				enabled = false,
			},
			exclude = {
				filetypes = { "help", "dashboard", "alpha", "packer", "nvimtree", "toggleterm", "neo-tree" },
			},
			whitespace = {
				remove_blankline_trail = true,
			},
		},
		config = function(_, opts)
			require("ibl").setup(opts)
		end,
	},
	{
		-- Live Preview - md, html, css, js, etc
		"brianhuster/live-preview.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		-- Plugin for integration between LuaLSP and Neovim
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
}
