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
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local mason_lsp = require("mason-lspconfig")

      mason_lsp.setup()

      -- Get installed servers
      local servers = mason_lsp.get_installed_servers()

      for _, server in ipairs(servers) do
        if server == "pylsp" then
          vim.lsp.config("pylsp", {
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

          vim.lsp.enable("pylsp")
        else
          vim.lsp.config(server, {
            capabilities = capabilities,
          })

          vim.lsp.enable(server)
        end
      end

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Documentation" })
      vim.keymap.set("n", "<F2>", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<F3>", vim.lsp.buf.references, { desc = "Show References" })
      vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code Actions" })
    end,
  },
}
