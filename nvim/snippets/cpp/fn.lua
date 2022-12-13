return {
	s({
		trig = 'virt fn',
		dsrc = 'Creates a pure-virtual function.'
	}, {
		t'virtual ', i(1, 'void'), t' ', i(2), t'(', i(3), t') = 0;'
	}),
	s({
		trig = 'virt const fn',
		dsrc = 'Creates a const pure-virtual function.'
	}, {
		t'virtual ', i(1, 'void'), t' ', i(2), t'(', i(3), t') const = 0;'
	}),
	s({
		trig = 'member fn',
		dsrc = 'Creates a const pure-virtual function.'
	}, {
		i(1, 'void'), t' ', f(current_filename_with_no_ext), t'::', i(2), t'(', i(3), t({')',
		'{',
		'\t'}), 
		i(4),
		t({'', '}'})
	}),
	s({
		trig = 'member const fn',
		dsrc = 'Creates a const pure-virtual function.'
	}, {
		i(1, 'void'), t' ', f(current_filename_with_no_ext), t'::', i(2), t'(', i(3), t({') const',
		'{',
		'\t'}), 
		i(4),
		t({'', '}'})
	})
}