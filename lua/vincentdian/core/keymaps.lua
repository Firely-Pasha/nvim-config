vim.g.mapleader = " "

local telescope_builtin_setup, telescope_builtin = pcall(require, "telescope.builtin")
if not telescope_builtin_setup then
	return
end

local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- move lines
keymap.set("n", "<leader>mn", "<cmd>m+<CR>")
keymap.set("n", "<leader>mp", "<cmd>m+")

-- window management
keymap.set("n", "<leader>s=", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>s-", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFileToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

keymap.set("n", "<leader>?", telescope_builtin.oldfiles, { desc = "[?] Find recently opened files" })
keymap.set("n", "<leader><space>", telescope_builtin.buffers, { desc = "[ ] Find existing buffers" })
keymap.set("n", "<leader>/", function()
	telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		windblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
