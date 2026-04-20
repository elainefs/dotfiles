-- Indentation guides
return {
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
}
