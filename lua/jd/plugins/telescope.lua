-- vim: ts=4 sts=4 sw=4 expandtab

return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",

    dependencies = {
        "nvim-lua/plenary.nvim",

        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

        "nvim-telescope/telescope-ui-select.nvim",

        "nvim-telescope/telescope-smart-history.nvim",
        "kkharji/sqlite.lua",   -- Required by smart-history

        -- { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },

    config = function()
        require("jd.telescope")
    end,
}
