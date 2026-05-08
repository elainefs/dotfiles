return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#000000", bold = true })
		vim.api.nvim_set_hl(0, "Comment", { fg = "#6c7086", italic = false })

		dashboard.section.header.val = {
      [[                                                    ]],
			[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
		}

		local function footer()
			local vim = vim.version()
			local version = string.format("v%d.%d.%d", vim.major, vim.minor, vim.patch)
			return version
		end

		dashboard.section.footer.val = {
			footer(),
			" ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰈞  > Search file", ":FzfLua files<CR>"),
			dashboard.button("d", "  > Open folder", "<cmd>lua OpenFolder()<CR>"),
			dashboard.button("r", "󱔗  > Recent", ":FzfLua oldfiles<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"),
			dashboard.button("q", "󰅙  > Quit NVIM", ":qa<CR>"),
		}

		dashboard.config.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
			{ type = "padding", val = 1 },
			dashboard.section.buttons,
		}

		dashboard.section.header.opts.hl = "DashboardHeader"
		dashboard.section.footer.opts.hl = "Comment"
		alpha.setup(dashboard.opts)
	end,
}
