return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",

        "javascript",
        "json",

        "c",
        "cpp",
        "hlsl",
        "glsl",
        "bash",
        "cmake",
        "gitignore",
        "markdown",
        "qmldir",
        "qmljs",
        "yaml",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "bash-language-server",
        "cmake-language-server",
        "clangd",
        "clang-format",
        "codelldb",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "plugins.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      -- require "configs.lspconfig"
    end,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "plugins.configs.todo-comments"
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require "plugins.configs.symbols-outline"
    end,
  },


  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    lazy = false,
    config = function()
      require "plugins.configs.ui-select"
    end,
  },

  {
    "NvChad/nvterm",
    config = function ()
      require("nvterm").setup()
    end,
    opts = {
      terminals = {
        type_opts = {
          float = {
            relative = "editor",
            row = 0.1,
            col = 0.125,
            width = 0.75,
            height = 0.75,
            border = "single",
          },
        },
      },
    },
  },


  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "plugins.configs.nvimtree"
    end,
  },


  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    opts = function()
      return require "plugins.configs.telescope"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "plugins.configs.cmp"
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = { "ThePrimeagen/git-worktree.nvim" },
    config = function()
      require "plugins.configs.git-worktree"
    end,
  },
  {
    'Slotos/telescope-lsp-handlers.nvim',
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = false,
    config = function()
      require "plugins.configs.telescope-lsp-handlers"
    end,
  },
  {
    "p00f/clangd_extensions.nvim",
    lazy = false,
  },
  {
    'kosayoda/nvim-lightbulb',
    lazy = false,
    config = function()
      require "plugins.configs.nvim-lightbulb"
    end,
  },
  {
    "j-hui/fidget.nvim",
    lazy = false,
    config = function()
      require "plugins.configs.fidget"
    end,
  },
  {
    'mrded/nvim-lsp-notify',
    requires = { 'rcarriga/nvim-notify' },
    config = function()
      require('lsp-notify').setup({
        notify = require('notify'),
      })
    end
  },

  {
    'Bekaboo/dropbar.nvim',
    lazy = false,
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  }
}
