return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			"nvim-tree/nvim-web-devicons",
			lazy = false,
		},
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			enable_git_status = true,
			enable_diagnostics = true,
			default_component_configs = {
				git_status = {
					symbols = {
						added = "✚", -- o ""
						modified = "", -- o ""
						deleted = "✖", -- o ""
						renamed = "➜",
						untracked = "★",
						ignored = "◌",
						unstaged = "U",
						staged = "✓",
						conflict = "",
					},
				},
			},
		})
		vim.keymap.set("n", "<C-e>", ":Neotree toggle left<CR>", {})
    vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree focus<CR>', { noremap = true, silent = true })
	end,
}
