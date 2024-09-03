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
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"kevinhwang91/nvim-ufo",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Set up folding capabilities
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			-- Set up language-specific servers
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.basedpyright.setup({
				capabilities = capabilities,
			})
			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			require("ufo").setup()

			-- Visual diagnostic settings
			vim.diagnostic.config({
				virtual_text = false, -- don't show diagnostics inline
				float = { source = true },
			})

			-- show diagnostics in popup window when hovering
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					local opts = {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
						border = "rounded",
						source = "always",
						prefix = " ",
						scope = "cursor",
					}
					vim.diagnostic.open_float(nil, opts)
				end,
			})

			-- Create keymaps
			vim.keymap.set("n", "gi", vim.lsp.buf.hover, {
				desc = "Get info about the currently hovered symbol",
			})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
				desc = "Go to the definition of the currently hovered symbol",
			})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
				desc = "Show available code actions for the current cursor position",
			})
		end,
	},
}
