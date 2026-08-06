return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                direction = "float",
                float_ops = {
                    border = "rounded",
                },
                shell = vim.fn.exepath("zsh"),
            })

            vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<cr>")
            vim.keymap.set("t", "<C-\\>", [[<C-\><C-n><cmd>ToggleTerm<cr>]])
        end,
    },
}
