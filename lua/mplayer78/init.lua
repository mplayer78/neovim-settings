vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        local data = {
            match = vim.fn.expand("<amatch>")
        }
        vim.schedule(function()
            print("attached to markdown buffer")
            vim.inspect(data)
            vim.keymap.set({"n", "v"}, "<leader><leader>", "<cmd>MarkdownPreviewToggle<CR>")
        end)
    end,
})
