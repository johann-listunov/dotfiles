local nnoremap = require('custom.keymap').nnoremap
local cpp_find_corresponding_file = require('custom.switchfile').cpp_find_corresponding_file

nnoremap('<leader>pv', '<cmd>Ex<CR>')

nnoremap('<leader>ff', '<cmd>Telescope find_files<CR>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep<CR>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<CR>')

nnoremap('<leader>bd', '<cmd>bd<CR>')

-- Custom Key Binds
local cpp_switch_header_cpp = function()
	local current_path = vim.fn.expand('%')
	local error, path = cpp_find_corresponding_file(current_path)
	if error ~= nil then
    	print('[INFO] '..error)
        return
	end

    if path ~= nil then
        vim.cmd('e '..path)
    end
end

nnoremap('<leader>sf', cpp_switch_header_cpp)
