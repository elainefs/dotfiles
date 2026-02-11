local map = function(mode, key, command)
	vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<ESC>:w<CR>")
map("n", "q", ":q<CR>")
map("n", "<C-q>", ":bd<CR>")

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

-- Replace
map("n", "<C-h>", ":%s/")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Select all content
map("n", "<C-a>", "ggVG")

-- Comment lines with Ctrl + /
map("n", "<C-/>", ":normal gcc<CR>")
map("v", "<C-/>", ":normal gcc<CR>")

-- Clear search highlight
map("n", "<ESC>", ":nohlsearch<cr>")

-- Keymaps for Bufferline
-- These commands will move the current buffer backwards or forwards in the bufferline
map("n", "<leader>+", ":BufferLineMoveNext<CR>")
map("n", "<leader>_", ":BufferLineMovePrev<CR>")

-- Open Containing Folder
vim.keymap.set("n", "<leader>p", function()
	local path = vim.fn.expand("%:p:h") -- Get current dir file
	local open_cmd

	if vim.fn.has("win32") == 1 then
		open_cmd = "explorer " .. vim.fn.shellescape(path)
	elseif vim.fn.has("mac") == 1 then
		open_cmd = "open " .. vim.fn.shellescape(path)
	else
		open_cmd = "xdg-open " .. vim.fn.shellescape(path)
	end

	vim.fn.system(open_cmd)
end, { noremap = true, silent = true, desc = "Open Containing Folder" })

-- Open Folder
function OpenFolder()
	local fb = require("telescope").extensions.file_browser.file_browser
	fb({
		path = "~/",
		select_buffer = true,
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		attach_mappings = function(prompt_bufnr, mp)
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			mp("i", "<CR>", function()
				local entry = action_state.get_selected_entry()
				local dir = entry.path
				actions.close(prompt_bufnr)
				vim.cmd("cd " .. dir)
				vim.cmd("Neotree focus")
			end)

			return true
		end,
	})
end

vim.keymap.set("n", "<C-k><C-o>", "<cmd>lua OpenFolder()<CR>", { desc = "Open Folder" })
