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

            vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {
              desc = "Code Action",
            })

            vim.diagnostic.config({
              virtual_lines = {
                current_line = true,
              },
              virtual_text = false,
              signs = true,
              underline = true,
              severity_sort = true,
              update_in_insert = false,
            })
        end,
    },
}
