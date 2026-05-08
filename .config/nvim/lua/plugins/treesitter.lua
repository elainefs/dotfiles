return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()
		require("nvim-treesitter").install({
			"lua",
			"bash",
			"python",
			"javascript",
			"typescript",
			"css",
			"html",
			"c",
			"sql",
			"dockerfile",
			"gitignore",
			"json",
			"toml",
			"yaml",
			"markdown",
			"markdown_inline",
		})

		local ignore = { alpha = true, lazy = true, mason = true, netrw = true, ["neo-tree"] = true }

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(e)
				if ignore[e.match] then
					return
				end
				local lang = vim.treesitter.language.get_lang(e.match)
				if lang then
					require("nvim-treesitter").install({ lang })
				end
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
