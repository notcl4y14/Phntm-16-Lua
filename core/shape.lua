function rect(x, y, width, height, color)
	love.graphics.setColor(_colors[color])
	love.graphics.rectangle("line", x, y, width, height)
end

function fillrect(x, y, width, height, color)
	love.graphics.setColor(_colors[color])
	love.graphics.rectangle("fill", x, y, width, height)
end

function filltext(text, x, y, color)
	love.graphics.setColor(_colors[color])
	love.graphics.print(text, x, y)
end