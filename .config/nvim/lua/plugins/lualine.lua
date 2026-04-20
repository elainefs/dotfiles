return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local mode = {
      "mode",
      fmt = function(str)
        return " " .. str
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    local filename = {
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0,        -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = false,
      update_in_insert = true,
      always_visible = true,
    }

    local diff = {
      "diff",
      colored = false,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    }

    local wakatime = require("config.wakatime")

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "neo-tree" },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = {
          { "filename", path = 1 },
          { wakatime, icon = "󱑆" },
        },
        lualine_x = { "diff", "encoding", "fileformat", "filetype" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { { "location", padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    })
  end,
}
