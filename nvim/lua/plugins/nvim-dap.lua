return {
  {
    "mfussenegger/nvim-dap",
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed = { "python" },
        automatic_installation = true,
      })

      dap.listeners.after.event_initialized["dapui"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local python = vim.fn.getcwd() .. "/.venv/bin/python"

      if vim.fn.filereadable(python) == 1 then
        require("dap-python").setup(python)
      else
        require("dap-python").setup("python3")
      end
    end,
  }
}
