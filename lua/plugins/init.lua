return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  { "mhartington/formatter.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "mfussenegger/nvim-lint" },
  { "prettier/vim-prettier" },
  --These are some examples, uncomment them if you want to see them work!

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint_d",
        "pylint",
        "erb-lint",
        "bash-language-server",
        "python-lsp-server",
        "rubocop",
        "ruby-lsp",
        "typescript-language-server",
        "graphql-language-service-cli",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "markdown_inline",
      },
    },
  },
  { "echasnovski/mini.nvim", version = "*" },

  -- common
  { "tpope/vim-fugitive" }, -- Git commands
  { "vim-airline/vim-airline" }, -- powerline
  { "vim-airline/vim-airline-themes" },
  { "rhysd/vim-grammarous" }, -- grammar check
  { "andymass/vim-matchup" }, -- matching parens and more
  { "bronson/vim-trailing-whitespace" }, -- highlight trailing spaces
  { "rhysd/git-messenger.vim" },
  { "marko-cerovac/material.nvim" }, -- material theme

  {
    "lewis6991/gitsigns.nvim", -- git added/removed in sidebar + inline blame
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup {
        current_line_blame = false,
      }
    end,
  },

  -- general dev
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").graphql.setup {
        cmd = { "graphql-lsp", "server", "-m", "stdio" },
        filetypes = { "typescript", "typescriptreact", "graphql" },
        settings = {
          graphql = {
            configDir = vim.fn.getcwd(),
            load = {
              legacy = true,
            },
          },
        },
      }
    end,
  },
  { "williamboman/nvim-lsp-installer" },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {
        diagnostic_only_current = true,
        use_saga_diagnostic_sign = true,
        ui = {},
      }
    end,
    after = "neovim/nvim-lspconfig",
  },
  { "onsails/lspkind.nvim" }, -- icons in autocomplete source
  { "hrsh7th/nvim-cmp" }, -- autocomplete engine (see autocomplete.lua)
  { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for cmp
  { "hrsh7th/cmp-buffer" }, -- buffer source for cmp
  { "hrsh7th/cmp-path" }, -- path source for cmp
  --{
  --'nvim-treesitter/nvim-treesitter',
  --run = function()
  --local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  --ts_update()
  --end,
  --},
  { "scrooloose/nerdcommenter" }, -- commenting shortcuts

  -- search
  { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } },
  { "tpope/vim-eunuch" }, -- wrappers UNIX commands
  { "tpope/vim-surround" }, -- surround characters shortcuts
  { "nvim-tree/nvim-web-devicons", opts = {} }, -- icons in file explorer

  { "catppuccin/nvim", as = "catppuccin" },

  -- testing
  --{'kassio/neoterm'}, -- terminal wrapper
  { "vim-test/vim-test" }, -- testing commands

  -- javascript
  { "HerringtonDarkholme/yats.vim", ft = "typescript" },
  { "posva/vim-vue" }, -- Vue highlighting
  { "othree/javascript-libraries-syntax.vim" },

  -- python
  { "Vimjas/vim-python-pep8-indent", ft = "python" },

  -- ruby
  { "tpope/vim-rails", ft = "ruby" },
  { "ecomba/vim-ruby-refactoring", ft = "ruby" },
  { "tpope/vim-haml", ft = "ruby" },

  -- elixir
  { "elixir-lang/vim-elixir", ft = "elixir" },
  { "mattreduce/vim-mix", ft = "elixir" },
  { "slashmili/alchemist.vim", ft = "elixir" },

  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  { "Pocco81/auto-save.nvim" },
  { "jparise/vim-graphql" },
  { "slarwise/vim-tmux-send" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
