return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{
			"<leader>sf",
			function()
				require("fzf-lua").files()
			end,
			desc = "Search files",
		},
		{
			"<leader>sg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Search in code",
		},
		{
			"<leader>sb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Search buffers",
		},
		{
			"<leader>sh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "Search help",
		},
		{
			"<leader>sr",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "Recent files",
		},
		{
			"<leader>sd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "Buffer diagnostics",
		},
	},
	config = function()
		require("fzf-lua").setup({ "telescope" })
	end,
}
