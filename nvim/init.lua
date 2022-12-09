-- define own environment vars here
local initlua_len = string.len('init.lua') + 1
vim.env.CUSTOM_VIMRC_PATH = vim.env.MYVIMRC:sub(1, -initlua_len)

require('custom')
