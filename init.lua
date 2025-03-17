require("configs.lazy-config")
--vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = "\\"
vim.g.maplocalleader = ","

local lazy_config = require("configs.lazy")

---- load plugins
require("lazy").setup({
  { import = "plugins" },
}, lazy_config)

---- load theme
--dofile(vim.g.base46_cache .. "defaults")
--dofile(vim.g.base46_cache .. "statusline")

--require "nvchad.autocmds"

--vim.schedule(function()
  --require "mappings"
--end)

-- Set up 'mini.deps' (customize to your liking)
-- require('mini.deps').setup({ path = { package = path_package } })

vim.schedule(function()
  require("mini.icons").setup()
  require('nvim-treesitter.configs').setup({
    highlight = {
      enable = true,
      disable = { "ruby" }
    }
  })

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  })


  require('options')
  require('mappings')
  require('test-vim')
  --require('vue')
  --require('autocompletion')
  require('telescope-config')
  --require('lsp-config')
  require('run-current')
end)
