local function loadFolder(name)
	local files = love.filesystem.getDirectoryItems(name)
	local string = ""

	for i, filename in pairs(files) do
		local data = love.filesystem.read(name .. "/" .. filename)
		string = string .. data .. "\n"
	end

	return loadstring(string)
end

return loadFolder