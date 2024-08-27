local function indexToPos(index, width, height)
	return {
		[0] = index % width,
		[1] = math.floor(index / height)
	}
end

function push()
	love.graphics.push()
end

function pop()
	love.graphics.pop()
end

function shear(x, y)
	love.graphics.shear(x, y)
end

function scale(x, y)
	love.graphics.scale(x, y)
end

function translate(x, y)
	love.graphics.translate(x, y)
end

function color(color)
	_color = _colors[color]
end

function spr(i, x, y, w, h)
	local w = w or 16
	local h = h or 16
	local pos = indexToPos(i, 256, 256)
	-- TODO: Make quads storeable
	local quad = love.graphics.newQuad(pos[0], pos[1], 16, 16, 256, 256)
	love.graphics.draw(loadedCart.spritesheet, quad, x, y, 0, w / 16, h / 16)
end