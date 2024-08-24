local Cartridge = require("cartridge")
local loadFolder = require("loader")

local loadedCart = nil
local font = nil

function isCartLoaded()
	return loadedCart ~= nil
end

function love.load()

	font = love.graphics.newFont("assets/PixelifySans.ttf")
	love.graphics.setFont(font)

	love.graphics.setDefaultFilter("nearest", "nearest")

	loadFolder("common")()
	loadFolder("core")()

	if isCartLoaded() then
		loadedCart:load()
	end

end

function love.update(dt)

	if isCartLoaded() then
		loadedCart:update(dt)
	end

end

function love.draw()

	if isCartLoaded() then
		loadedCart:draw()
	else
		love.graphics.print("Drag 'n Drop file onto the window", 10, 10)
	end

end

function love.filedropped(file)
	file:open("r")  -- using file for reading
	local data = file:read()
	data = data .. "\nreturn { load=load, update=update, draw=draw }"
	loadedCart = loadstring(data)()
end