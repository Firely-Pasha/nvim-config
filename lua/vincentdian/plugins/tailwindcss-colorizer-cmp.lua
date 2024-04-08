return {
	"roobert/tailwindcss-colorizer-cmp.nvim",
	config = function()
		local colorizer = require("tailwindcss-colorizer-cmp")
		colorizer.setup({
			color_square_width = 2,
		})
	end,
}
