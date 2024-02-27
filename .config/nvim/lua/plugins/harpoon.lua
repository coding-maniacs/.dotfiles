return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon.setup {
      save_on_toggle = true,
    }
    vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file)
    vim.keymap.set('n', '<leader>ht', require('harpoon.ui').toggle_quick_menu)
    vim.keymap.set('n', '<A-j>', require('harpoon.ui').nav_prev)
    vim.keymap.set('n', '<A-k>', require('harpoon.ui').nav_next)

    vim.keymap.set('n', '<A-u>', function()
      require('harpoon.ui').nav_file(1)
    end)

    vim.keymap.set('n', '<A-i>', function()
      require('harpoon.ui').nav_file(2)
    end)

    vim.keymap.set('n', '<A-o>', function()
      require('harpoon.ui').nav_file(3)
    end)

    vim.keymap.set('n', '<A-p>', function()
      require('harpoon.ui').nav_file(2)
    end)
  end,
}
