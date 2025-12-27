vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>x", ":quitall!<CR>")
vim.keymap.set("n", "<leader>s", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>d", ":tabnext<CR>")
vim.keymap.set("n", "<leader>e", ":vsplit<CR>")
vim.keymap.set("n", "<leader>r", "<C-w>")
vim.keymap.set("n", "<leader>a", ":NvimTreeToggle<CR>")
