vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua,python,c,java,json,js,r,rs,toggleterm,zsh,conf,sh,kts,diff,yuck,css,scss,html,yaml",
	callback = function()
		vim.opt.spell = false
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown,txt",
	callback = function()
		vim.opt.spell = true
	end
})
