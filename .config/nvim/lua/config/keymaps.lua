local map = function(mode, key, command, desc)
	vim.keymap.set(mode, key, command, { noremap = true, silent = true, desc = desc })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.functions")

map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<ESC>:w<CR>")
map("n", "<S-q>", ":%bd<CR>")
map("n", "q", BufferDel)
map("v", "q", "<cmd>lua BufferDel()<CR>")

-- Neotree
map("n", "<C-b>", ":Neotree toggle<CR>")
map("i", "<C-b>", "<ESC>:Neotree toggle<CR>")

-- Move lines Up and Down
map("n", "<S-Down>", ":m +1<CR>")
map("n", "<S-Up>", ":m -2<CR>")
map("v", "<S-Down>", ":m '>+1<CR>gv=gv")
map("v", "<S-Up>", ":m '<-2<CR>gv=gv")

-- Split navigation
map("n", "<C-Left>", "<C-w>h")
map("n", "<C-Down>", "<C-w>j")
map("n", "<C-Right>", "<C-w>l")
map("n", "<C-Up>", "<C-w>k")

-- Navigation between buffers
map("n", "<Tab>", ":bn<CR>")
map("n", "<S-Tab>", ":bp<CR>")

-- Split buffer
map("n", "<leader>r", ":vsplit<CR>")
map("n", "<leader>b", ":split<CR>")

-- Replace word under the cursor
map("n", "<C-h>", ":%s/\\<<C-r><C-w>\\>//gc<left><left><left>")

-- Search new occurrence without jump
map("n", "*", ":keepjumps normal! mi*`i<CR>")

-- Clear search highlight
map("n", "<ESC>", ":nohlsearch<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Select all content
map("n", "<C-a>", "ggVG")

-- Comment lines with Ctrl + /
map("n", "<C-/>", ":normal gcc<CR>")
map("v", "<C-/>", ":normal gcc<CR>")
map("n", "<C-_>", ":normal gcc<CR>") -- for tmux
map("v", "<C-_>", ":normal gcc<CR>") -- for tmux

-- Keymaps for Bufferline
-- These commands will move the current buffer backwards or forwards in the bufferline
map("n", "<leader>+", ":BufferLineMoveNext<CR>")
map("n", "<leader>_", ":BufferLineMovePrev<CR>")

-- Open Containing Folder
map("n", "<leader>p", OpenContainerFolder, "Open Container Folder")

-- Open Folder
map("n", "<C-k><C-o>", OpenFolder, "Open Folder")
