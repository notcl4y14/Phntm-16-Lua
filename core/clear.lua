local colors = require("common/colors")

return function(color)
	local color = color or 0
	local _c = colors[color % 20]
	love.graphics.clear(_c)
end