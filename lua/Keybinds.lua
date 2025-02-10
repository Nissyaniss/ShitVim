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

-- Copy and paste in Neovide

vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true }) -- Select line(s) in visual mode and copy (CTRL+Shift+V)
vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>"+p', { noremap = true }) -- Paste in insert mode (CTRL+Shift+C)
vim.api.nvim_set_keymap("n", "<sc-v>", '"+p', { noremap = true }) -- Paste in normal mode (CTRL+Shift+C)
