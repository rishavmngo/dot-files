return {
	"ptzz/lf.vim",
	config = function()
		vim.keymap.set("n", "<leader>ff", ":FloatermNew lf " .. vim.fn.expand("%:p") .. "<CR>")
	end,
}
