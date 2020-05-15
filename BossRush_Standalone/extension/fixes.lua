maz_fix = false
v1_fix = false
octo_manip = false

function mazaal_fix()
	if boss_rush == true then
		if mrb(area) == 0x58 then
			if maz_fix == false then
				if mr16(0x02002C9E) ~= 0xEFBC then 
					mw16(0x02002C9E, 0xEFBC) -- Mazaal Hands Fix / + Ezlo
					mwb(0x030010D9, 0x5A)
					maz_fix = true
				end
			end
		end
	end
end

function vaati_fix()
	if boss_rush == true then
		if mrb(area) == 0x88 then
			if v1_fix == false then
				mwb(0x02002DC2, bit.bor(mrb(0x02002DC2), 0x80)) -- Makes Vaati Show Up In Room
				addFlag(0x02002C9E, 0x20) -- Vaati Safety (Not Disappearing)
				v1_fix = true
			end
		end
	end
end

function octo_manip_fix()
	if mrb(area) == 0x60 and octo_manip == false then
		mw32(rng, 0xB0B00C6B)
		octo_manip = true
	end
end