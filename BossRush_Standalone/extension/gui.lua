function choice(y_pos, y, boss_object, boss_name)
			gui.drawEllipse(3,y+3+(y_pos), 6,6, "white", 0x85363fe3) -- Green Chu
				if boss_object then gui.drawEllipse(3,y+3+(y_pos), 6,6, "white", 0xB003fc0f) end
				gui.pixelText(10,y+3+(y_pos), boss_name, 0xE0FFFFFF, 0x00FFFFFF)
end

function boxes()
	
	if boss_rush == false and memory.readbyte(0x03001002) == 0x02 then
	gui.drawBox(1,150, 23, 158, "white", 0x85363fe3)
	gui.pixelText(2,151, "Start", 0xE0FFFFFF, 0x00FFFFFF)
	
	gui.drawBox(25,150, 55, 158, "white", 0x85363fe3)
	gui.pixelText(26,151, "Options", 0xE0FFFFFF, 0x00FFFFFF)
	
		if options == true then
			gui.drawBox(1,1, 67, 148, "white", 0x85363fe3)
			
			-- Full Inventory
			gui.drawBox(3,3, 8,8, "white", 0x85363fe3)	
			gui.pixelText(10,3, "Full Inventory", 0xE0FFFFFF, 0x00FFFFFF)
			if modes.full_inventory == true then gui.drawBox(4,4, 7,7, 0x8003fc0f, 0x8003fc0f) end
			-- Vanilla Items
			gui.drawBox(3,10, 8,15, "white", 0x85363fe3)
			gui.pixelText(10,10, "Vanilla Items", 0xE0FFFFFF, 0x00FFFFFF)
			if modes.vanilla_items == true then gui.drawBox(4,11, 7,14, 0x8003fc0f, 0x8003fc0f) end
			
			choice(7*4, 1, bosses.chu, "Big Green Chu")
			choice(7*5, 2, bosses.glee, "Gleerok")
			choice(7*6, 3, bosses.maz, "Mazaal")
			choice(7*7, 4, bosses.octo, "Big Octorok")
			choice(7*8, 5, bosses.gyorg, "Gyorg Pair")
			choice(7*9, 6, bosses.vaati, "Vaati")
			
		end
	elseif boss_rush == true then
		gui.drawBox(211,150, 238, 158, "white", 0x85363fe3)
		gui.pixelText(213,151, "Cancel", 0xE0FFFFFF, 0x00FFFFFF)	
	end
end