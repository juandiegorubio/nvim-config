-- vim: ts=2 sts=2 sw=2 expandtab

return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
      "folke/lazydev.nvim",
      { "L3MON4D3/LuaSnip",
        version = "2.*",
        build = (function()
            if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                return
            end
            return "make install_jsregexp"
        end)(),
        dependencies = {
            { 'rafamadriz/friendly-snippets',
                config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
            },
        },
        opts = {},
      },
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
        keymap = {
          preset = "none",
          ["<C-Space>"] = { "show" },
          ["<CR>"] = { "accept", "fallback" },
          -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
          -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
          -- ["<Tab>"] = {
          --   function(cmp)
          --     if cmp.is_visible() then
          --       return cmp.accept()
          --     end
          --     return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
          --   end,
          --   "fallback",
          -- },
          -- ["<S-Tab>"] = { "fallback" },
        },
        appearance = { nerd_font_variant = "mono", },
        completion = { documentation = { auto_show = false, auto_show_delay_ms = 500 }, },

        sources = {
            default = { "lsp", "path", "snippets", "lazydev" },
            providers = {
                lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
            },
        },

        snippets = { preset = "luasnip" },
        fuzzy = { implementation = "prefer_rust" },
        signature = { enabled = true },
    },
}
