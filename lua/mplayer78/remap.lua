vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- go to Explorer

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move hilighted lines up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- takes the line below and appends it to the current line with a space
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Ctrl D & U keep cursor in one place
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv") -- search term stays in the middle of the screen
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste over selected text (don't clear buffer)

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]]) -- yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["*Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- delete without clearing clipboard
vim.keymap.set({ "n", "v" }, "<leader>dd", [["_dd]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- quickfix navigation
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- do a search and replace prefilling the search with the word under the cursor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- tab navigation
vim.keymap.set("n", "<leader>h", "tabN")

-- close all other buffers
vim.keymap.set({"n", "v", "i"}, "<C-o>", "<cmd>only<CR>")
