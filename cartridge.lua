local Cartridge = {
	spritesheet = nil
}
Cartridge.__index = Cartridge

-- TODO: Change how the cartridge works
-- later
function Cartridge:new(load, update, draw, image)
	local image = image or love.graphics.newImage(
		love.image.newImageData(256, 256))
	local new = setmetatable({}, Cartridge)

	new.load = load
	new.update = update
	new.draw = draw

	new.spritesheet = image

	return new
end

function Cartridge:load()
	return
end

function Cartridge:update(dt)
	return
end

function Cartridge:draw()
	return
end

return Cartridge