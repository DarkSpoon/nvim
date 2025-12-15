local function getOS()
	-- ask LuaJIT first
	if jit then
		return jit.os
	end

	-- Unix, Linux variants
	local fh,err = assert(io.popen("uname -o 2>/dev/null","r"))
	if fh then
		Osname = fh:read()
	end

	return Osname or "Windows"
end

local osname = getOS()
local workPath = ''
local personalPath = ''

if osname == 'Windows' then
    workPath = "C:\\Users\\jpayne\\wiki\\work"
    personalPath = "C:\\Users\\jpayne\\wiki\\personal"
else
    workPath = "/home/jpayne/Documents/wiki/work"
    personalPath = "/home/jpayne/Documents/wiki/personal"
end

return {
    "echaya/neowiki.nvim",
    event = "VeryLazy",
    opts = {
        wiki_dirs = {
            -- neowiki.nvim supports both absolute and tilde-expanded paths
            { name = "Work", path = workPath },
            { name = "Personal", path = personalPath },
            -- { name = "Work", path = "C:\\Users\\jpayne\\wiki\\work" },
            -- { name = "Personal", path = "C:\\Users\\jpayne\\wiki\\personal" },
            -- { name = "Work", path = "/home/jpayne/Documents/wiki/Work" },
            -- { name = "Personal", path = "/home/jpayne/Documents/wiki/Personal" },
        },
        keymaps = {
            -- Jumps to the index page of the current wiki.
            jump_to_index = "<Home>",
            -- Renames the current wiki page and updates backlinks.
            rename_page = "<leader>nr",
            -- Deletes the current wiki page and updates backlinks.
            delete_page = "<leader>nd",
            -- Inserts a link to another wiki page.
            insert_link = "<leader>ni",
            -- Removes all links in the current file that point to non-existent pages.
            cleanup_links = "<leader>nc",

            -- Toggles the status of a gtd item.
            -- Works on the current line in Normal mode and on the selection in Visual mode.
            toggle_task = "<leader>nt",
        },
    },
    init = function(opts)
        require("neowiki").setup(opts)
    end,
}
