require("config.lazy")
require("config.editorconfig")
require("config.keymaps")

vim.opt.mouse = ""

vim.diagnostic.config({
  virtual_text = true, -- shows inline text (optional)
  -- signs = true,        -- shows signs in the gutter
  -- underline = true,    -- underlines the problem text
  -- update_in_insert = false,
  -- severity_sort = true,
  --[[
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  ]]
})

-- using treesitter to color function calls yellow
-- it is currently being overwritten by the lsp :(
-- vim.cmd [[hi @function.builtin.lua guifg=yellow]]
local x = 5
print(x)

vim.lsp.config('ocamllsp', {
  root_dir = require("lspconfig.util").root_pattern(
    "dune-project",
    "dune",
    ".opam",
    "*.opam",
    ".git"
  ),
})

vim.lsp.config('ruff', {
  init_options = {
    settings = {
      -- Ruff language server settings go here
      lineLength = 100,
    }
  }
})

-- vim.lsp.enable('ruff')

--[[
vim.lsp.config('pyright', {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
})
]]

-- soft-wrap text (only visually) at the edge of the window
-- todo: help wrap
-- help linebreak
vim.g.coqtail_coq_path = '/home/adziw/.opam/5.4.0/bin'
vim.g.coqtail_coq_prog = 'rocq'

vim.api.nvim_command("set rtp^=\"/home/adziw/.opam/5.2.0+ox/share/ocp-indent/vim\"")
