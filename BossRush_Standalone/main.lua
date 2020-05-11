require('socket.core')

require("libraries\\boss_kill_variables")
require("libraries\\tmc_library")

require("modes\\full_inventory")
require("modes\\vanilla_items")

require("extension\\gui")
require("extension\\mouse")
require("extension\\warps")
require("extension\\added_functions")
require("extension\\fixes")
require("extension\\time")

require("times\\chu_time")

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