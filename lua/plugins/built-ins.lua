-- A catchall to enable some built-ins that came with .12

-- undotree
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", function()
	require("undotree").open({
		command = math.floor(vim.api.nvim_win_get_width(0) / 3) .. "vnew",
	})
end, { desc = "[U]ndotree toggle" })


-- clear search highlight on insert
vim.cmd("packadd nohlsearch")
