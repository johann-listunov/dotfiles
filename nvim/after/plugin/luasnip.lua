local ls = require('luasnip')

ls.config.set_config({
	history = true,
	updateevents = 'TextChanged,TextChangedI',
	enable_autosnippets = true,
	ext_opts = {
		[require('luasnip.util.types').choiceNode] = {
			active = {
				virt_text = {{ "*", "GruvboxOrange" }}
			}
		}
	}
})

require('luasnip.loaders.from_lua').load({paths = 'D:/git/dotfiles/nvim/snippets'})
