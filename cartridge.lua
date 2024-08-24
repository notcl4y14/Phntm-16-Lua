local Cartridge = {}
Cartridge.__index = Cartridge

-- TODO: Change how the cartridge works
-- later
function Cartridge:new(load, update, draw)
	local new = setmetatable({}, Cartridge)

	new.load = load
	new.update = update
	new.draw = draw

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