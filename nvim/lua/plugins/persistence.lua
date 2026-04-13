return {
  "folke/persistence.nvim",
  config = function()
    local persistence = require("persistence")

    persistence.setup({
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
      options = { "buffers", "curdir", "winsize" },
    })

    vim.keymap.set("n", "<leader>kb", function()
      persistence.load({ last = true })
    end)
  end,
}
