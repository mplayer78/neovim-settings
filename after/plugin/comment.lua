require('nvim_comment').setup({comment_empty = false})

vim.keymap.set("n", "<C-/>", vim.cmd.CommentToggle)
