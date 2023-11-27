local plugins = {
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
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
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
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      require "custom.configs.nvim-dap"
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.todo-comments"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require "custom.configs.symbols-outline"
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require "custom.configs.ui-select"
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
    config = function()
      require "custom.configs.telescope-dap"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap" },
    config = function()
      require "custom.configs.dap-virtual-text"
    end,
  },
  {
    "NvChad/nvterm",
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
      return require "custom.configs.nvimtree"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return require "custom.configs.telescope"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      require "plugins.configs.cmp"
      require "custom.configs.cmp"
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = { "ThePrimeagen/git-worktree.nvim" },
    config = function()
      require "custom.configs.git-worktree"
    end,
  },
  {
    'Slotos/telescope-lsp-handlers.nvim',
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = false,
    config = function()
      require "custom.configs.telescope-lsp-handlers"
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
      require "custom.configs.nvim-lightbulb"
    end,
  },
  {
    "j-hui/fidget.nvim",
    lazy = false,
    config = function()
      require "custom.configs.fidget"
    end,
  },
  {
    'tomasky/bookmarks.nvim',
    event = "VimEnter",
    config = function()
        require "custom.configs.bookmarks"
    end,
  },
  {
    'Bekaboo/dropbar.nvim',
    lazy = false,
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  }
 --  {
 --    "SmiteshP/nvim-navic",
 --    lazy = false,
 --    config = function()
 --      require "custom.configs.nvim-navic"
 --    end,
 -- },
}

return plugins
