local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = { "lua", "python", "rust", "markdown", "vim", "vimdoc", "c", "c++" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
