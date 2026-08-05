vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8
vim.opt.termguicolors = true

vim.opt.smartindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "h", "hpp", "hxx", "h++",
    		"c", "cpp", "cxx", "c++" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})
