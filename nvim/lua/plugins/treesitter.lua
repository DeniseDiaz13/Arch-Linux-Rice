return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "lua", "vim", "bash", "python",
        "html", "css", "json", "markdown"
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
