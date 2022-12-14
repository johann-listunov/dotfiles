local M = {}

local file_exists = function(filename)
	local file = io.open(filename,"r")
	if file ~= nil then
		io.close(file) 
		return true 
	else 
		return false 
	end
end

local string_endswith = function(s, suffix)
	return s:sub(-string.len(suffix)) == suffix
end

local file_has_suffix = function(filename, suffix_arr)
	for idx = 1, #(suffix_arr) do
		if string_endswith(filename, suffix_arr[idx]) then
			return true, suffix_arr[idx]
		end
	end
	return false, nil
end

local get_filepath_with_new_suffix = function(no_suffix_filename, suffix_arr)
    for idx = 1, #(suffix_arr) do
        local filepath = no_suffix_filename..suffix_arr[idx]
        if file_exists(filepath) then
            return filepath
        end
    end
    return nil
end

local find_corresponding_file = function(filepath, suffix_a, suffix_b)
	local is_type_a, a_ext = file_has_suffix(filepath, suffix_a)
    local is_type_b, b_ext = file_has_suffix(filepath, suffix_b)

    local no_suffix_filename = nil
    local suffix_arr = nil

    if is_type_a then
        suffix_arr = suffix_b
        no_suffix_filename = filepath:gsub('%'..a_ext, '')
    elseif is_type_b then
        suffix_arr = suffix_a
        no_suffix_filename = filepath:gsub('%'..b_ext, '')
    end

    if no_suffix_filename == nil or suffix_arr == nil then
        return 'Not header or cpp file', nil
    end

    local file_to_open = get_filepath_with_new_suffix(no_suffix_filename, suffix_arr)

    if file_to_open ~= nil then
        return nil, file_to_open
    end
    
	return 'Could not find corresponding file', nil
end

M.cpp_find_corresponding_file = function(filepath)
	local suffix_h = {
		'.h',
		'.hpp'
	}
	
	local suffix_c = {
		'.c',
		'.cpp',
		'.cxx'
	}
	return find_corresponding_file(filepath, suffix_h, suffix_c)
end

return M
