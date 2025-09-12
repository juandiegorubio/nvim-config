-- vim: ts=4 sts=4 sw=4 expandtab


require("telescope").setup({
	extensions = {
		wrap_results = true,
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
    pickers = {
        find_files = { hidden = true }
    }
})

local load_extension = require("telescope").load_extension
pcall(load_extension, "fzf")
pcall(load_extension, "smart_history")
pcall(load_extension, "ui-select")



-- Keymaps
local builtin = require("telescope.builtin")
local keymap = vim.keymap.set

keymap("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
keymap("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
keymap("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
keymap("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
keymap("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
keymap("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
keymap("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
keymap("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
keymap("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
keymap("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

keymap("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

keymap("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

keymap("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

