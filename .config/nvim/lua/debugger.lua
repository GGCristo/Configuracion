-- nvim-dap
local dap = require "dap"
dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = {nil, stdout},
    args = {"dap", "-l", "127.0.0.1:" .. port},
    detached = true
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print('dlv exited with code', code)
    end
  end)
  assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
	require('dap.repl').append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(
  function()
    callback({type = "server", host = "127.0.0.1", port = port})
  end,
  100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  } 
}
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})
-- map('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>')
-- map('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- map('n', '<c-k>', ':lua require"dap".step_out()<CR>')
-- map('n', '<c-l>', ':lua require"dap".step_into()<CR>')
-- map('n', '<c-j>', ':lua require"dap".step_over()<CR>')
-- map('n', '<c-h>', ':lua require"dap".continue()<CR>')
-- map('n', '<leader>dk', ':lua require"dap".up()<CR>')
-- map('n', '<leader>dj', ':lua require"dap".down()<CR>')
-- map('n', '<leader>dc', ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
-- map('n', '<leader>dr', ':lua require"dap".repl.open({}, "vsplit")<CR><C-w>l')
-- map('n', '<leader>di', ':lua require"dap.ui.variables".hover()<CR>')
-- map('n', '<leader>di', ':lua require"dap.ui.variables".visual_hover()<CR>')
-- map('n', '<leader>d?', ':lua require"dap.ui.variables".scopes()<CR>')
-- map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
-- map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
-- map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
-- map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
-- map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- nnoremap <silent><leader>bk :lua require"dap".toggle_breakpoint()<CR> TODO
-- nnoremap <silent><F5> :lua require"dap".continue()<CR>
vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".continue()<cr>', { silent = true})

-- nvim-dap-virtual-text
-- let g:dap_virtual_text = v:true
vim.g.dap_virtual_text = true

-- nvim-dap-ui
require("dapui").setup()
