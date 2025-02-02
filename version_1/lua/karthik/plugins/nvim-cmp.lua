local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local luasnip = require("luasnip")
local cmp = require'cmp'
require("luasnip/loaders/from_vscode").lazy_load()


  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
        --['<C-K>'] = cmp.mapping.select_prev_item(),
        --['<C-J'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        --['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        --["<C-Space>"] = cmp.mapping(cmp.mapping.complete({
            --reason = cmp.ContextReason.Auto,
            --}), {"i", "c"}),
      vim.keymap.set('i', '<C-K>', "cmp.mapping.select_prev_item()"),
      vim.keymap.set('i', '<C-J>', "cmp.mapping.select_next_item()"),
      --vim.keymap.set('i', '<C-b>', "cmp.mapping.scroll_docs(-4)"),
      --vim.keymap.set('i', '<C-f>', "cmp.mapping.scroll_docs(4)"),
      vim.keymap.set('i', '<C-s>', function()
          cmp.mapping.complete({
              reason = cmp.ContextReason.Auto,
          })
          {"i","c"}
      end),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      --vim.keymap.set('i', '<CR>', function()
        --   cmp.mapping.confirm({ select = false})
      --end),
      vim.keymap.set('i', '<C-e>', "cmp.mapping.abort()"),
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
              luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jumpable()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-2) then
              luasnip.jump(-2)
          else
              fallback()
          end
        end, { "i", "s" }),

    }),

     formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
     },

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'nvim_lua' },
    }, {
        { name = 'path' },
        { name = 'buffer' },
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })
  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  --local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
   -- capabilities = capabilities
--  }
