local a = {}

-- local clear = require("../core/clear")
local colors = require("../common/colors")

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
	-- clear(1)
	local strLength = #str

	for i = 0, strLength do
		local char = string.sub(str, i, i)
		love.graphics.setColor(colors[i + 2])
		love.graphics.print(char, x + i * charWidth, y + getSinY(i))
	end
end

a.load = load
a.update = update
a.draw = draw

return a