return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				keywords = {
					TODO = { icon = "", color = "info" },
					FIX = { icon = "", color = "error" },
					NOTE = { icon = "", color = "hint" },
					WARNING = { icon = "", color = "warning" },
				},
			})
		end,
	},
}
