local Cartridge = require("cartridge")

local loadedCart = nil
local font = nil

function love.load()

	font = love.graphics.newFont("assets/PixelifySans.ttf")
	love.graphics.setFont(font)

	love.graphics.setDefaultFilter("nearest", "nearest")

	if loadedCart ~= nil then
		loadedCart:load()
	end

end

function love.update(dt)

	if loadedCart ~= nil then
		loadedCart:update(dt)
	end

end

function love.draw()

	if loadedCart ~= nil then
		loadedCart:draw()
	else
		love.graphics.print("Drag 'n Drop file onto the window", 10, 10)
	end

end

function love.filedropped(file)
	file:open("r")  -- using file for reading
	local data = file:read()
	loadedCart = loadstring(data)()
end