return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      default_component_configs = {
        file_size = {
          enabled = false
        }
      },
      filesystem = {
        follow_current_file = {
          enabled = true
        }
      }
    })
    vim.keymap.set("n", "<C-n>", ":Neotree toggle current reveal_force_cwd<CR>", {})
    vim.keymap.set("n", "<leader><C-n>", ":Neotree toggle current reveal left<CR>", {})
  end
}
