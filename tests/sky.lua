local x = 0
local width = 256 / 10
local clouds = {}
local cloudWidth = 80
local cloudHeight = 20

-- Cloud
local function newCloud(x, y, parallax)
	return { x, y, parallax, false }
end

local function drawCloud(x, y, width, height)
	fillrect(x - 4, y + 4, width, height, 4)
	fillrect(x, y, width, height, 1)
end

-- Main
local function load()
	-- table.insert(clouds, { 20, 20, 10 })
	-- table.insert(clouds, { 80, 50, 5 })
	
	-- Spawn 8 clouds on random positions
	for i = 1, 8 do
		local parallax = love.math.random() * 10 + 5
		local x = love.math.random() * (256 * parallax) - cloudWidth
		local y = love.math.random() * 256 - cloudHeight
		table.insert(clouds, newCloud(x, y, parallax))
	end
end

local function update(dt)
	-- Sky
	x = x + 1 * dt

	if x >= width then
		x = -width
	end

	-- Clouds
	for i, cloud in pairs(clouds) do
		cloud[1] = cloud[1] + 1 * dt

		local x = cloud[1]
		local parallax = cloud[3]
		local crossedBorder = cloud[4]
		
		-- Check if half of the cloud crosses the border
		if not crossedBorder and x / parallax + cloudWidth / 2 > 256 then
			cloud[4] = true

			-- Create a new cloud
			local parallax = love.math.random() * 10 + 5
			local x = 0 - cloudWidth * parallax
			local y = love.math.random() * 256 - cloudHeight
			table.insert(clouds, newCloud(x, y, parallax))
		end

		-- Check if the cloud is out of bounds
		if cloud[1] / cloud[3] > 256 then
			table.remove(clouds, i)
		end
	end
end

local function draw()
	clear(19)

	-- Draw Sky
	for i = 0, 10 do
		love.graphics.push()
		love.graphics.translate(-width * 10, 0)
		love.graphics.shear(1, 0)

		fillrect(x + i * (width * 2), 0, width, 256, 18)

		love.graphics.pop()
	end

	-- Draw Clouds
	for i = 1, #clouds do
		local x = clouds[i][1]
		local y = clouds[i][2]
		local parallax = clouds[i][3]
		drawCloud(x / parallax, y, cloudWidth, cloudHeight)
	end

	-- fillrect(16, 24, 80, 20, 4)
	-- fillrect(20, 20, 80, 20, 1)

	-- drawCloud(20 / x, 20, 80, 20)

	-- drawCloud((i + 20) / 10, 20, 80, 20)
end