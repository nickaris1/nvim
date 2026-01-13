return {
  'pwntester/octo.nvim',
  event = "VeryLazy",
  build = "make",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require "octo".setup({ enable_builtin = true, picker = "telescope" })
    vim.cmd([[hi OctoEditable guibg=none]])

    vim.keymap.set("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })

  end,
  keys = {
    { "<leader>O",  "<cmd>Octo<cr>",                   desc = "Octo" },
    { "<leader>On", "<cmd>Octo notification list<cr>", desc = "Octo Notifications" },
    {
      "<leader>Oi",
      "<CMD>Octo issue list<CR>",
      desc = "List GitHub Issues",
    },
    {
      "<leader>Op",
      "<CMD>Octo pr list<CR>",
      desc = "List GitHub PullRequests",
    },
    {
      "<leader>Od",
      "<CMD>Octo discussion list<CR>",
      desc = "List GitHub Discussions",
    },
    {
      "<localleader>Os",
      function()
        require("octo.utils").create_base_search_command { include_current_repo = true }
      end,
      desc = "Search GitHub",
    },
  }
}
