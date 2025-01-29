return {
  "akinsho/flutter-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim", "mfussenegger/nvim-dap" },
  config = function()
    require('flutter-tools').setup {
      -- (uncomment below line for windows only)
      -- flutter_path = "home/flutter/bin/flutter.bat",

      debugger = {
        -- make these two params true to enable debug mode
        enabled = false,
        run_via_dap = false,
        register_configurations = function(_)
          require("dap").adapters.dart = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
            args = { "flutter" }
          }

          require("dap").configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Launch flutter",
              dartSdkPath = 'home/flutter/bin/cache/dart-sdk/',
              flutterSdkPath = "home/flutter",
              program = "${workspaceFolder}/lib/main.dart",
              cwd = "${workspaceFolder}",
            }
          }
          -- uncomment below line if you've launch.json file already in your vscode setup
          -- require("dap.ext.vscode").load_launchjs()
        end,
      },
      dev_log = {
        -- toggle it when you run without DAP
        enabled = false,
        open_cmd = "tabedit",
      },
      lsp = {
        on_attach = require("vim.lsp").common_on_attach,
        capabilities = require("vim.lsp").default_capabilities,
      },

      vim.keymap.set('n', '<leader>r', require('telescope').extensions.flutter.commands, { desc = 'Open command Flutter' })

    }
  end
}
