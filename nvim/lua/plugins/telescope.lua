return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-live-grep-args.nvim",
		},

		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({})

			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args")

			-- Keymaps
			vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end, { desc = "Telescope live grep with args" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
