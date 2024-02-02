vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Allows moving selected blocks in visual mode up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When joining the line below with J, cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the center when jumping with CTRL+d/u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Leader P deletes a highligted word without yanking it.
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("x", "<leader>x", "\"_d")

-- Leader y yanks into system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>y", "\"+y")


vim.keymap.set("n", "Q", "<nop>")

-- Start replacing word you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

