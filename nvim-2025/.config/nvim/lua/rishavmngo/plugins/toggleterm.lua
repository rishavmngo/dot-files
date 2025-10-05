return {
	"akinsho/toggleterm.nvim",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 20,
			direction = "float",
			open_mapping = [[<c-]>]],
		})
	end,
}
