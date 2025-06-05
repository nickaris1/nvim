return {
  'dmmulroy/tsc.nvim',
  config = function()
    require("tsc").setup({
      bin_path = ".\\node_modules\\.bin\\tsc",
    })
  end
}
