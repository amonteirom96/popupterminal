local M = {}

function M.setup()
  vim.api.nvim_create_user_command('WTerminal', function()
    local buf = vim.api.nvim_create_buf(false, true)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

    local opts = {
      style = 'minimal',
      relative = 'editor',
      width = width,
      height = height,
      row = math.floor((vim.o.lines - height) / 2),
      col = math.floor((vim.o.columns - width) / 2),
      border = 'rounded',
    }

    vim.api.nvim_open_win(buf, true, opts)

    vim.fn.termopen(vim.o.shell)
    vim.cmd('startinsert')
  end, {})
end

return M
