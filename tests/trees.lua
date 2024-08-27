local woodWidth = 12
local woodHeight = 128
local woodColor = 11
local woodShadowColor = 9

local leavesColor = { [0] = 12, [1] = 13 }
local leavesAmount = 5
local leafRadius = 25
local leafDistance = 25

local windSpeed = 0
local windSpeedMax = 10
local windSpeedVelocity = 0
local windSpeedChangeTime = 0
local windSpeedChangeTimer = 100

local trees = {}
local treesAmount = 5

local function addTree(x, y, scale)
	table.insert(trees, { [0] = x, [1] = y, [2] = scale })
end

local function drawLeaves(x, y)
	for i = 0, leavesAmount do
		fillcircle(
			x + math.sin(i) * leafDistance + windSpeed,
			y + math.cos(i) * leafDistance,
			leafRadius,
			leavesColor[i % 2]
		)
	end
end

local function drawTree(x, y)
	fillrect(x - woodWidth, y - woodHeight, woodWidth * 2, woodHeight, woodColor)
	fillrect(x - woodWidth, y - woodHeight, woodWidth * 2, woodHeight / 2, woodShadowColor)
	drawLeaves(x, y - woodHeight)
end

local function load()
	local lastY = 0
	for i = 0, treesAmount do
		local x = math.floor(random(0, 256))
		local y = math.floor(random(lastY, lastY + 40))
		local scale = random(0.5, 1)

		if y < 128 then
			y = 128
		end

		lastY = y

		addTree(x, y, scale)
	end
end

local function update(dt)
	windSpeed = windSpeed + windSpeedVelocity

	-- print(windSpeed)

	if windSpeed > windSpeedMax then
		windSpeed = windSpeedMax
	end

	if windSpeed < -windSpeedMax then
		windSpeed = -windSpeedMax
	end

	if windSpeedChangeTime < windSpeedChangeTimer then
		windSpeedChangeTime = windSpeedChangeTime + 1
	else
		windSpeedChangeTime = 0
		windSpeedVelocity = random(-1, 1)
	end
end

local function draw()
	clear(19)
	-- fillpolygon({100,100, 200,100, 150,200}, 1)
	fillrect(0, 128, 256, 128, 12)

	-- drawTree(128, 128 + 128 / 2)
	
	for _, tree in pairs(trees) do
		push()
		-- scale(tree[2], tree[2])

		drawTree(tree[0], tree[1])

		pop()
	end
end