-- Delete current buffer and move to next or open Alpha if is the last
function BufferDel()
	local current = vim.api.nvim_get_current_buf()
	local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })

	if #listed_buffers <= 1 then
		vim.cmd("bdelete " .. current)
		pcall(function()
			vim.cmd("Alpha")
		end)
	else
		vim.cmd("bnext")
		vim.cmd("bdelete " .. current)
	end
end

-- Open Containing Folder
function OpenContainerFolder()
	local path = vim.fn.expand("%:p:h")
	local open_cmd

	if vim.fn.has("win32") == 1 then
		open_cmd = "explorer " .. vim.fn.shellescape(path)
	elseif vim.fn.has("mac") == 1 then
		open_cmd = "open " .. vim.fn.shellescape(path)
	else
		-- Change for you default file manager (Thunar, Dolphin)
		open_cmd = "nautilus " .. vim.fn.shellescape(path) .. " &"
	end
	vim.fn.system(open_cmd)
end

-- Open Folder
function OpenFolder()
	local fzf = require("fzf-lua")
	fzf.files({
		cwd = "~/",
		cmd = "find . -maxdepth 2 -type d",
		prompt = "Ir para > ",
		file_icons = false,
		actions = {
			["default"] = function(selected)
				local entry = selected[1]
				if entry then
					local full_path = vim.fn.expand("~/" .. entry)
					vim.cmd("silent cd " .. vim.fn.fnameescape(full_path))
					vim.cmd("Neotree filesystem reveal dir=" .. vim.fn.fnameescape(full_path))
					vim.cmd("redraw")
					print("CWD: " .. full_path)
				end
			end,
		},
	})
end
