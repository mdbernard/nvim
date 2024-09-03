return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			-- do not insert closing pair if already detected on the same line
			enable_check_line_bracket_next = false,

			-- do not insert closing pair if next character is text
			ignored_next_char = "[%w%.]",

			disable_filetype = { "TelescopePrompt" },
		})
	end,
}
