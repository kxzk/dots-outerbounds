local function file_path()
	local path_to_file = vim.fn.pathshorten(vim.fn.getcwd()):lower()
	return path_to_file .. "/"
end

local function hl(group, fg, bg)
	vim.cmd("highlight " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
end

-- colorscheme: neovim 0.10 default
hl("StatusColor", "#2c2e33", "#1c1d23")
hl("StatusColor1", "#4f5258", "#1c1d23")
hl("StatusColor2", "#FFCAFF", "#1c1d23")

function status_line()
	if vim.bo.filetype == "sql" then
		return "%f"
	end

	return table.concat({
		"%#StatusColor1#",
		" ",
		"%<",
		"%#StatusColor#",
		"%=",
		file_path(),
		"%#StatusColor1#",
		"%f",
		"%#StatusColor2#",
		"%=",
		"%m",
		" ",
	})
end

vim.opt.statusline = "%!luaeval('status_line()')"
