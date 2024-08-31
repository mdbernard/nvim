return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "python", "rust", "markdown", "vim", "vimdoc", "c" },
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
