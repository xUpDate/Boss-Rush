time_static = socket.gettime()

end_time_hours = 0
end_time_mins = 0
end_time_secs = 0
end_time_ms = 0
time_switch = false
time_start = false


function boss_rush_time()
if boss_rush == true then
	if mrb(area) == 0x49 then
		if time_reset == false then
			time_static = socket.gettime()
			time_reset = true
		end
		time_start = true 
	end
end



if time_start == true then
if boss_rush == true then

time_current = socket.gettime() - time_static

    hours = string.format("%02.f", math.floor((time_current)/3600))
    mins = string.format("%02.f", math.floor((time_current)/60 - (hours*60)))
    secs = string.format("%02.f", math.floor((time_current) - hours*3600 - mins *60))
    msecs = string.format("%02.f",math.floor(((time_current) - hours*3600 - mins *60 - secs)*1000))
	ms = string.format("%02d", msecs/10)
	
	if time_switch == false then
		gui.pixelText(1,152, "Time: " .. mins .. ":" .. secs .. ":" .. ms)
	elseif time_switch == true then
		--gui.pixelText(1,152, "Time: " .. end_time_mins .. ":" .. end_time_secs .. ":" .. end_time_ms)
	 end

	
	if mrb(0x0300184C) == 144 and mrb(0x0300184D) == 61 then
		if mrb(area) == 0x8B then
				if time_switch == false then
					end_time_hours = hours
					end_time_mins = mins
					end_time_secs = secs
					end_time_ms = ms
					time_switch = true
				end
		end
	end
	
end
end

end