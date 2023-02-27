require('nvim_comment').setup({comment_empty = false})

vim.keymap.set({"n", "v"}, "<C-/>", vim.cmd.CommentToggle)
