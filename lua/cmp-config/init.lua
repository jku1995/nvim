vim.g.completeopt="menu,menuone,noselect,noinsert"
-- Setup nvim-cmp.
  local luasnip = require'luasnip'
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - 必须指定snip引擎
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    sources = {
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
      { name = 'nvim-lsp' },
      -- more sources
    },
    --按键映射
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
	if not entry then
	  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	else
	  cmp.confirm()
	end
      else
        fallback()
      end
    end, {"i","s","c",}),
      }),
    })
  -- 指定文件类型使用cmp源
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, --如果你安装了‘cmp-git’源，可在此指定 
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
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

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require'lspconfig'.html.setup {
    capabilities = capabilities
  }
