vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.o.showtabline = 2

local augroup = vim.api.nvim_create_augroup("TreesitterStart", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function(args)
    local ft = args.match

    local ignore = {
      ["neo-tree"] = true,
      ["lazy"] = true,
      ["mason"] = true,
      ["help"] = true,
      ["alpha"] = true,
    }

    if not ignore[ft] then
      pcall(vim.treesitter.start)
    end
  end,
})
