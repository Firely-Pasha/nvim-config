return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fu", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		local fb_actions = telescope.extensions.file_browser.actions
		vim.keymap.set("n", "<leader>fB", ":Telescope file_browser<CR>")
		vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
		telescope.setup({
			extensions = {
				file_browser = {
					theme = "ivy",
					mappings = {
						["i"] = {
							["<C-a>"] = fb_actions.create,
							["<C-D>"] = fb_actions.remove,
							-- your custom insert mode mappings
						},
						["n"] = {
							-- your custom normal mode mappings
						},
					},
				},
			},
		})
		telescope.load_extension("file_browser")
	end,
}
