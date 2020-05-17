require('socket.core')

dofile("libraries\\boss_kill_variables.lua")
dofile("libraries\\tmc_library.lua")

dofile("modes\\full_inventory.lua")
dofile("modes\\vanilla_items.lua")

dofile("extension\\gui.lua")
dofile("extension\\mouse.lua")
dofile("extension\\warps.lua")
dofile("extension\\added_functions.lua")
dofile("extension\\fixes.lua")
dofile("extension\\time.lua")

dofile("times\\chu_time.lua")

while true do
mouse_input()

boxes()
boss_times()
boss_rush_time()
kill_warp()
mazaal_fix()
octo_manip_fix()
vaati_fix()
boss_rush_start_warp()
condition()
bottles()





emu.frameadvance()
end