local dap = require('dap')
local dapui = require('dapui')

local game = 'game.pdx'

local sdkPath = os.getenv("PLAYDATE_SDK_PATH")
local sdkBinPath = sdkPath .. "/bin"

local playdateSimulatorPath = sdkBinPath .. "/PlaydateSimulator"
local playdateSimulatorPort = 55934
local playdateSimulatorArgs = { game }

-- local pdcPath = sdkBinPath .. "/pdc"
-- local pdcArgs = { '-sdkpath', sdkPath, 'Source', game }

dap.adapters.lua = {
  type = 'server',
  port = playdateSimulatorPort,
  executable = {
    command = playdateSimulatorPath,
    args = playdateSimulatorArgs
  }
}

dap.configurations.lua = {
  {
    type = 'lua',
    request = 'launch',
    name = "Playdate",
  },
  {
    type = "lua",
    name = "Attach",
    mode = "local",
    request = "attach",
    processId = require("dap.utils").pick_process,
  },
}

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- vim.keymap.set('n', '<F5>', function() dap.continue() end)
-- vim.keymap.set('n', '<F10>', function() dap.step_over() end)
-- vim.keymap.set('n', '<F11>', function() dap.step_into() end)
-- vim.keymap.set('n', '<F12>', function() dap.step_out() end)
-- vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp',
--   function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)