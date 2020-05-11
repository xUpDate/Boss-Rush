chu_mins = 0
chu_secs = 0
chu_ms = 0

glee_mins = 0
glee_secs = 0
glee_ms = 0

maz_mins = 0
maz_secs = 0
maz_ms = 0

octo_mins = 0
octo_secs = 0
octo_ms = 0

gyorg_mins = 0
gyorg_secs = 0
gyorg_ms = 0
NL = "\n"

function boss_times()
if ((bit.band(memory.readbyte(0x02002C9C), 0x4) == 0x4)) then
	chu_mins = mins
	chu_secs = secs
	chu_ms = ms
end
if ((bit.band(memory.readbyte(0x02002C9C), 0x8) == 0x8)) then
	glee_mins = mins
	glee_secs = secs
	glee_ms = ms
end
if ((bit.band(memory.readbyte(0x02002D72), 0x2) == 0x2)) then
	maz_mins = mins
	maz_secs = secs
	maz_ms = ms
end
if ((bit.band(memory.readbyte(0x02002C9C), 0x20) == 0x20)) then
	octo_mins = mins
	octo_secs = secs
	octo_ms = ms
end
if ((bit.band(memory.readbyte(0x02002C9C), 0x40) == 0x40)) then
	gyorg_mins = mins
	gyorg_secs = secs
	gyorg_ms = ms
end

if mrb(0x03001002) == 0x4 then
	gui.drawBox(0-1,0-1, 285, 43, 0x80000000, 0x80000000)
	gui.drawBox(0-1,2, 285, 7, 0x703deb34, 0x703deb34)
	gui.drawBox(0-1,8, 285, 15, 0x7eb4f34, 0x70eb4f34)
	gui.drawBox(0-1,16, 285, 21, 0x7eebba34, 0x70ebba34)
	gui.drawBox(0-1,23, 285, 28, 0x7e34e8eb, 0x7034e8eb)
	gui.drawBox(0-1,30, 285, 35, 0x7e9d1fad, 0x709d1fad)
	gui.drawBox(0-1,37, 285, 42, 0x7e000000, 0x70000000)
	gui.pixelText(2,2, 
	 "Big Green Chu: " .. chu_mins .. ":" .. chu_secs .. ":" .. chu_ms .. NL
	 .. "Gleerok: " .. glee_mins .. ":" .. glee_secs .. ":" .. glee_ms .. NL 
	 .. "Mazaal: " .. maz_mins .. ":" .. maz_secs .. ":" .. maz_ms .. NL 
	 .. "Big Octorok: " .. octo_mins .. ":" .. octo_secs .. ":" .. octo_ms .. NL 
	 .. "Gyorg Pair: " .. gyorg_mins .. ":" .. gyorg_secs .. ":" .. gyorg_ms .. NL 
	 .. "Vaati: " .. end_time_mins .. ":" .. end_time_secs .. ":" .. end_time_ms, "white", 0x00eb4f34)
end

end