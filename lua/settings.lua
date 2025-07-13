vim.o.wrap = false
vim.o.cursorline = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- vim.o.autoread = true
-- vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
--   pattern = { '*' },
--   command = "if mode() != 'c' | checktime | endif",
-- })
-- vim.api.nvim_create_autocmd({ 'FileChangedShellPost' }, {
--   pattern = { '*' },
--   command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None',
-- })
