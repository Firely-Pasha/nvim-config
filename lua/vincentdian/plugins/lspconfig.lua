local keymap = vim.keymap
local lsp = vim.lsp.buf
local diagnostic = vim.diagnostic

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
	keymap.set("n", "<leader>gD", lsp.declaration, opts) -- got to declaration
	keymap.set("n", "<leader>gd", lsp.definition, opts) -- see definition and make edits in window
	keymap.set("n", "<leader>gi", lsp.implementation, opts) -- go to implementation
	keymap.set("n", "<leader>gr", lsp.references, opts) -- go to implementation
	keymap.set("n", "<leader>ca", lsp.code_action, opts) -- see available code actions
	keymap.set("n", "<leader>lr", lsp.rename, opts) -- smart rename
	keymap.set("n", "<leader>e", diagnostic.open_float, opts) -- show diagnostics for cursor
	keymap.set("n", "[d", diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
	keymap.set("n", "<leader>q", diagnostic.setloclist, opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>lk", lsp.hover, opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>T", lsp.type_definition, opts) -- show documentation for what is under cursor
	-- keymap.set("n", "<leader>f", lsp.formatting, opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>wa", lsp.add_workspace_folder, opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>sr", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>si", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>su", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls", "serve" },
			filetypes = { "go", "go.mod" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
						shadow = true,
					},
					staticcheck = true,
				},
			},
		})
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
		lspconfig.tailwindcss.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
		lspconfig.svelte.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
}
