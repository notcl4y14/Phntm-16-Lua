function rect(x, y, width, height, color)
	love.graphics.setColor(_colors[color or _color])
	love.graphics.rectangle("line", x, y, width, height)
end

function fillrect(x, y, width, height, color)
	love.graphics.setColor(_colors[color or _color])
	love.graphics.rectangle("fill", x, y, width, height)
end

function filltext(text, x, y, color)
	love.graphics.setColor(_colors[color or _color])
	love.graphics.print(text, x, y)
end

function circle(x, y, radius, color)
	love.graphics.setColor(_colors[color or _color])
	love.graphics.circle("line", x, y, radius)
end

function fillcircle(x, y, radius, color)
	love.graphics.setColor(_colors[color or _color])
	love.graphics.circle("fill", x, y, radius)
end

function line(x1, y1, x2, y2, color)
	love.graphics.setColor(_colors[color or _color])
	love.graphics.line(x1, y1, x2, y2)
end

function polygon(vertices, color)
	love.graphics.setColor(_colors[color or _color])
	love.graphics.polygon("line", vertices)
end

function fillpolygon(vertices, color)
	love.graphics.setColor(_colors[color or _color])
	love.graphics.polygon("fill", vertices)
end