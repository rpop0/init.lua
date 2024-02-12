return {
    'tpope/vim-fugitive',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'ggandor/leap.nvim',
        dependencies = {
            'tpope/vim-repeat'
        },
        config = function ()
            require('leap').create_default_mappings()
        end
    }
}
