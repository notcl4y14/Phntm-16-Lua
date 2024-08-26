local t = 0
local centerX = 128 - 128 / 2
local centerY = 128 - 128 / 2
local width = 128

function getX()
	return centerX * 2 - getWidth() / 2
end

function getWidth()
	return math.sin(t / 100) * width
end

local function load()
end

local function update(dt)
	t = t + 1 * dt
end

local function draw()
	clear(0)
	spr(0, 10, 10)
	spr(0, getX(), centerY, getWidth(), 128)
end