local lovesize = require("lib/lovesize")
local Cartridge = require("cartridge")
local loadFolder = require("loader")

local loadedCart = nil
local font = nil
local fullscreen = false

function isCartLoaded()
	return loadedCart ~= nil
end

function love.load()

	love.graphics.setDefaultFilter("nearest", "nearest")

	font = love.graphics.newFont("assets/PixelifySans.ttf")
	love.graphics.setFont(font)

	lovesize.set(256, 256)

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
		lovesize:begin()

		loadedCart:draw()

		lovesize:finish()
	else
		love.graphics.print("Drag 'n Drop file onto the window", 10, 10)
	end

end

function love.keypressed(key)
	if key == "f11" then
		fullscreen = not fullscreen

		if fullscreen then
			local width, height = love.window.getDesktopDimensions()
			love.window.setMode(width, height, { resizable = false, borderless = true })
			love.resize(width, height)
		else
			love.window.setMode(256, 256, { resizable = true, borderless = false })
			love.resize(256, 256)
		end
	end
end

function love.filedropped(file)
	file:open("r")  -- using file for reading
	local data = file:read()
	data = data .. "\nreturn { load=load, update=update, draw=draw }"
	loadedCart = loadstring(data)()
end

function love.resize(width, height)
	lovesize.resize(width, height)
end