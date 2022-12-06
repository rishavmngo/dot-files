vim.api.nvim_create_user_command("Ccompile", "lua Compile()", { bang = true })
vim.api.nvim_create_user_command("Cinput", "lua OpenInputInVerticalSplit(30)", { bang = true })

function OpenInputInVerticalSplit(size)
	CreateInputFileIfNotExist()
	local str = size .. "vsplit input"
	vim.cmd(str)
end

function CreateInputFileIfNotExist()
	local file_exists = vim.fn.filereadable("./input")
	if file_exists == 0 then
		vim.cmd([[!touch input]])
	end
end

local executor_map = {
	cpp = [[!g++ % && ./a.out < input]],
	c = [[!gcc % && ./a.out < input]],
	javascript = [[!node %]],
	python = [[!python %]],
	go = [[!go run %]],
	lua = [[!lua %]],
	clojure = [[!clojure -M %]],
}

function Compile()
	local filetype = vim.bo.filetype
	if executor_map[filetype] then
		vim.cmd(executor_map[filetype])
	else
		print("Warning: Executor for " .. filetype .. " not implemented yet!")
	end
end
