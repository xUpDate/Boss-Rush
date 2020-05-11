function bottles()
	if boss_rush == true then
		if full_inventory == true then
				if boss_rush_items == false then
						addFlag(0x02002B32, 0x55) -- Items
						addFlag(0x02002B33, 0x51)
						addFlag(0x02002B34, 0x55)	
						addFlag(0x02002B35, 0x55)
						addFlag(0x02002B36, 0x54)
						addFlag(0x02002B37, 0x45)
						addFlag(0x02002B39, 0x55)
						addFlag(0x02002B39, 0x55) -- Bottles
						addFlag(0x02002B43, 0x55) -- Grip Ring / Power Bracelets / Flippers / Map of Hyrule
						addFlag(0x02002B44, 0x55) -- Scrolls: Spin Attack / Roll Attack / Dash Attack / Rock Breaker
						addFlag(0x02002B45, 0x55) -- Scrolls: Sword Beam / Great Spin Attack / Downthrust / Peril Beam
						addFlag(0x02002B4E, 0x55) -- Butterflies + Fast Spin Charge
						addFlag(0x02002B4F, 0x05) -- Split Gauge / Longer Spin Attack
						addFlag(0x02002AEE, 0x03) -- Big Bomb Bag
						addFlag(0x02002AEF, 0x03) -- Big Quiver
					mwb(0x02002AF6, 0x28) -- Fairy
					mwb(0x02002AF7, bottle_charm_din) -- Fairy
					mwb(0x02002AF8, bottle_charm_farore) -- Fairy
					mwb(0x02002AF9, bottle_potion_red) -- Fairy
					mwb(0x02002AEC, 99) -- Bomb Count
					mwb(0x02002AED, 99) -- Arrow Count
					boss_rush_items = true
				end
			end
	end
end