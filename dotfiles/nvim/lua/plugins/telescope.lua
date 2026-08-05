return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local telescope = require("telescope")

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        preview_width = 0.5,
                    },
                },
            })

            vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", {
                desc = "Find files",
            })

            vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", {
                desc = "Live grep",
            })
        end,
    },
}
