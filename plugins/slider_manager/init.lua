-----------------------------------------------------------
--
-- MAME Slider Manager
-- Version: 0.1.2-alpha
--
-----------------------------------------------------------

local exports = {}

local found = false

local function log(msg)
    print("[SliderManager] " .. msg)
end

function exports.startplugin()

    emu.add_machine_frame_notifier(function()

        if found then
            return
        end

        if manager.machine == nil then
            return
        end

        found = true

        log("Machine ready")
        log("ROM: " .. manager.machine.system.name)

        local cpu = manager.machine.devices[":ppc1"]

        if cpu == nil then
            log("Couldn't find :ppc1")
            return
        end

        log("ppc1 found")
        log("ppc1 type: " .. type(cpu))

        log("Inspecting parameters...")

local ok, params = pcall(function()
    return cpu.parameter
end)

log("parameter exists: " .. tostring(ok))
log("parameter type: " .. type(params))

if ok and params then
    local mt = getmetatable(params)

    if mt then
        log("===== parameter metatable =====")

        for k,v in pairs(mt) do
            log("  " .. tostring(k))
        end
    end
end

        if not mt then
            log("No metatable")
            return
        end

        log("===== ppc1 metatable =====")

        for k, v in pairs(mt) do
            log("  " .. tostring(k))
        end

    end)

end

return exports