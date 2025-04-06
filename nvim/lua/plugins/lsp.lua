return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "html", "pylsp", "cssls", "ts_ls", "phpactor" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          if server_name == "pylsp" then
            lspconfig.pylsp.setup({
              capabilities = capabilities,
              settings = {
                pylsp = {
                  plugins = {
                    pycodestyle = { enabled = false },
                    pyflakes = { enabled = false },
                    pylint = { enabled = false },
                    black = { enabled = false },
                    autopep8 = { enabled = false },
                    yapf = { enabled = false },
                    mccabe = { enabled = false },
                    pylsp_mypy = { enabled = false },
                    pylsp_isort = { enabled = false },
                    pylsp_black = { enabled = false },
                  },
                },
              },
            })
          else
            -- Automatically configure each installed server
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Documentation" })
      vim.keymap.set("n", "<F2>", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<F3>", vim.lsp.buf.references, { desc = "Show References" })
      vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code Actions" })
    end,
  },
}
