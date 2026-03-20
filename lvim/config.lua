vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.cmd [[colorscheme tokyonight]]

lvim.plugins = require("user.plugins")
require("user.mappings")

local orig = vim.lsp.util.make_position_params
vim.lsp.util.make_position_params = function(win, encoding)
  return orig(win, encoding or "utf-16")
end
