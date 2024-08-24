local tileWidth = 256 / 10
local tileHeight = 256 / 10

local function load()
end

local function update(dt)
end

local function draw()
	local x = 0
	local y = 0

	for i = 0, 20 do
		if i > 0 and i % 10 == 0 then
			x = 0
			y = y + 1
		end

		fillrect(x * tileWidth, y * tileHeight, tileWidth, tileHeight, i)

		x = x + 1
	end
end