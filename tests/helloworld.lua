local a = {}

local str = "Hello World!"
local charWidth = 8
local charHeight = 5
local x = 256 / 2 - (#str * charWidth) / 2
local y = 256 / 2 - charHeight

local function getSinY(i)
	local n = i + love.timer.getTime()
	return math.sin(n * 2) * 3
end

local function load()
end

local function update(dt)
end

local function draw()
	local strLength = #str

	for i = 0, strLength do
		local char = string.sub(str, i, i)
		love.graphics.print(char, x + i * charWidth, y + getSinY(i))
	end
end

a.load = load
a.update = update
a.draw = draw

return a