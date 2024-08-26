local x = 0
local y = 0
local tw = 16
local th = 16

local btn_left = 0
local btn_right = 1
local btn_up = 2
local btn_down = 3

local function load()
end

local function update(dt)
	-- Change all buttonp-s with button-s :P

	if buttonp(btn_left) then
		x = x - tw
	elseif buttonp(btn_right) then
		x = x + tw
	end

	if buttonp(btn_up) then
		y = y - th
	elseif buttonp(btn_down) then
		y = y + th
	end
end

local function draw()
	clear(0)
	fillrect(x, y, tw, th, 1)
end