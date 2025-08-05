return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local none_ls = require("null-ls");

    local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
    local event = "BufWritePre" -- or "BufWritePost"
    local async = event == "BufWritePost"

    none_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d").with({
          diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
        none_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css", "scss", "json", "yaml", "markdown" }
        }),
      },
      on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }


        vim.keymap.set("n", "<Leader>vrn", function()
          vim.lsp.buf.rename()
        end, { buffer = bufnr, desc = "[lsp] rename" })

        vim.keymap.set("n", "<Leader>vh", function()
          vim.lsp.buf.hover()
        end, { buffer = bufnr, desc = "[lsp] hover" })

        vim.keymap.set("n", "<Leader>vn", function()
          vim.diagnostic.goto_next()
        end, { buffer = bufnr, desc = "[lsp] go to next" })

        vim.keymap.set("n", "<Leader>vd", function()
          vim.lsp.diagnostic.show_line_diagnostics()
        end, { buffer = bufnr, desc = "[lsp] show line diagnostics" })

        vim.keymap.set("n", "<Leader>vrr", function()
          vim.lsp.buf.references()
        end, { buffer = bufnr, desc = "[lsp] references" })

        vim.keymap.set("n", "<M-CR>", function() vim.lsp.buf.code_action() end, opts)

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
