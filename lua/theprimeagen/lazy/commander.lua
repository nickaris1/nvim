return {
  "FeiyouG/commander.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "<Leader>fc", "<CMD> Telescope commander<CR>", mode = "n", desc = "Open commander" },
  },
  config = function()
    require("commander").setup({
      components = {
        "DESC",
        "KEYS",
        "CAT",
      },
      sort_by = {
        "DESC",
        "KEYS",
        "CAT",
        "CMD"
      },
      integration = {
        telescope = {
          enable = true,
        },
        lazy = {
          enable = true,
          set_plugin_name_as_cat = true
        }
      }
    })
  end,
}
