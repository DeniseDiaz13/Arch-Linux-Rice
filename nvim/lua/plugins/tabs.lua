return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})
		vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
		vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
		vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>")
	end,
}
