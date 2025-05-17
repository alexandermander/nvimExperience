return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Configure Prettier as a formatter for TypeScript, TSX, JS, JSX
          null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
          }),
        },
        -- You can also set a border or other options here if desired
      })

      -- Optional: Automatically format on save for these filetypes
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end,
  },
}
