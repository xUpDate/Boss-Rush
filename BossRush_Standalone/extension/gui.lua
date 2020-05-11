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
			if full_inventory == true then gui.drawBox(4,4, 7,7, 0x8003fc0f, 0x8003fc0f) end
			-- Vanilla Items
			gui.drawBox(3,10, 8,15, "white", 0x85363fe3)
			gui.pixelText(10,10, "Vanilla Items", 0xE0FFFFFF, 0x00FFFFFF)
			if vanilla_items == true then gui.drawBox(4,11, 7,14, 0x8003fc0f, 0x8003fc0f) end
			
		end
	elseif boss_rush == true then
		gui.drawBox(211,150, 238, 158, "white", 0x85363fe3)
		gui.pixelText(213,151, "Cancel", 0xE0FFFFFF, 0x00FFFFFF)	
	end
end