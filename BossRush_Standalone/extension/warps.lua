function kill_warp()

	if boss_rush == true then
		for i=1,#boss_flags do
			local x,y,a,b,c,d,e = unpack(boss_flags[i])
				if single == false then
					if ((bit.band(memory.readbyte(x), y) == y)) then
						warp(a, b, c, d, e)
					end
					if ((bit.band(memory.readbyte(x), y) == y)) then memory.writebyte(x, memory.readbyte(x) - y) end
				elseif single == true then
					if ((bit.band(memory.readbyte(x), y) == y)) then
						res()
						boss_rush = false
					end
				end
		end
	end

end

function chu_fight()
	if bosses.chu == true then
		warp(0x49, 0x00, 0x88, 0xD8-26-5, 1)
		single = true
	end
end
function glee_fight()
	if bosses.glee == true then
		warp(0x51, 0x00, 0xC0, 0xF8, 2)
		single = true
	end
end
function maz_fight()
	if bosses.maz == true then
		warp(0x58, 0x16, 0xB8, 0x96, 1)
		single = true
	end
end
function octo_fight()
	if bosses.octo == true then
		warp(0x60, 0x0E, 0x108, 0x18, 1)
		single = true
	end
end
function gyorg_fight()
	if bosses.gyorg == true then
		warp(0x70, 0x00, 0x1D8, 0xC8, 1)
		single = true
	end
end
function vaati_fight()
	if bosses.vaati == true then
		warp(0x88, 0x06, 0xA8, 0x88, 1)
		single = true
	end
end

function boss_rush_start_warp()
	if boss_rush == true then			
		if warped == false then
			warped = true
			if bosses.all == true then
			warp(0x49, 0x00, 0x88, 0xD8-26-5, 1)
			end
			chu_fight()
			glee_fight()
			maz_fight()
			octo_fight()
			gyorg_fight()
			vaati_fight()
		end
	end
end

