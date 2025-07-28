function ColorMyPencils(color)
  color = color or "tokyonight"

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true,     -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = true, bold = true },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark",   -- style for floating windows

        },
        on_colors = function(colors)
          colors.error = colors.red;
          colors.fg_function = colors.orange;
        end,
        on_highlights = function(hl, c)
          hl["@Function"] = { fg = "#ff9e00" }      -- Replace '#ff9e64' with your desired color
          hl["@Function.call"] = { fg = "#ff9e65" } -- Use the color from the colors table
        end,

      })

      vim.cmd("colorscheme tokyonight")
      ColorMyPencils()
    end
  },

}
