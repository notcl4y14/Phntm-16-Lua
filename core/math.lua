function random(min, max)
	if max == nil then
		return love.math.random() * min
	elseif min == nil and max == nil then
		return love.math.random()
	end

	return love.math.random() * (max - min) + min
end