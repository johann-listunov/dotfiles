require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'c', 'cpp', 'lua'},
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
}