return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  event = "InsertEnter",
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")

    -- Basic config
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = false,
    })

    -- Load Lua snippets from ~/.config/nvim/lua/snippets
    require("luasnip.loaders.from_lua").lazy_load({
      paths = {
        vim.fn.stdpath("config") .. "/lua/snippets",
      },
    })


    -- Reload Snippets
    vim.keymap.set("n", "<localleader>s", function()
      ls.cleanup()
      require("luasnip.loaders.from_lua").load({
        paths = {
          vim.fn.stdpath("config") .. "/lua/snippets",
        },
      })
      print(vim.fn.stdpath("config") .. "/lua/snippets")
      print("Snippets Reloaded")
    end)

    -- Keymaps
    vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
       if require("luasnip").expand_or_jumpable() then
         require("luasnip").expand_or_jump()
       else
         vim.api.nvim_feedkeys(
           vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true),
           "n",
           true
         )
       end
     end, { silent = true })


    vim.keymap.set({ "i", "s" }, "<M-]>", function()
      if ls.jump(1) then
        ls.jump(1)
      else
        return "<M-]>"
      end
    end, { expr = true, silent = true })

    vim.keymap.set({ "i", "s" }, "<M-[>", function()
      if ls.jump(-1) then
        ls.jump(-1)
      else
        return "<M-[>"
      end
    end, { expr = true, silent = true })


    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)
  end,
}

