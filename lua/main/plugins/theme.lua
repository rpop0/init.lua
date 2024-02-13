return{
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            integrations = {
                cmp = true,
                treesitter = true,
                leap = true,
                harpoon = true
            }
        })
        vim.cmd.colorscheme "catppuccin"
    end
}
