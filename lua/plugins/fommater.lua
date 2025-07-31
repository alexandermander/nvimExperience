return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            filetypes = {
              "javascript",
              "typescript",
              "typescriptreact",
              "javascriptreact",
              "html", -- ✅ HTML support
            },
          }),
        },
      })

      -- ✅ Map <Leader>f to format the buffer
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "Format file", noremap = true, silent = true })
    end,
  },
}

