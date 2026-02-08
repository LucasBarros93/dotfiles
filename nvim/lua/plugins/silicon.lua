return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	config = function()
		require("silicon").setup({
			theme = "Dracula",
			font = "PixelCode",
			output = string.format(
				"%s/silicon_nvim %s.png",
				vim.fn.expand("~/Pictures/screenshots"),
				os.date("%Y-%m-%d %H-%M-%S")
			),
		})
	end,
}
