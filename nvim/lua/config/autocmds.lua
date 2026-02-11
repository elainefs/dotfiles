-- Disable Spell Check in Terminals
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Disable Spell Check in LSP References
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lspinfo,qf",
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Show vertical line on specific file types 
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "79"
    vim.cmd([[highlight ColorColumn guibg=#2f2f2f]])
  end,
})

-- Enable ESC to back normal mode in terminal mode
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Show Diagnostic Under the Cursor
vim.diagnostic.config({
  float = {
    focusable = false,
    close_events = {
      "BufLeave",
      "CursorMoved",
      "InsertEnter",
      "FocusLost",
    },
  },
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
    })
  end,
})
