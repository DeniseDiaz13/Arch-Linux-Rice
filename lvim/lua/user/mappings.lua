-- SAVE FILE
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"

-- FILE EXPLORER
lvim.keys.normal_mode["<leader>e"] = ":NvimTreeToggle<CR>"

-- PERSISTENCE SESSION
lvim.keys.normal_mode["<leader>ssl"] = function()
  require("persistence").load({ last = true })
end

lvim.keys.normal_mode["<leader>ssr"] = function()
  require("persistence").load()
end

-- CHANGE TABS
lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"

-- EMMET
vim.g.user_emmet_expandabbr_key = "<C-e>"
