return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        typescript = {"prettier"}
      },
      format_on_save = { lsp_fallback = true, timeout_ms = 500 },
      notify_on_error = true,
    })

    

    vim.api.nvim_create_user_command("FormatConform", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })

    vim.keymap.set('n', '<leader>ff', ":FormatConform<CR>", {})
    vim.keymap.set('v', '<leader>ff', ":FormatConform<CR>", {})
  end
}
