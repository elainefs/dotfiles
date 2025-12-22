return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<C-j>]],
      shade_terminals = true,
      shading_factor = 2,
      direction = "horizontal",
      float_opts = {
        border = "curved",
      },
    })

    -- To use terminal side-by-side in horizontal direction: 2<leader>th
    -- vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
    -- To use terminal side-by-side in vertical direction: 2<leader>tv
    vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
    -- To use terminal in floating mode
    vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })

  end,
}
