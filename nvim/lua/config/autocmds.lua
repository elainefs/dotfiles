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
