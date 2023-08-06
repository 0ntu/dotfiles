require('dap').adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = "/home/ontu/.local/share/nvim/mason/bin/OpenDebugAD7"
}

require('dap').configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
    externalConsole = true,
  },
}

require('dap').defaults.fallback.external_terminal = {
  command = '/usr/bin/kitty',
}

require("dapui").setup()
