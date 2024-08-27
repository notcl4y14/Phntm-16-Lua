local lovesize = require("lib/lovesize")
local nativefs = require("lib/nativefs")
local Cartridge = require("cartridge")
local loadFolder = require("loader")

loadedCart = nil
local font = nil
local debug = true
local fullscreen = false

function isCartLoaded()
	return loadedCart ~= nil
end

function loadCart(cart, spritesheet)
	loadedCart = Cartridge:new(cart.load, cart.update, cart.draw, spritesheet)
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

	if _btnp[0] > 0 then
		_btnp[0] = _btnp[0] + 1
	elseif _btnp[1] > 0 then
		_btnp[1] = _btnp[1] + 1
	elseif _btnp[2] > 0 then
		_btnp[2] = _btnp[2] + 1
	elseif _btnp[3] > 0 then
		_btnp[3] = _btnp[3] + 1
	elseif _btnp[4] > 0 then
		_btnp[4] = _btnp[4] + 1
	elseif _btnp[5] > 0 then
		_btnp[5] = _btnp[5] + 1
	elseif _btnp[6] > 0 then
		_btnp[6] = _btnp[6] + 1
	elseif _btnp[7] > 0 then
		_btnp[7] = _btnp[7] + 1
	elseif _btnp[8] > 0 then
		_btnp[8] = _btnp[8] + 1
	elseif _btnp[9] > 0 then
		_btnp[9] = _btnp[9] + 1
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
		love.graphics.rectangle("fill", 2, 2, 50, 14)
		love.graphics.setColor(1, 1, 1)
		love.graphics.print("FPS: " .. love.timer.getFPS(), 2, 1)
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

	if key == _buttons[0] then
		_btnp[0] = _btnp[0] + 1
	elseif key == _buttons[1] then
		_btnp[1] = _btnp[1] + 1
	elseif key == _buttons[2] then
		_btnp[2] = _btnp[2] + 1
	elseif key == _buttons[3] then
		_btnp[3] = _btnp[3] + 1
	elseif key == _buttons[4] then
		_btnp[4] = _btnp[4] + 1
	elseif key == _buttons[5] then
		_btnp[5] = _btnp[5] + 1
	elseif key == _buttons[6] then
		_btnp[6] = _btnp[6] + 1
	elseif key == _buttons[7] then
		_btnp[7] = _btnp[7] + 1
	elseif key == _buttons[8] then
		_btnp[8] = _btnp[8] + 1
	elseif key == _buttons[9] then
		_btnp[9] = _btnp[9] + 1
	end
end

function love.keyreleased(key)
	if key == _buttons[0] then
		_btnp[0] = 0
	elseif key == _buttons[1] then
		_btnp[1] = 0
	elseif key == _buttons[2] then
		_btnp[2] = 0
	elseif key == _buttons[3] then
		_btnp[3] = 0
	elseif key == _buttons[4] then
		_btnp[4] = 0
	elseif key == _buttons[5] then
		_btnp[5] = 0
	elseif key == _buttons[6] then
		_btnp[6] = 0
	elseif key == _buttons[7] then
		_btnp[7] = 0
	elseif key == _buttons[8] then
		_btnp[8] = 0
	elseif key == _buttons[9] then
		_btnp[9] = 0
	end
end

function love.filedropped(file)
	local filename = file:getFilename()

	file:open("r")  -- using file for reading
	local data = file:read()
	data = data .. "\nreturn { load=load, update=update, draw=draw }"

	-- https://stackoverflow.com/a/18884539/22146374
	-- https://stackoverflow.com/a/77810559/22146374
	local filenameNoExt = filename:match("(.+)%..+")

	local cartData, err = loadstring(data)
	local spritesheet = nil

	if err then
		print(err)
		return
	end

	cartData = cartData()

	if nativefs.getInfo(filenameNoExt .. ".png") ~= nil then
		local filedata = nativefs.newFileData(filenameNoExt .. ".png")
		spritesheet = love.graphics.newImage(filedata)
		-- print("Spritesheet found!")
	end

	loadCart(cartData, spritesheet)
end

function love.resize(width, height)
	lovesize.resize(width, height)
end