vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.relativenumber = true
		-- vim.opt_local.textwidth = 72
	end,
})

vim.cmd([[
   augroup _python
       autocmd!
       autocmd Filetype python nmap <leader>r :20 split term://python3 %<CR>
   augroup end

    augroup _templates
        autocmd!
        autocmd BufNewFile *.py 0r ~/.config/nvim/templates/py.skeleton
        autocmd BufNewFile *.go 0r ~/.config/nvim/templates/go.skeleton
        autocmd BufNewFile *.todo 0r ~/.config/nvim/templates/todo.skeleton
    augroup end

    augroup _sql
        autocmd!
        autocmd Filetype sql :colorscheme retrobox
        " autocmd Filetype sql nmap <leader>r :20 split term://snowsql -f %<CR>
        autocmd Filetype sql nmap <leader>t :!sqlfmt %<CR><CR>
    augroup end

    augroup _terminal
        autocmd!
        autocmd TermOpen * setlocal nonumber norelativenumber
    augroup end
]])
