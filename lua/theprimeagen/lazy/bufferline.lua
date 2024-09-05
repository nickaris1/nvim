return {
  "akinsho/nvim-bufferline.lua",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            hilight = "Directory",
            separator = true,
          }
        },
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true
      },
      highlights = {
        separator = {
          guifg = '#073642',
          guibg = '#002b36',
        },
        separator_selected = {
          guifg = '#073642',
        },
        background = {
          guifg = '#657b83',
          guibg = '#002b36'
        },
        buffer_selected = {
          guifg = '#fdf6e3',
          gui = "bold",
        },
        fill = {
          guibg = '#073642'
        }
      },
    })

    vim.keymap.set('n', '<C-Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
    vim.keymap.set('n', '<C-S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
    vim.keymap.set('n', '<C-S-w>', '<Cmd>bd<CR>', {})
    vim.keymap.set('i', '<C-S-w>', '<Cmd>bd<CR>', {})
  end
}
