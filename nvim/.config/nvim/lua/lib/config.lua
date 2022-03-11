return function(files)
	for _, file in pairs(files) do
		local ext = file:match("%..*$")
		if ext == ".vim" then
			vim.cmd("runtime "..file)
		else
			require(file)
		end
	end
end

