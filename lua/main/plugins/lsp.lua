return {

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
        config = false
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim'
        },

        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

                vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {'pylsp', 'ruff_lsp', 'tsserver'},
                handlers = {
                    lsp_zero.default_setup,
                }
            })

            require('lspconfig').pylsp.setup{
                settings = {
                    pylsp = {
                        plugins = {
                            pylint = {enabled = false},
                            pyflakes = {enabled = false},
                            pycodestyle = {enabled = false},
                            autopep8 = {enabled = false},
                            mccabe = {enabled = false},
                            yapf = {enabled = false},
                            jedi_completion = { fuzzy = true }

                        }
                    }
                }
            }

        end
    }
}
