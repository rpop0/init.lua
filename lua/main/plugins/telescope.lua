return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep'
    },

    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("grep > ") });
        end)

        require('telescope').setup{
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "venv"
                }
            }
        }
    end
}
