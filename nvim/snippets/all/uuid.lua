local ls = require("luasnip")
local ls_s = ls.snippet
local ls_sn = ls.snippet_node
local ls_isn = ls.indent_snippet_node
local ls_t = ls.text_node
local ls_i = ls.insert_node
local ls_f = ls.function_node
local ls_c = ls.choice_node
local ls_d = ls.dynamic_node
local ls_r = ls.restore_node
local ls_events = require("luasnip.util.events")
local ls_ai = require("luasnip.nodes.absolute_indexer")
local ls_extras = require("luasnip.extras")
local ls_l = ls_extras.lambda
local ls_rep = ls_extras.rep
local ls_p = ls_extras.partial
local ls_m = ls_extras.match
local ls_n = ls_extras.nonempty
local ls_dl = ls_extras.dynamic_lambda
local ls_fmt = require("luasnip.extras.fmt").fmt
local ls_fmta = require("luasnip.extras.fmt").fmta
local ls_conds = require("luasnip.extras.expand_conditions")
local ls_postfix = require("luasnip.extras.postfix").postfix
local ls_types = require("luasnip.util.types")
local ls_parse = require("luasnip.util.parser").parse_snippet

local function create_uuid()
    local random = math.random
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

return {
    ls_s('uuid upper', {
        ls_f(function()
            return string.upper(create_uuid())
        end)
    }),
    ls_s('uuid lower', {
        ls_f(function()
            return create_uuid()
        end)
    })
}
