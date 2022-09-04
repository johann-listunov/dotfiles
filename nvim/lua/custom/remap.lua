local nnoremap = require('custom.keymap').nnoremap

nnoremap('<leader>pv', '<cmd>Ex<CR>')

nnoremap('<leader>ff', '<cmd>Telescope find_files<CR>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep<CR>')
