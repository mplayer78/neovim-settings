require("dap-go").setup()

local function dapContinue()
    require'dap'.continue()
end
local function dapStepOver()
    require'dap'.step_over()
end
local function dapStepInto()
    require'dap'.step_into()
end
local function dapStepOut()
    require'dap'.step_out()
end
local function dapToggleBreakpoint()
    require'dap'.toggle_breakpoint()
end
local function dapSetBreakpointCondition()
    require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end
local function dapSetBreakpointMessage()
    require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end
local function dapOpenRepl()
    require'dap'.repl.open()
end

local function dapGoDebugTest()
    require('dap-go').debug_test()
end
local function dapGoDebugLastTest()
    require('dap-go').debug_last_test()
end

vim.keymap.set("n", "<F5>", dapContinue)
vim.keymap.set("n", "<F10>", dapStepOver)
vim.keymap.set("n", "<F11>", dapStepInto)
vim.keymap.set("n", "<F12>", dapStepOut)
vim.keymap.set("n", "<leader>b", dapToggleBreakpoint)
vim.keymap.set("n", "<leader>B", dapSetBreakpointCondition)
vim.keymap.set("n", "<leader>lp", dapSetBreakpointMessage)
vim.keymap.set("n", "<leader>dr", dapOpenRepl)

vim.keymap.set("n", "<leader>dt", dapGoDebugTest)
vim.keymap.set("n", "<leader>dlt", dapGoDebugLastTest)

require('dapui').setup()

local function dapUIOpen()
  require("dapui").open()
end

vim.keymap.set("n", "<leader>do", dapUIOpen)
