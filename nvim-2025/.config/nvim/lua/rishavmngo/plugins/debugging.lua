return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapVirtualText = require("nvim-dap-virtual-text")
		local dapui = require("dapui")

		dapVirtualText.setup()
		dapui.setup()

		dap.configurations.java = {
			{
				type = "java",
				request = "launch",
				name = "Launch Java Program",
				mainClass = "",
				projectName = "",
			},
		}
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		vim.fn.sign_define(
			"DapStopped",
			{ text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStopped" }
		)

		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#FFD700", bg = "", bold = false }) -- Symbol color
		vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#856600", blend = 30 }) -- Dark yellow for line

		-- Automatically open/close the UI on debug events
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Optional keybindings for DAP-UI actions
		vim.keymap.set("n", "<Leader>du", dapui.toggle, {}) -- Toggle DAP-UI
		vim.keymap.set("n", "<Leader>d?", function()
			require("dapui").eval(nil, { enter = true })
		end)
		vim.keymap.set("n", "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end, { desc = "Hover to see variable value" })
	end,
}
