function subFlag(addr, val)
	if ((bit.band(memory.readbyte(addr), val) == val)) then memory.writebyte(addr, memory.readbyte(addr) - val) end
end

function addFlag(addr, val)
	if not ((bit.band(memory.readbyte(addr), val) == val)) then memory.writebyte(addr, memory.readbyte(addr) + val) end
end

function boss_flag(x, y, a, b, c, d, e)
	if ((bit.band(memory.readbyte(x), y) == y)) then
		warp(a, b, c, d, e)
	end
end

function warp(area, room, x, y, layer)
	memory.writebyte(0x03000FD2, 0xF8) -- White Transition
	memory.writebyte(0x030010A8, 0x01) -- Initializing Teleport
	memory.writebyte(0x030010AC, area) -- Area
	memory.writebyte(0x030010AD, room) -- Room
	memory.writebyte(0x030010AF, 0x00) -- No Cucco
	memory.write_u16_le(0x030010B0, x) -- Coordinates
	memory.write_u16_le(0x030010B2, y) -- Coordinates
	memory.writebyte(0x030010B4, layer) -- Layer
end

function condition()
		if boss_rush == true then
			memory.writebyte(0x0200AF01, 0xC0) -- Disable Rupees and Keys
			addFlag(0x02002B32, 0x1) -- Spoke To Smith
			addFlag(0x02002D45, 0x1) -- Seen Big Green Chu Cutscene
			memory.writebyte(0x02002B47, 0x55) -- Disable Rupee Cutscenes
			memory.writebyte(0x02002B48, 0x05) -- Disable Rupee Cutscenes
			memory.writebyte(0x02002B49, 0x55) -- Disable Kinstone / Bomb Drop (5) / Arrow Drop (5) / Heart Drop (5) Cutscenes
			memory.writebyte(0x02002B4A, 0x55) -- Disable Fairy / Shells / Heart Container / Heart Piece Cutscene
		end
end