return {
	{
		"mg979/vim-visual-multi",
		init = function()
			vim.g.VM_default_mapping = 0
			vim.g.VM_maps = {
				["Find Under"] = "<C-d>",
				["Select All"] = "<C-l>",
				["Skip Region"] = "<C-x>",
				["Remove Region"] = "<C-p>",
				["Add Cursor Down"] = "<M-Down>",
				["Add Cursor Up"] = "<M-Up>",
			}
			vim.g.VM_add_cursor_at_pos_no_mappings = 1

			-- Themes "default", "purplegray", "ocean", "iceblue", "neon"
			-- vim.g.VM_theme = "neon"
		end,
	},
}
