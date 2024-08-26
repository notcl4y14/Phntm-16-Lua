_buttons = {
	[0] = "left",
	[1] = "right",
	[2] = "up",
	[3] = "down",
	[4] = "z",
	[5] = "x",
	[6] = "c",
	[7] = "v",
	[8] = "return",
	[9] = "leftshift"
}

_btnp = {
	[0] = 0,
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0,
	[6] = 0,
	[7] = 0,
	[8] = 0,
	[9] = 0,
}

function button(btn)
	return love.keyboard.isDown(_buttons[btn])
end

function buttonp(btn)
	return _btnp[btn] == 2
end