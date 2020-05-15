function subFlag(addr, val)
	if ((bit.band(memory.readbyte(addr), val) == val)) then mwb(addr, memory.readbyte(addr) - val) end
end

function addFlag(addr, val)
	if not ((bit.band(memory.readbyte(addr), val) == val)) then mwb(addr, memory.readbyte(addr) + val) end
end

function boss_flag(x, y, a, b, c, d, e)
	if ((bit.band(memory.readbyte(x), y) == y)) then
		warp(a, b, c, d, e)
	end
end

function warp(area1, room1, x, y, layer)
	mwb(0x03000FD2, 0xF8) -- White Transition
	mwb(0x030010A8, 0x01) -- Initializing Teleport
	mwb(0x030010AC, area1) -- Area
	mwb(0x030010AD, room1) -- Room
	mwb(0x030010AF, 0x00) -- No Cucco
	mw16(0x030010B0, x) -- Coordinates
	mw16(0x030010B2, y) -- Coordinates
	mwb(0x030010B4, layer) -- Layer
end

function condition()
		if boss_rush == true then
			mwb(0x0200AF01, 0xC0) -- Disable Rupees and Keys
			addFlag(0x02002B32, 0x1) -- Spoke To Smith
			addFlag(0x02002D45, 0x1) -- Seen Big Green Chu Cutscene
			mwb(0x02002B47, 0x55) -- Disable Rupee Cutscenes
			mwb(0x02002B48, 0x05) -- Disable Rupee Cutscenes
			mwb(0x02002B49, 0x55) -- Disable Kinstone / Bomb Drop (5) / Arrow Drop (5) / Heart Drop (5) Cutscenes
			mwb(0x02002B4A, 0x55) -- Disable Fairy / Shells / Heart Container / Heart Piece Cutscene
			if mrb(textbox_id) == 0x39 and mrb(area) == 0x8C then vaati2_id = true end
			if mrb(0x03001018) ~= 0 and mrb(area) == 0x8C and vaati2_id == true then warp(137, 1, 136, 100, 1) end
		end
end