local exports = {}

local function log(msg)
    print("[SliderManager] " .. tostring(msg))
end

local function test(obj, name)
    local ok, value = pcall(function()
        return obj[name]
    end)

    if ok then
        log(name .. " = " .. tostring(value) .. " (" .. type(value) .. ")")
    else
        log(name .. " = <ERROR>")
    end
end

function exports.startplugin()

    emu.add_machine_reset_notifier(function()

        log("Machine ready")

        local ui = manager.ui

        log("===== Direct Member Tests =====")

        test(ui, "sliders")
        test(ui, "slider")
        test(ui, "get_slider_list")
        test(ui, "slider_list")
        test(ui, "menu")
        test(ui, "menus")
        test(ui, "handler")
        test(ui, "handlers")

    end)

end

return exports