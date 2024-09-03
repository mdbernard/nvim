return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- general setup
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Python debugging
        -- must `pip install debugpy` in the active virtual environment
        local dap_python = require("dap-python")
        dap_python.setup("python")
        dap_python.test_runner = "pytest"
	end,
}
