local nnoremap = require("user.keymap").nnoremap
local vnoremap = require("user.keymap").vnoremap
local xnoremap = require("user.keymap").xnoremap

nnoremap("<C-h>","<C-w>h")
nnoremap("<C-j>","<C-w>j")
nnoremap("<C-k>","<C-w>k")
nnoremap("<C-l>","<C-w>l")

nnoremap("<leader>b", "<c-^><CR>")
nnoremap("<leader>f", ":NERDTree<CR>")
nnoremap("<leader>p", ":Files<CR>")
nnoremap("<leader>v", ":vsplit<CR>")
nnoremap("<leader>h", ":split<CR>")

nnoremap("<leader>w", ":w<CR>")
nnoremap("<leader>q", ":q<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
