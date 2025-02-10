-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit colour
vim.opt.termguicolors = true

-- Setup Nvim Tree

require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})


vim.api.nvim_create_autocmd({ "VimEnter" },
{
	callback = function()
		local hasToOpenTree = pcall(vim.api.nvim_echo, {{vim.v.argv[3], 'None'}, {'', 'None'}}, true, {})

		if hasToOpenTree == true
		then
			if vim.v.argv[3] ~= "." and vim.v.argv[3] == ""
			then
				local api = require("nvim-tree.api")
				api.tree.toggle({path = vim.v.argv[3], focus = false})
			end
		end
	end
})


vim.api.nvim_create_autocmd({ "BufAdd" },
{
	callback = function()
		local api = require("nvim-tree.api")
		if not api.tree.is_visible()
		then
			api.tree.toggle({path = "<args>", focus = false})
		end
	end
})

local function tab_win_closed(winnr)
	local api = require("nvim-tree.api")
	local tabnr = vim.api.nvim_win_get_tabpage(winnr)
	local bufnr = vim.api.nvim_win_get_buf(winnr)
	local buf_info = vim.fn.getbufinfo(bufnr)[1]
	local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
	local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
	if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
		-- Close all nvim tree on :q
		if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
			api.tree.close()
		end
	else                                                      -- else closed buffer was normal buffer
		if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
			local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
			if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
				vim.schedule(function ()
					if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
						vim.cmd "quit"                                        -- then close all of vim
					else                                                  -- else there are more tabs open
						vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
					end
				end)
			end
		end
	end
end

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function ()
		local hasDressingInput = false
		local winnr = tonumber(vim.fn.expand("<amatch>"))
		local bufnr = vim.api.nvim_win_get_buf(winnr)
		if vim.bo[bufnr].filetype == "DressingInput" then
			hasDressingInput = true
		end
		if not hasDressingInput then
			vim.schedule_wrap(tab_win_closed(winnr))
		end
	end,
	nested = true
})
