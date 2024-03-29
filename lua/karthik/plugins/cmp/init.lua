require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup()

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>x', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>Wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>Wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>Wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buk.format { async = true } end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
--lua
require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
}
--python
require('lspconfig').pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--html
require("lspconfig").html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--css
require('lspconfig').cssls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--javascript, typescript
require('lspconfig').tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--sql
require('lspconfig').sqlls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--diagnostics
require('lspconfig').diagnosticls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--enlint
require('lspconfig').eslint.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
--emmet_ls
require('lspconfig').emmet_ls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
