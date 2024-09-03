return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load for Lua files
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
        config = function()
            require("lazydev").setup()
        end
	},
	{ "Bilal2453/luvit-meta", lazy = true },
}
