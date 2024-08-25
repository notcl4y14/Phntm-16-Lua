local lovesize = require("lib/lovesize")
local Cartridge = require("cartridge")
local loadFolder = require("loader")

local loadedCart = nil
local font = nil
local debug = true
local fullscreen = false

function isCartLoaded()
	return loadedCart ~= nil
end

function loadCart(cart)
	loadedCart = cart
	loadedCart:load()
end

function love.load()

	love.graphics.setDefaultFilter("nearest", "nearest")

	font = love.graphics.newFont("assets/PixelifySans.ttf")
	love.graphics.setFont(font)

	lovesize.set(256, 256)

	loadFolder("common")()
	loadFolder("core")()

end

function love.update(dt)

	if love.keyboard.isDown("tab") then
		dt = 10
	else
		dt = 1
	end

	if isCartLoaded() then
		loadedCart.update(dt)
	end

end

function love.draw()

	if isCartLoaded() then
		lovesize:begin()

		loadedCart:draw()

		lovesize:finish()
	else
		love.graphics.print("No cart loaded", 0, 0)
		love.graphics.print("Drag 'n Drop file onto the window", 0, 10)
	end

	if debug then
		love.graphics.setColor(0, 0, 0, 0.5)
		love.graphics.rectangle("fill", 10, 10, 50, 20)
		love.graphics.setColor(1, 1, 1)
		love.graphics.print("FPS: " .. love.timer.getFPS(), 12, 12)
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
	local cartData = loadstring(data)()
	loadCart(cartData)
end

function love.resize(width, height)
	lovesize.resize(width, height)
end