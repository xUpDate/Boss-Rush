function kill_warp()

	if boss_rush == true then
		for i=1,#boss_flags do
			local x,y,a,b,c,d,e = unpack(boss_flags[i])
				if ((bit.band(memory.readbyte(x), y) == y)) then
					warp(a, b, c, d, e)
				end
				if ((bit.band(memory.readbyte(x), y) == y)) then memory.writebyte(x, memory.readbyte(x) - y) end
		end
	end

end

function boss_rush_start_warp()
	if boss_rush == true then			
		if warped == false then
			warped = true
			warp(0x49, 0x00, 0x88, 0xD8-26-5, 1)
		end
	end
end