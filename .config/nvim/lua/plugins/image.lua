return {
	"3rd/image.nvim",
	event = "VeryLazy",
	opts = {
		backend = "kitty", -- or "ueberzug" or "sixel"
		processor = "magick_rock", -- "magick_rock" better than "magick_cli"
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "markdown", "vimwiki" },
        resolve_image_path = function (document_path, image_path, fallback)
          return fallback(document_path, image_path)
        end
			},
			neorg = {
				enabled = true,
				filetypes = { "norg" },
			},
			typst = {
				enabled = true,
				filetypes = { "typst" },
			},
			html = { enabled = false },
			css = { enabled = false },
			telescope = {
				enabled = true,
			},
			neotree = {
				enabled = true,
				clear_prev_image = true,
			},
		},
		max_width = nil,
		max_height = nil,
		max_width_window_percentage = nil,
		max_height_window_percentage = 50,
		scale_factor = 1.0,
		window_overlap_clear_enabled = true,
		window_overlap_clear_ft_ignore = {
			"cmp_menu",
			"cmp_docs",
			"snacks_notif",
			"scrollview",
			"scrollview_sign",
		},
		editor_only_render_when_focused = false,
		tmux_show_only_in_active_window = false,
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
	},
	config = function(_, opts)
		local image = require("image")
		image.setup(opts)
	end,
}
