local dap = require('dap')
local dapui = require('dapui')

dap.adapters.gdb = {
  id = 'gdb',
  type = 'executable',
  command = 'gdb',
  args = { '--quiet', '--interpreter=dap' },
}

dap.configurations.cpp = {
  {
    name = 'Run executable (GDB)',
    type = 'gdb',
    request = 'launch',
    -- This requires special handling of 'run_last', see
    -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
    program = function()
      local path = vim.fn.input({
        prompt = 'Path to executable: ',
        default = vim.fn.getcwd() .. '/',
        completion = 'file',
      })

      return (path and path ~= '') and path or dap.ABORT
    end,
  },
  {
    name = 'Run executable with arguments (GDB)',
    type = 'gdb',
    request = 'launch',
    -- This requires special handling of 'run_last', see
    -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
    program = function()
      local path = vim.fn.input({
        prompt = 'Path to executable: ',
        default = vim.fn.getcwd() .. '/',
        completion = 'file',
      })

      return (path and path ~= '') and path or dap.ABORT
    end,
    args = function()
      local args_str = vim.fn.input({
        prompt = 'Arguments: ',
      })
      return vim.split(args_str, ' +')
    end,
  },
  {
    name = 'Attach to process (GDB)',
    type = 'gdb',
    request = 'attach',
    processId = require('dap.utils').pick_process,
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
