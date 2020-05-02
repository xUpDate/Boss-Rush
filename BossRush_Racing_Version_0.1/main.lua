require("seed")

local bossrush = false
-- OptionBox Variables
local options = false
local optionswitch = false
local cancelswitch = false
-- Settings Variables
local fullint = true
local vanilla = false
-- Mode Variables
local normal = true
local full = false
-- Flag Variables
local flags = 0
local buttonstart = false

-- Fairy Variables
local fairy = true

-- RNG Variable 1
local rngvalue = 0

-- Timer
local texttimer = 0
local timerswitch = false


function kill()
	if memory.readbyte(0x03000BF4) == 0x49 then memory.writebyte(0x02002C9C, 0x4)
	elseif memory.readbyte(0x03000BF4) == 0x51 then memory.writebyte(0x02002C9C, 0x8)
	elseif memory.readbyte(0x03000BF4) == 0x58 then memory.writebyte(0x02002D72, 0x2)
	elseif memory.readbyte(0x03000BF4) == 0x60 then memory.writebyte(0x02002C9C, 0x20)
	elseif memory.readbyte(0x03000BF4) == 0x71 then memory.writebyte(0x02002C9C, 0x40)
	end
end

function subFlag(addr, val)
	if ((bit.band(memory.readbyte(addr), val) == val)) then memory.writebyte(addr, memory.readbyte(addr) - val) end
end
function addFlag(addr, val)
	if not ((bit.band(memory.readbyte(addr), val) == val)) then memory.writebyte(addr, memory.readbyte(addr) + val) end
end
function switchsword(val1, val2)
	if memory.readbyte(0x02002AF4) == val1 then memory.writebyte(0x02002AF4, val2) end
	if memory.readbyte(0x02002AF5) == val1 then memory.writebyte(0x02002AF5, val2) end
end

function killaction(bossAddr, val1, transitionAddr, transitionVal, warpArea, warpRoom, x , y , layer, heartsAddr, healthAddr, healthVal)
if ((bit.band(memory.readbyte(bossAddr), val1) == val1)) then 
								memory.writebyte(transitionAddr, transitionVal) -- White Transition
								warp(warpArea, warpRoom, x, y, layer) 
									if vanilla == true then
										memory.writebyte(heartsAddr, healthVal)
										memory.writebyte(healthAddr, healthVal)
									end
								memory.writebyte(bossAddr, memory.readbyte(bossAddr) - val1) end
end

function warp(area, room, x, y, layer)
	memory.writebyte(0x030010A8, 0x01) -- Initializing Teleport
	memory.writebyte(0x030010AC, area) -- Area
	memory.writebyte(0x030010AD, room) -- Room
	memory.writebyte(0x030010AF, 0x00) -- No Cucco
	memory.write_u16_le(0x030010B0, x) -- Coordinates
	memory.write_u16_le(0x030010B2, y) -- Coordinates
	memory.writebyte(0x030010B4, layer) -- Layer
end
	function res()
		joypad.set({A=1})
		joypad.set({B=1})
		joypad.set({Start=1})
		joypad.set({Select=1})
	end

local rngswitch = false
local rnglock = false



while true do
local randomrng = math.random(0x7FFFFFFF)

--gui.text(2,2, randomrng)
-- mousebInput
	mouseb = input.getmouse()
if not mouseb["Left"] then optionswitch = false end
if not mouseb["Left"] then rngswitch = false end

if bossrush == true then
if memory.readbyte(0x03000BF4) == 0x60 then
memory.write_u32_le(0x03001150, rngseed)
end
if memory.readbyte(0x03000BF4) == 0x58 then
memory.write_u32_le(0x03001150, rngseed)
end
if memory.readbyte(0x03000BF4) == 0x49 then
memory.write_u32_le(0x03001150, rngseed)
end
end



if bossrush == false and memory.readbyte(0x03001002) == 0x02 then

-- Start Button
	gui.drawBox(1,150, 23, 158, "white", 0x85363fe3)
	gui.pixelText(2,151, "Start", 0xE0FFFFFF, 0x00FFFFFF)
	
-- Options Button
	gui.drawBox(25,150, 55, 158, "white", 0x85363fe3)
	gui.pixelText(26,151, "Options", 0xE0FFFFFF, 0x00FFFFFF)
	
-- RNG Stuff Button
	gui.drawBox(32+25,150, 72+55, 158, "white", 0x85363fe3)
	gui.pixelText(32+26,151, "Generate RNG Seed", 0xE0FFFFFF, 0x00FFFFFF)
-- RNG Display
	gui.drawBox(12+32+25,140, 72+55, 148, "white", 0x85363fe3)
	gui.pixelText(12+12+32+26,141, string.upper(string.format("%08x", rngvalue)), 0xE0FFFFFF, 0x00FFFFFF)
-- Lock RNG	
	--gui.drawBox(48+32+25,140, 72+55, 148, "white", 0x85363fe3)
	--gui.pixelText(50+32+26,141, "Lock" , 0xE0FFFFFF, 0x00FFFFFF)
	
	gui.drawBox(52+20+32+25,140, 36+72+55, 158, "white", 0x85363fe3)
	gui.pixelText(52+20+32+26,141, "RNG:", 0xE0FFFFFF, 0x00FFFFFF)
	gui.pixelText(52+20+32+26,151, string.upper(string.format("%08x", rngseed)), 0xE0FFFFFF, 0x00FFFFFF)
	
	gui.drawBox(36+52+20+32+25,140, 30+36+72+55, 158, "white", 0x85363fe3)
	gui.pixelText(41+52+20+32+26,146, "Save", 0xE0FFFFFF, 0x00FFFFFF)	
	
if mouseb["Left"] and rngswitch == false then
	if mouseb["X"] >= 32+25 and mouseb["X"] <= 72+55 and mouseb["Y"] >= 150 and mouseb["Y"] <= 158 then
	rngvalue = randomrng
	rngswitch = true
	end
end

if mouseb["Left"] and rngswitch == false then
	if mouseb["X"] >= 48+32+25 and mouseb["X"] <= 72+55 and mouseb["Y"] >= 140 and mouseb["Y"] <= 148 then
	rnglock = true
	rngswitch = true
	end
end

if mouseb["Left"] and rngswitch == false then
	if mouseb["X"] >= 36+52+20+32+25 and mouseb["X"] <= 30+36+72+55 and mouseb["Y"] >= 140 and mouseb["Y"] <= 158 then
				file = io.open("seed.lua","w")
				file:write("rngseed =  0x" .. string.upper(string.format("%08x", rngvalue)))
				file:close()
				timerswitch = true
				
	rngswitch = true
	end
end
	if timerswitch == true then
		texttimer = texttimer + 1
		end
	if texttimer > 80 then
		texttimer = 0
		timerswitch = false
	end

	if texttimer > 0 then 
	gui.pixelText(52+20+32+26,132, "Seed has been saved!", 0xE0FFFFFF)	
	end

-- mouseb Box Clicks
----- Start
	if mouseb["X"] >= 1 and mouseb["X"] <= 23 and mouseb["Y"] >= 150 and mouseb["Y"] <= 158 and mouseb["Left"] then
		fairy = true
		bossrush = true
		flags = 1
			-- Initiating Teleport (Normal Mode / Green Chu)
			if normal == true then 
				warp(0x49, 0x00, 0x88, 0xD8-26-5, 1)
					if fullint == true then 										
						memory.writebyte(0x02002AEB, 0xA0) -- Hearts
						memory.writebyte(0x02002AEA, 0xA0) -- Health
						memory.writebyte(0x02002B39, 0x55) -- Bottles
						memory.writebyte(0x02002AF6, 0x28) -- Fairy
						memory.writebyte(0x02002AEC, 99) -- Bomb Count
						memory.writebyte(0x02002AED, 99) -- Arrow Count
						memory.writebyte(0x02002AF4, 0)
						memory.writebyte(0x02002AF5, 0)
					end
					if vanilla == true then
						memory.writebyte(0x02002AEB, 0x18) -- Hearts
						memory.writebyte(0x02002AEA, 0x18) -- Health
						memory.writebyte(0x02002B39, 0x55) -- Bottles
						memory.writebyte(0x02002AF6, 0x28) -- Fairy
						memory.writebyte(0x02002AF4, 0)
						memory.writebyte(0x02002AF5, 0)
						
						
						-- Safety if "fullint" was played before
							memory.writebyte(0x02002B32, 0x00) -- Spoke to Smith / Smiths Sword / Green Sword / Red Sword
							memory.writebyte(0x02002B33, 0x00) -- Blue Sword / Four Sword / Bombs
							memory.writebyte(0x02002B34, 0x00) -- Remote Bombs / Bow / Light Arrows / Boomerang
							memory.writebyte(0x02002B35, 0x00) -- Magical Boomerang / Shield / Mirror Shield / Lantern
							memory.writebyte(0x02002B36, 0x00) -- Gust Jar / Cane of Pacci / Mole Mitts
							memory.writebyte(0x02002B37, 0x00) -- Rocs Cape / Pegasus Boots / Ocarina
							memory.writebyte(0x02002B43, 0x00) -- Grip Ring / Power Bracelets / Flippers / Map of Hyrule
							memory.writebyte(0x02002B44, 0x00) -- Scrolls: Spin Attack / Roll Attack / Dash Attack / Rock Breaker
							memory.writebyte(0x02002B45, 0x00) -- Scrolls: Sword Beam / Great Spin Attack / Downthrust / Peril Beam
							memory.writebyte(0x02002B4E, 0x00) -- Butterflies + Fast Spin Charge
							memory.writebyte(0x02002B4F, 0x00) -- Split Gauge / Longer Spin Attack
							memory.writebyte(0x02002AEE, 0x00) -- Big Bomb Bag
							memory.writebyte(0x02002AEF, 0x00) -- Big Quiver
					end
			end
	end
----- Options
	
	if mouseb["X"] >= 25 and mouseb["X"] <= 55 and mouseb["Y"] >= 150 and mouseb["Y"] <= 158 and mouseb["Left"] 
		and optionswitch == false and options == false then 
			options = true
			optionswitch = true
	elseif mouseb["X"] >= 25 and mouseb["X"] <= 55 and mouseb["Y"] >= 150 and mouseb["Y"] <= 158 and mouseb["Left"] 
		and optionswitch == false and options == true then 
			options = false
			optionswitch = true
	end
	
	if options == true then 
		memory.writebyte(0x0200AF01, 0x10) 
		else memory.writebyte(0x0200AF01, 0x0)
	end
-- Options Window
	if options == true then 
		
	
		-- Visuals / Boxes
		gui.drawBox(1,1, 67, 148, "white", 0x85363fe3)
			-- Option Settings
				-- Full Inventory
					gui.drawBox(3,3, 8,8, "white", 0x85363fe3)
						if fullint == true then gui.drawBox(4,4, 7,7, 0x8003fc0f, 0x8003fc0f) end
					gui.pixelText(10,3, "Full Inventory", 0xE0FFFFFF, 0x00FFFFFF)
				-- Vanilla Items
					gui.drawBox(3,10, 8,15, "white", 0x85363fe3)
						if vanilla == true then gui.drawBox(4,11, 7,14, 0x8003fc0f, 0x8003fc0f) end
					gui.pixelText(10,10, "Vanilla Items", 0xE0FFFFFF, 0x00FFFFFF)
					
			-- Mode Settings
				-- Normal
					gui.drawBox(3,24, 8,29, "white", 0x85363fe3)
						-- Green Box (Normal Mode)
						if normal == true then gui.drawBox(4,25, 7,28, 0x8003fc0f, 0x8003fc0f) end
					gui.pixelText(10,24, "Normal", 0xE0FFFFFF, 0x00FFFFFF)
				-- Full
					--gui.drawBox(3,31, 8,36, "white", 0x85363fe3)
						-- Green Box (Full Mode)
						if full == true then gui.drawBox(4,32, 7,35, 0x8003fc0f, 0x8003fc0f) end
					--gui.pixelText(10,31, "Full", 0xE0FFFFFF, 0x00FFFFFF)
		
		
		
		-- Click / Switch Mechanic
			-- Settings
			if mouseb["X"] >= 3 and mouseb["X"] <= 8 and mouseb["Y"] >= 3 and mouseb["Y"] <= 8 and mouseb["Left"] then
				fullint = true
				vanilla = false
			elseif mouseb["X"] >= 3 and mouseb["X"] <= 8 and mouseb["Y"] >= 10 and mouseb["Y"] <= 15 and mouseb["Left"] then
				vanilla = true
				fullint = false
			end
			-- Mode
			--[[if mouseb["X"] >= 3 and mouseb["X"] <= 8 and mouseb["Y"] >= 24 and mouseb["Y"] <= 29 and mouseb["Left"] then
				normal = true
				full = false
			elseif mouseb["X"] >= 3 and mouseb["X"] <= 8 and mouseb["Y"] >= 31 and mouseb["Y"] <= 36 and mouseb["Left"] then
				full = true
				normal = false
			end]]
				
	end
end
	
	-- Flag Reset
		if flags == 1 then 
					-- Helpful QoL Disables
							addFlag(0x02002B32, 0x1) -- Spoke To Smith
							addFlag(0x02002D45, 0x1) -- Seen Big Green Chu Cutscene
							memory.writebyte(0x02002B47, 0x55) -- Disable Rupee Cutscenes
							memory.writebyte(0x02002B48, 0x05) -- Disable Rupee Cutscenes
							memory.writebyte(0x02002B49, 0x55) -- Disable Kinstone / Bomb Drop (5) / Arrow Drop (5) / Heart Drop (5) Cutscenes
							memory.writebyte(0x02002B4A, 0x55) -- Disable Fairy / Shells / Heart Container / Heart Piece Cutscene
				if normal == true then
					-- Disabling Endbosses
							subFlag(0x02002C9C, 0x04)  -- Big Green Chu
							subFlag(0x02002C9C, 0x08)  -- Gleerok
							subFlag(0x02002D72, 0x02)  -- Mazaal
							subFlag(0x02002C9C, 0x20)  -- Big Octorok
							subFlag(0x02002C9C, 0x40)  -- Gyorg Pair
	
					-- Additional Disables / Fixes
							subFlag(0x02002DAB, 0x08)  -- Disabling Vortex (Gyorg Pair)
							if memory.read_u16_le(0x02002C9E) ~= 0xEFBC then memory.write_u16_le(0x02002C9E, 0xEFBC) end -- Mazaal Hands Fix / + Ezlo
							memory.writebyte(0x030010D9, 0x5A)
				end
			flags = 0
		end
	
	-- Bossrush Mechanics (Warps, Inventory, etc)
	if bossrush == true then
		memory.writebyte(0x0200AF01, 0xC0) -- Disable Rupees and Keys
			if normal == true then 
				-- Warp After Big Green Chu
							if ((bit.band(memory.readbyte(0x02002C9C), 0x4) == 0x4)) then
								if vanilla == true then
										memory.writebyte(0x02002B44, 0x1) -- Scrolls: Spin Attack
										memory.writebyte(0x02002CD4, 0x10) -- Spin Attack Fix
								end
							end
							killaction(0x02002C9C, 0x04, 0x03000FD2, 0xF8, 0x51, 0x00, 0xC0, 0xF8, 2, 0x02002AEB, 0x02002AEA, 0x20)
				-- Warp After Gleerok
							if ((bit.band(memory.readbyte(0x02002C9C), 0x08) == 0x08)) then 
								memory.writebyte(0x03000FD2, 0xF8) -- White Transition
								warp(0x58, 0x16, 0xB8, 0x96, 1) 
									if vanilla == true then
										memory.writebyte(0x02002AEB, 0x28)
										memory.writebyte(0x02002AEA, 0x28)
									end
									if vanilla == true then
										memory.writebyte(0x02002B4F, 0x01) -- Split Gauge
										switchsword(0x1, 0x3) -- Switch Sword
										memory.writebyte(0x02002AEC, 30) -- Bomb Count
										memory.writebyte(0x02002AED, 30) -- Arrow Count
									end
								memory.writebyte(0x02002C9C, memory.readbyte(0x02002C9C) - 0x08) end
				-- Warp After Mazaal
							if ((bit.band(memory.readbyte(0x02002D72), 0x02) == 0x02)) then 
								memory.writebyte(0x03000FD2, 0xF8) -- White Transition
								warp(0x60, 0x0E, 0x108, 0x18, 1) 
								memory.writebyte(0x02002D72, memory.readbyte(0x02002D72) - 0x02) end
				-- Warp After Big Octorok
							--killaction(0x02002C9C, 0x20, 0x03000FD2, 0xF8, 0x70, 0x00, 0x1D8, 0xC8, 1, 0x02002AEB, 0x02002AEA, 0x30)
							if ((bit.band(memory.readbyte(0x02002C9C), 0x20) == 0x20)) then
								memory.writebyte(0x03000FD2, 0xF8) -- White Transition
								warp(0x70, 0x00, 0x1D8, 0xC8, 1)
									if vanilla == true then
										memory.writebyte(0x02002AEB, 0x30)
										memory.writebyte(0x02002AEA, 0x30)
										switchsword(0x3, 0x4) -- Switch Sword
									end
								memory.writebyte(0x02002C9C, memory.readbyte(0x02002C9C) - 0x20) end
				-- Warp After Gyorg Pair
							if ((bit.band(memory.readbyte(0x02002C9C), 0x40) == 0x40)) then
								memory.writebyte(0x03000FD2, 0xF8) -- White Transition
								warp(0x88, 0x06, 0xA8, 0x88, 1) 
									if vanilla == true then
										memory.writebyte(0x02002AEB, 0x38)
										memory.writebyte(0x02002AEA, 0x38)
										switchsword(0x4, 0x6) -- Switch Sword
									end
								memory.writebyte(0x02002DC2, bit.bor(memory.readbyte(0x02002DC2), 0x80)) -- Makes Vaati Show Up In Room
								addFlag(0x02002C9E, 0x20) -- Vaati Safety (Not Disappearing)
								memory.writebyte(0x02002C9C, memory.readbyte(0x02002C9C) - 0x40) end
				-- Warp After Vaati 2
							if memory.readbyte(0x020227A8) == 0x39 and memory.readbyte(0x03000BF4) == 0x8C then warp(137, 1, 136, 100, 1) end
								
									if fullint == true and vanilla == false then 
										memory.writebyte(0x02002B32, 0x55) -- Spoke to Smith / Smiths Sword / Green Sword / Red Sword
										memory.writebyte(0x02002B33, 0x51) -- Blue Sword / Four Sword / Bombs
										memory.writebyte(0x02002B34, 0x55) -- Remote Bombs / Bow / Light Arrows / Boomerang
										memory.writebyte(0x02002B35, 0x55) -- Magical Boomerang / Shield / Mirror Shield / Lantern
										memory.writebyte(0x02002B36, 0x54) -- Gust Jar / Cane of Pacci / Mole Mitts
										memory.writebyte(0x02002B37, 0x45) -- Rocs Cape / Pegasus Boots / Ocarina
										memory.writebyte(0x02002B43, 0x55) -- Grip Ring / Power Bracelets / Flippers / Map of Hyrule
										memory.writebyte(0x02002B44, 0x55) -- Scrolls: Spin Attack / Roll Attack / Dash Attack / Rock Breaker
										memory.writebyte(0x02002B45, 0x55) -- Scrolls: Sword Beam / Great Spin Attack / Downthrust / Peril Beam
										memory.writebyte(0x02002B4E, 0x55) -- Butterflies + Fast Spin Charge
										memory.writebyte(0x02002B4F, 0x05) -- Split Gauge / Longer Spin Attack
										memory.writebyte(0x02002AEE, 0x03) -- Big Bomb Bag
										memory.writebyte(0x02002AEF, 0x03) -- Big Quiver
									end
									if vanilla == true and fullint == false then
										if memory.readbyte(0x03000BF4) == 0x49 then
											memory.writebyte(0x02002B32, 0x05) -- Spoke to Smith / Smiths Sword
											memory.writebyte(0x02002B35, 0x04) --  Shield
											memory.writebyte(0x02002B36, 0x04) --  Gust Jar
										elseif memory.readbyte(0x03000BF4) == 0x51 then
											addFlag(0x02002B36, 0x10)
											memory.writebyte(0x02002AEE, 0x01) -- Bomb Bag
											memory.writebyte(0x02002AEC, 30) -- Bomb Count
										elseif memory.readbyte(0x03000BF4) == 0x58 then
											addFlag(0x02002B32, 0x40)
											addFlag(0x02002B36, 0x40)
											addFlag(0x02002B37, 0x4)
											addFlag(0x02002B34, 0x4)
											--memory.writebyte(0x02002B36, 0x01) -- Bomb Bag
										elseif memory.readbyte(0x03000BF4) == 0x60 then
											addFlag(0x02002B35, 0x1)
											addFlag(0x02002B35, 0x40)
											addFlag(0x02002B37, 0x40)
											--memory.writebyte(0x02002B36, 0x01) -- Bomb Bag
										elseif memory.readbyte(0x03000BF4) == 0x71 then
											addFlag(0x02002B33, 0x1)
											addFlag(0x02002B37, 0x1)
											--memory.writebyte(0x02002B36, 0x01) -- Bomb Bag
										elseif memory.readbyte(0x03000BF4) == 0x88 then
											addFlag(0x02002B33, 0x10)
											--memory.writebyte(0x02002B36, 0x01) -- Bomb Bag
										end	
									end
			end

	--gui.drawBox(211,150, 238, 158, "white", 0x85363fe3)
	--gui.pixelText(213,151, "Cancel", 0xE0FFFFFF, 0x00FFFFFF)
	end
	
	resetbutton = joypad.get(0)
-- End / Cancel Mechanics
	-- If no hearts + empty bottle
	
	if bossrush == true then
		if fairy == true then
		if memory.readbyte(0x02002AEA) == 0 and memory.readbyte(0x02002AF6) ~= 0x28 then 
				memory.writebyte(0x03000FD2, 0xF8) -- White Transition
				memory.writebyte(0x030010AF, 0x00) -- No Cucco
				memory.writebyte(0x030010A8, 0x01) -- Initializing Teleport
				fairy = false
		end
		end
	end

	emu.frameadvance()
end