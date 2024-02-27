return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    local harpoon = require 'harpoon'
    harpoon.setup {
      settings = {
        save_on_toggle = true,
      },
    }

    -- Keybindings
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():append()
    end)

    vim.keymap.set('n', '<leader>ht', function()
      toggle_telescope(harpoon:list())
    end)

    vim.keymap.set('n', '<A-j>', function()
      harpoon:list():prev()
    end)

    vim.keymap.set('n', '<A-k>', function()
      harpoon:list():next()
    end)

    vim.keymap.set('n', '<A-u>', function()
      harpoon:list():select(1)
    end)

    vim.keymap.set('n', '<A-i>', function()
      harpoon:list():select(2)
    end)

    vim.keymap.set('n', '<A-o>', function()
      harpoon:list():select(3)
    end)

    vim.keymap.set('n', '<A-p>', function()
      harpoon:list():select(4)
    end)
  end,
}
