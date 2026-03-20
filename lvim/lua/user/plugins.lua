return {
  { "folke/tokyonight.nvim" },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {
        keywords = {
          TODO    = { icon = "", color = "info" },
          FIX     = { icon = "", color = "error" },
          NOTE    = { icon = "", color = "hint" },
          WARNING = { icon = "", color = "warning" },
        },
      }
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { enabled = false },
      exclude = { filetypes = { "javascript", "typescript", "tsx" } },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua", "vim", "bash", "python",
          "html", "css", "json", "markdown"
        },
        highlight = { enable = true },
        indent = { enable = false },
      }
    end,
  },

  { "HiPhish/rainbow-delimiters.nvim" },

  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup {
        formatters_by_ft = {
          lua        = { "stylua" },
          python     = { "black" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          html       = { "prettier" },
          css        = { "prettier" },
          json       = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 3000,
          lsp_fallback = true,
        },
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      capabilities.offsetEncoding = { "utf-16" }
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local function setup(server, opts)
        opts = opts or {}
        opts.capabilities = capabilities
        lspconfig[server].setup(opts)
      end

      setup("lua_ls")
      setup("tsserver")
      setup("pyright")

      setup("html", {
        on_init = function(client)
          client.offset_encoding = "utf-16"
        end,
      })

      setup("volar", {
        filetypes = { "vue" },
      })
    end,
  },

  { "mattn/emmet-vim" },
}
