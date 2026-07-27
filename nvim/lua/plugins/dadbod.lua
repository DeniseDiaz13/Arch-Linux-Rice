return {
  { "tpope/vim-dadbod", lazy = true },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { { "tpope/vim-dadbod", lazy = true } },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_show_help = 0
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_win_width = 25
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = "./.db_queries"

      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.sql",
        callback = function()
          vim.cmd("silent! DBUIForceRefresh")
        end,
      })
    end,
  },

  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = { "tpope/vim-dadbod", lazy = true },
    ft = { "sql", "mysql", "plsql" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          if pcall(require, "cmp") then
            require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
          end
        end,
      })
    end,
  },
}
