-----------------------------------------------------------
--
-- MAME Slider Manager
-- Version: 0.1.0-alpha
--
-----------------------------------------------------------

local exports = {}

local function log(message)
    print("[SliderManager] " .. message)
end

function exports.startplugin()

    log("Plugin Loaded")

    if manager
        and manager.machine
        and manager.machine.system then

        log("Game : " .. manager.machine.system.name)

    else

        log("Unable to determine running game.")

    end

end

return exports