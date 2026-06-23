vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>")

vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>ff", function ()
  vim.lsp.buf.format()
end, { desc = "Format file via LSP"})

--vim.lsp.completion.enable(true, , 0)
vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)

vim.keymap.set("n", "<leader><leader>c", ":!make<CR>")

-- keymaps for line wrapping
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
