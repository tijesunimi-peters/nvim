-- local path_package = vim.fn.stdpath('data') .. '/site'
-- local mini_path = path_package .. '/pack/deps/start/mini.nvim'
-- if not vim.loop.fs_stat(mini_path) then
--   vim.cmd('echo "Installing `mini.nvim`" | redraw')
--   local clone_cmd = {
--     'git', 'clone', '--filter=blob:none',
--     -- Uncomment next line to use 'stable' branch
--     -- '--branch', 'stable',
--     'https://github.com/echasnovski/mini.nvim', mini_path
--   }
--   vim.fn.system(clone_cmd)
--   vim.cmd('packadd mini.nvim | helptags ALL')
-- end

--vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
--vim.g.mapleader = " "

-- bootstrap lazy and all plugins
--local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

--if not vim.loop.fs_stat(lazypath) then
  --local repo = "https://github.com/folke/lazy.nvim.git"
  --vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
--end

--vim.opt.rtp:prepend(lazypath)

--local lazy_config = require "configs.lazy"

---- load plugins
--require("lazy").setup({
  --{
    --"NvChad/NvChad",
    --lazy = false,
    --branch = "v2.5",
    --import = "nvchad.plugins",
    --config = function()
      --require "options"
    --end,
  --},

  --{ import = "plugins" },
--}, lazy_config)

---- load theme
--dofile(vim.g.base46_cache .. "defaults")
--dofile(vim.g.base46_cache .. "statusline")

--require "nvchad.autocmds"

--vim.schedule(function()
  --require "mappings"
--end)

-- Set up 'mini.deps' (customize to your liking)
-- require('mini.deps').setup({ path = { package = path_package } })

require('plugins')

require('options')
require('mappings')
require('test-vim')
--require('vue')
--require('autocompletion')
require('telescope-config')
require('lsp-config')
require('run-current')

