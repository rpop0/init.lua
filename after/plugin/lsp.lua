local lsp_zero = require('lsp-zero')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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


--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'pylsp', 'ruff_lsp', 'tsserver'},
    handlers = {
        lsp_zero.default_setup,
    },
})

-- Pylsp used primarily for completion
require('lspconfig').pylsp.setup{
    capabilities = capabilities,
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

-- Ruff_lsp used for python linting
require('lspconfig').ruff_lsp.setup{}

require('lspconfig').tsserver.setup{}
require('lspconfig').html.setup{}
require('lspconfig').cssls.setup{}
require('lspconfig').svelte.setup{}
require('lspconfig').tailwindcss.setup{}


local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Completion for / replacing
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})


-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

