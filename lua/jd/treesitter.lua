local ts_group = vim.api.nvim_create_augroup("custom-treesitter", { clear = true })

require("nvim-treesitter").setup({
	ensure_installed = {
		"bash",
		"c",
		"diff",
		"html",
		"lua",
		"luadoc",
		"markdown",
		"markdown-inline",
		"query",
		"vim",
		"vimdoc",
	},

	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
})


