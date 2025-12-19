-- since this is just an example spec, don't actually load anything here and return an empty spec
--if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "vertical",
        --layout_strategy = "horizontal",
        layout_config = {
          vertical = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
            mirror = true,
          },
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        cache_picker = {
          num_pickers = -1,
          ignore_empty_prompt = false,
        },
      },
      extensions_list = { "themes", "terms", "fzf" },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "c",
        "cpp",
        "hlsl",
        "glsl",
        "gitignore",
        "cmake",
        "make",
      })
    end,
  },

  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "lua-language-server",
        "bash-language-server",
        "cmake-language-server",
        "cmakelang",
        "clangd",
        "clang-format",
        "codelldb",
        "sonarlint-language-server",
      },
    },
  },

  {
    "stevearc/overseer.nvim",
    opts = {},
  },
  {
    "lucaSartore/nvim-dap-exception-breakpoints",
    dependencies = { "mfussenegger/nvim-dap" },

    config = function()
      local set_exception_breakpoints = require("nvim-dap-exception-breakpoints")

      vim.api.nvim_set_keymap(
        "n",
        "<leader>dc",
        "",
        { desc = "[D]ebug [C]ondition breakpoints", callback = set_exception_breakpoints }
      )
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Shatur/neovim-tasks",
      "rosstang/neotest-catch2",
    },
    config = function()
      require("neotest").setup({

        adapters = {
          require("neotest-catch2")(),
        },
      })
    end,
  },
  {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    lazy = false,
    opts = {
      mappings = {
        term = function(buf)
          vim.keymap.set(
            "t",
            "<C-a>",
            "<C-\\><C-n><CMD>FloatermToggle<CR>",
            { buffer = buf, desc = "Toggle floating terminal" }
          )
          vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], { buffer = buf, desc = "Exit terminal mode" })
          vim.keymap.set(
            "t",
            "<esc>",
            "<C-\\><C-n><CMD>FloatermToggle<CR>",
            { buffer = buf, desc = "Exit terminal mode" }
          )
        end,
      },
    },
    cmd = "FloatermToggle",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
  },
}
