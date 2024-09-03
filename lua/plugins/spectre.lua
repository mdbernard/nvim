return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("spectre")

		vim.keymap.set("n", "<leader>ts", '<cmd>lua require("spectre").toggle()<CR>', {
			desc = "Toggle search tool (Spectre)",
		})
		vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
			desc = "Search for the currently selected word (normal mode)",
		})
		vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
			desc = "Search for the currently selected word (visual mode)",
		})
		vim.keymap.set("n", "<leader>sf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
			desc = "Search for the currently selected word in the current file",
		})
	end,
}
