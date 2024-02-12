return {
    'lewis6991/gitsigns.nvim',
    config = function ()
        require('gitsigns').setup{
            on_attach = function ()
                local gs = package.loaded.gitsigns
                vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
                vim.keymap.set('n', '<leader>hr', gs.reset_hunk)
                vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame)
                vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end)
                vim.keymap.set('n', '<leader>hs', gs.stage_hunk)

                -- Text objects
                vim.keymap.set('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                vim.keymap.set('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    end
}

