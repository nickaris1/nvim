
local function update_buffer_on_move()
-- Get the current entry from the quickfix list
  local qf_list = vim.fn.getqflist()
  local entry = qf_list[vim.fn.line('.')] -- Get the current quickfix entry


  -- Check if the entry has a valid buffer number
  if entry.bufnr and entry.bufnr ~= 0 then
    --move to the upper pane
    vim.cmd('wincmd k')
    -- Switch to the buffer using the buffer number
    vim.cmd('buffer ' .. entry.bufnr)

    -- Move the cursor to the corresponding line number
    vim.cmd('normal! ' .. entry.lnum .. 'G')



    -- Optionally scroll to center the screen
    vim.cmd('normal! zz')

    vim.cmd('wincmd j')

  else
    print("No buffer associated with this entry")
  end
end


vim.api.nvim_create_augroup('QuickfixBufferUpdate', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'QuickfixBufferUpdate',
  pattern = 'qf',
  callback = function()
    -- Map 'j' and 'k' for normal navigation
    vim.keymap.set('n', 'j', function()
      vim.cmd('normal! j')
      update_buffer_on_move()
    end, { buffer = true })
    vim.keymap.set('n', 'k', function()
      vim.cmd('normal! k')
      update_buffer_on_move()
    end, { buffer = true })

    -- Map the arrow keys '<Down>' and '<Up>'
    vim.keymap.set('n', '<Down>', function()
      vim.cmd('normal! j')
      update_buffer_on_move()
    end, { buffer = true })
    vim.keymap.set('n', '<Up>', function()
      vim.cmd('normal! k')
      update_buffer_on_move()
    end, { buffer = true })
  end
})
