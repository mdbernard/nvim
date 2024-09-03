return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local ufo = require("ufo")
		vim.keymap.set("n", "zR", ufo.openAllFolds, {
			desc = "Open all folds in the current buffer",
		})
		vim.keymap.set("n", "zM", ufo.closeAllFolds, {
			desc = "Close all folds in the current buffer",
		})
	end,
}
