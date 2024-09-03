return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- Lua
                    "lua_ls",
                    -- Python
                    "basedpyright",
                    "ruff_lsp",
                    -- Rust
                    "rust_analyzer",
                },
                automatic_installation = true
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.basedpyright.setup({
                capabilities = capabilities
            })
            lspconfig.ruff_lsp.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "gi", vim.lsp.buf.hover, {
                desc = "Get info about the currently hovered symbol"
            })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
                desc = "Go to the definition of the currently hovered symbol"
            })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
                desc = "Show available code actions for the current cursor position"
            })
        end,
    },
}
