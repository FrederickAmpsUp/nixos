return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").install({
                "c",
                "cpp",
                "lua",
                "python",
                "rust",
                "bash",
                "json",
                "yaml",
                "markdown",
                "vim",
                "vimdoc",
            })

            vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local ok = pcall(vim.treesitter.start, args.buf)

                if not ok then
                    return
                end
            end,
        })
    end,
    },
}
