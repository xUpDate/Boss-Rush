function res()
	mwb(0x03001003, 0x0)
	mwb(0x03001002, 0x1)
end

function mouse_input()
mouse = input.getmouse()

	if not mouse["Left"] then mouse_switch = false end
	
if memory.readbyte(0x03001002) == 0x02 or memory.readbyte(0x03001002) == 0x04 then
	if mouse["Left"] and mouse_switch == false then
		mouse_switch = true
			if boss_rush == false then
				if mouse["Y"] >= 150 and mouse["Y"] <= 158 then
					if mouse["X"] >= 1 and mouse["X"] <= 23 then
						subFlag(0x02002DAB, 0x08)
						mwb(max_health, 0xA0)
						mwb(current_health, 0xA0)
						boss_rush = not boss_rush
						boss_rush_items = false
						time_start = false
						time_reset = false
						time_switch = false
						octo_manip = false
						maz_fix = false
						v1_fix = false
					elseif mouse["X"] >= 25 and mouse["X"] <= 55 then
						options = not options
					end
				end
				
			if options == true then 
				if mouse["X"] >= 3 and mouse["X"] <= 8 and mouse["Y"] >= 3 and mouse["Y"] <= 8 then
					full_inventory = true
					vanilla_items = false
				elseif mouse["X"] >= 3 and mouse["X"] <= 8 and mouse["Y"] >= 10 and mouse["Y"] <= 15 and mouse["Left"] then
				--vanilla_items = true
				--full_inventory = false
				end
			end
		elseif boss_rush == true then
			if mouse["X"] >= 211 and mouse["X"] <= 238 and mouse["Y"] >= 150 and mouse["Y"] <= 158 then
				boss_rush = false
				res()
				mouse_switch = true
				warped = false
			end		
		end
	end
end

end