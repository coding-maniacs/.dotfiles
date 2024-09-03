return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has 'win32' == 1 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    -- 'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-path',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',

    -- for tailwindcss
    "luckasRanarison/tailwind-tools.nvim",
    "onsails/lspkind-nvim",
  },
  config = function()
    -- [[ Configure nvim-cmp ]]
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {}

    cmp.setup({
      formatting = {
        format = require("lspkind").cmp_format({
          before = require("tailwind-tools.cmp").lspkind_format
        }),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
          -- vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered(),
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          -- behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        -- { name = 'vsnip' },
      }, {
        name = "buffer"
      }),
    })
  end
}
