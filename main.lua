local Cartridge = require("cartridge")

local cart = Cartridge:new(
	-- load()
	function()
	end,

	-- update(dt)
	function(dt)
	end,

	-- draw()
	function()
		love.graphics.print("Hello World!", 10, 10)
	end
)

function love.load()
	cart:load()
end

function love.update(dt)
	cart:update(dt)
end

function love.draw()
	cart:draw()
end