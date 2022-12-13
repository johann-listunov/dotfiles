return {
    s({
        trig = 'header interface',
        dsrc = 'Creates an interface out of the name of the file.'
    }, {
        t({
            '#pragma once',
            '',
            'namespace ',
        }),
        i(1),
        t({
            '',
            '{',
            'class '
        }),
        f(current_filename_with_no_ext),
        t({
            '',
            '{',
            'public:',
            '\tvirtual ~'
        }),
        f(current_filename_with_no_ext),
        t({
            '() = default;',
            '\t',
        }),
        i(2),
        t({
            '',
            '};',
            '} // namespace ',
        }),
        f(show, {1})
    })
}
