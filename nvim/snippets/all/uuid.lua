local create_uuid = function()
    math.randomseed(os.clock() * 100000000000)
    local random = math.random
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

return {
    s({
        trig = 'uuid upper',
        dscr = 'Generates an upper-case UUIDv4' 
    }, {
        f(function()
            return string.upper(create_uuid())
        end)
    }),
    s({
        trig = 'uuid lower',
        dscr = 'Generates a lower-case UUIDv4' 
    }, {
        f(function()
            return create_uuid()
        end)
    })
}
