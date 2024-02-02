require("catppuccin").setup({
    integrations = {
        cmp = true,
        treesitter = true
    }
})

vim.cmd.colorscheme "catppuccin"
