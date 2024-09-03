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
        end,
    },
    { "Bilal2453/luvit-meta", lazy = true },
    {
        "felpafel/inlay-hint.nvim",
        event = "LspAttach",
        config = function()
            require("inlay-hint").setup({
                virt_text_pos = "inline",
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf ---@type number
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client.supports_method("textDocument/inlayHint") then
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                        vim.keymap.set("n", "<leader>ih", function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                                { bufnr = bufnr }
                            )
                        end, { buffer = bufnr, desc = "Toggle inlay hints" })
                    end
                end,
            })
        end,
    },
}
