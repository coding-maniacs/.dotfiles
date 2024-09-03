return {
  -- Hop
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      local hop = require('hop')
      hop.setup()
      vim.keymap.set("n", "<leader><leader>f", function()
        hop.hint_char1({})
      end, {remap=true})
      end
  }
