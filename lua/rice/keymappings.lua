-- Save/session keys
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":BufferClose<CR>")
vim.keymap.set("n", "<leader>x", ":quitall!<CR>")
-- Tab keys
vim.keymap.set("n", "<leader>d", ":BufferPrevious<CR>")
vim.keymap.set("n", "<leader>f", ":BufferNext<CR>")
-- Window split keys
vim.keymap.set("n", "<leader>e", ":vsplit<CR>")
vim.keymap.set("n", "<leader>r", "<C-w>")
-- NvimTree keys
vim.keymap.set("n", "<leader>a", ":NvimTreeToggle<cr>")
-- Terminal keys
vim.keymap.set("n", "<leader>t", ":tabnew<cr>:term<cr><insert>")
