-- local status, _ = pcall(vim.cmd, "colorscheme ")
--   not status then
--   print("Colorscheme not found!")
-- return
-- end

local status, onedark = pcall(require, "onedark")
if not status then
	print("Colorscheme not found")
end
onedark.setup({
	style = "deep",
	transparent = true,
})
onedark.load()
