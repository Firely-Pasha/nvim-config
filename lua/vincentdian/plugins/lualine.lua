local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local theme = require("lualine.themes.onedark")

lualine.setup({
	options = {
		theme = "onedark",
	},
})
