return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      lazy = false,
      suppressed_dirs = { "~/", "~/Documentos", "~/Downloads", "/" },
      bypass_save_filetypes = { "alpha", "dashboard" },
      opts = {
        session_lens = {
          load_on_setup = true,
          previewer = false,
        },
      },
    })
  end,
  vim.keymap.set("n", "<leader>s", "<cmd>Telescope session-lens search_session<CR>", { desc = "Search Sessions" }),
}
