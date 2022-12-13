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

-- local ls = require("luasnip")
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = ls_extras.lambda
-- local rep = ls_extras.rep
-- local p = ls_extras.partial
-- local m = ls_extras.match
-- local n = ls_extras.nonempty
-- local dl = ls_extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet

ls.setup({
	snip_env = {
		show = function(args)
			return args[1][1]
		end,
		current_filename_with_ext = function()
			return vim.fn.expand('%:t')
		end,
		current_filename_with_no_ext = function()
			local filename = vim.fn.expand('%:t')
			local first_dot_idx = string.find(filename, '.', 1, true)
			if first_dot_idx == nil then
				return 'NO_DOT_FOUND_IN_FILENAME'
			elseif first_dot_idx == 1 then
				return 'FILE_HAS_NO_NAME_ONLY_EXTENSION'
			end 
			return string.sub(filename, 1, first_dot_idx - 1)
		end,
		s = function(...)
			return ls.snippet(...)
		end,
		t = function(...)
			return ls.text_node(...)
		end,
		f = function(...)
			return ls.function_node(...)
		end,
		i = function(...)
			return ls.insert_node(...)
		end,
		c = function(...)
			return ls.choice_node(...)
		end,
	},
})

require('luasnip.loaders.from_lua').load({paths = vim.env.CUSTOM_VIMRC_PATH..'snippets'})
