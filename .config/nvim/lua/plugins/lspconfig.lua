return {
  {
    "neovim/nvim-lspconfig",
    depenencies = {
      "folke/lazydev.nvim",
      'saghen/blink.cmp'
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      vim.lsp.config("lua_ls", { capabilities = capabilities })

    end,
  }
}
