return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	enabled = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local setup, nvimtree = pcall(require, "nvim-tree")
		nvimtree.setup({
			-- change folder arrow icons
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		})

		local opts = { noremap = true, silent = true }
		-- set keybinds
		vim.keymap.set("n", "<leader>ee", "<cmd>:NvimTreeFindFile<CR>", opts) -- show definition, references
		vim.keymap.set("n", "<leader>ec", "<cmd>:NvimTreeClose<CR>", opts) -- show definition, references
	end,
}
