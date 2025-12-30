vim.g.mapleader = " "

-- Save/session keys
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>x", ":quitall!<CR>")
-- Tab keys
vim.keymap.set("n", "<leader>d", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>f", ":tabnext<CR>")
-- Window split keys
vim.keymap.set("n", "<leader>e", ":vsplit<CR>")
vim.keymap.set("n", "<leader>r", "<C-w>")
-- NvimTree keys
vim.keymap.set("n", "<leader>a", ":NvimTreeToggle<cr>")
-- Terminal keys
vim.keymap.set("n", "<leader>t", ":tabnew<cr>:term<cr><insert>")
