local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local fb_actions = require("telescope._extensions.file_browser.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			grouped = true,
			depth = false,
			-- disables netrw and use telescope-file-browser in its place
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
					["<C-c>"] = fb_actions.create,
					["<C-CR>"] = fb_actions.create_from_prompt,
					["<C-r>"] = fb_actions.rename,
					["<C-m>"] = fb_actions.move,
					["<C-y>"] = fb_actions.copy,
					["<C-d>"] = fb_actions.remove,
					["<C-o>"] = fb_actions.open,
					["<C-g>"] = fb_actions.goto_parent_dir,
					["<C-e>"] = fb_actions.goto_home_dir,
					["<C-w>"] = fb_actions.goto_cwd,
					["<C-t>"] = fb_actions.change_cwd,
					["<C-f>"] = fb_actions.toggle_browser,
					["<C-h>"] = fb_actions.toggle_hidden,
					["<C-s>"] = fb_actions.toggle_all,
					["<bs>"] = fb_actions.backspace,
				},
				["n"] = {
					-- your custom normal mode mappings
					["c"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["y"] = fb_actions.copy,
					["d"] = fb_actions.remove,
					["o"] = fb_actions.open,
					["g"] = fb_actions.goto_parent_dir,
					["e"] = fb_actions.goto_home_dir,
					["w"] = fb_actions.goto_cwd,
					["t"] = fb_actions.change_cwd,
					["f"] = fb_actions.toggle_browser,
					["h"] = fb_actions.toggle_hidden,
					["s"] = fb_actions.toggle_all,
				},
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
