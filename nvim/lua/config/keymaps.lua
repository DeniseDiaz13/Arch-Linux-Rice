-- Dadbod
vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<cr>", { desc = "Toggle Dadbod UI" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  callback =
      function(event)
        vim.keymap.set("v", "<leader>S", ":DB<CR>", {
          buffer = event.buf,
          silent = true,
          desc = "Execute selection SQL",
        })

        vim.keymap.set("n", "<leader>S", ":.DB<CR>", {
          buffer = event.buf,
          silent = true,
          desc = "Execute a single line SQL",
        })
      end,
})

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Neotree
vim.keymap.set("n", "<C-e>", ":Neotree toggle left<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { noremap = true, silent = true, desc = "Focus Neotree" })

-- None-ls
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })

-- Nvim dap
local dap = require("dap")
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Continue/Start" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step out" })

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })

-- Persistence
local persistence = require("persistence")
vim.keymap.set("n", "<leader>kb", function()
  persistence.load({ last = true })
end, { desc = "Restore last session" })

-- Tabs
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>", { desc = "Pick buffer to close" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Telescope find files" })

vim.keymap.set("n", "<leader>fg",
  function()
    require("telescope").extensions.live_grep_args.live_grep_args()
  end,
  { desc = "Telescope live grep with args" })

vim.keymap.set("n", "<leader>ks",
  function()
    require("telescope.builtin").find_files({
      prompt_title = "Sessions",
      cwd = vim.fn.stdpath("state") .. "/sessions/",
      attach_mappings =
          function(prompt_bufnr)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            actions.select_default:replace(function()
              local entry = action_state.get_selected_entry()

              actions.close(prompt_bufnr)

              persistence.load({
                dir = vim.fn.stdpath("state") .. "/sessions/",
                file = entry.value,
              })
            end)

            return true
          end,
    })
  end,
  { desc = "Search sessions" })
