return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.diagnostics.eslint_d,
      },
    }

    -- vim.keymap.set('n', '<leader>ff', function() vim.lsp.buf.format{
    --   filter = function(client) return client.name ~= "tsserver" end
    -- } end, {})
    -- vim.keymap.set('v', '<leader>ff', vim.lsp.buf.format, {})
  end,
}
