return {
    {
        "neovim/nvim-lspconfig",

        config = function()
            vim.lsp.config("clangd", {})
            vim.lsp.enable("clangd")

            vim.lsp.config("rust_analyzer", {})
            vim.lsp.enable("rust_analyzer")

            vim.lsp.config("pyright", {})
            vim.lsp.enable("pyright")

            vim.lsp.config("lua_ls", {})
            vim.lsp.enable("lua_ls")

            vim.keymap.set("n", "K", function()
              vim.lsp.buf.hover({
                border = "rounded",
              })
            end, {
              desc = "Show symbol information",
            })
        end,
    },
}
