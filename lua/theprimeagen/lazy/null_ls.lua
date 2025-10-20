return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls");

    local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
    local event = "BufWritePre" -- or "BufWritePost"
    local async = event == "BufWritePost"

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css", "scss", "json", "yaml", "markdown" }
        }),
        null_ls.builtins.diagnostics.codespell,
        require("none-ls.diagnostics.eslint_d"),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<Leader>ff", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = bufnr, desc = "[lsp] format" })

          -- format on save
          vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
          vim.api.nvim_create_autocmd(event, {
            buffer = bufnr,
            group = group,
            callback = function()
              vim.cmd("Prettier")
              vim.cmd("w")
              -- vim.lsp.buf.format({ bufnr = bufnr, async = async })
            end,
            desc = "[lsp] format on save",
          })
        end

        if client.supports_method("textDocument/rangeFormatting") then
          vim.keymap.set("x", "<Leader>ff", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = bufnr, desc = "[lsp] format" })
        end
      end
    })
  end
}
