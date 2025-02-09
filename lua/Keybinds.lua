-- NvimTree

vim.keymap.set('n', '<Leader>n', '<cmd>NvimTreeFocus<cr>')

-- Barbar

vim.keymap.set('n', '<C-w>', '<Cmd>BufferClose<CR>')
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferNext<CR>')

-- Telescope

vim.keymap.set('n', '<Leader>f', '<Cmd>Telescope find_files<CR>')

-- Terminal

vim.keymap.set('n', '<Leader>t', '<Cmd>ToggleTerm size=30<CR>')

-- SearchBox

vim.keymap.set('n', '<C-f>', '<Cmd>SearchBoxIncSearch<CR>')

-- Code actions

vim.keymap.set('n', '<C-p>', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
