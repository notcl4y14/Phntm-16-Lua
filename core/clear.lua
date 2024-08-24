function clear(color)
	local color = color or 0
	local _c = _colors[color % 20]
	love.graphics.clear(_c)
end