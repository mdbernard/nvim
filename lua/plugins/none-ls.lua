return {
	"nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
                null_ls.builtins.formatting.stylua,
                -- Python
                null_ls.builtins.diagnostics.mypy,
			    null_ls.builtins.formatting.isort,
                require("none-ls.diagnostics.ruff"),
                require("none-ls.formatting.ruff"),
            },
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
