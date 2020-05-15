function res()
	mwb(0x03001003, 0x0)
	mwb(0x03001002, 0x1)
end

function handle_radio(x1, x2, y1, y2, name_true, option_table)
	if mouse["X"] >= x1 and mouse["X"] <= x2 and mouse["Y"] >= y1 and mouse["Y"] <= y2 then
		local previous = option_table[name_true] 
		for name, _ in pairs(option_table) do
			option_table[name]=false
		end
			option_table[name_true]=not previous
			
	end
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
						vaati2_id = false
						timer_write = false
						mw16(0x02002C9E, 0xEFBC) -- Mazaal Hands Fix / + Ezlo
						mwb(0x030010D9, 0x5A)
					elseif mouse["X"] >= 25 and mouse["X"] <= 55 then
						options = not options
					end
				end
				
			if options == true then
				handle_radio(3,8,3,8, "full_inventory", modes)
				handle_radio(3,8,10,15, "vanilla_items",modes)
				
				handle_radio(3,8,8*4, 8*4+5, "chu", bosses)
				handle_radio(3,8,8*5, 8*5+5, "glee", bosses)
				handle_radio(3,8,8*6, 8*6+5, "maz", bosses)
				handle_radio(3,8,8*7, 8*7+5, "octo", bosses)
				handle_radio(3,8,8*8, 8*8+5, "gyorg", bosses)
				handle_radio(3,8,8*9, 8*9+5, "vaati", bosses)
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