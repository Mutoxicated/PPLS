require("/dynamic/ppls/global_variables.lua")
_ENV.pewpew_old = nil
_ENV.fmath_old = nil
ppls = {
    add_structs = function(structs) 
        for k, lib in ipairs(structs) do 
            require("/dynamic/ppls/structures/"..lib)
        end
    end,
    progress = function()
        local callback = pewpew.new_customizable_entity(0fx, 0fx)
        pewpew.entity_set_update_callback(callback, function()
            if pewpew.get_player_configuration(0).has_lost then
                pewpew.stop_game()
            end
            TIME = TIME + 1
            RX,RY = ppls.General.spawn()
            RANGLE = ppls.General.rangle()
            --[[if TIME % 30 == 0 then
                pewpew.print_debug_info()
            end]]
            PX,PY = pewpew.entity_get_position(ppls.General.player_ships[1])
        end)
    end
}
-- adding structures
ppls.add_structs({
    "Amath.lua", "Entity.lua",
    "General.lua", "Mesh.lua"
})
--add your custom entities
ppls.Entity.add_entities({
    "star","cube"
})
-- abbreviations
gfx = ppls.Mesh
ent = ppls.Entity
gen = ppls.General
mat = ppls.Amath
-- add your entity types here!
ent.new_type("STAR")
ent.new_type("CUBE")
-- important
ppls.progress()
--levle graphic
ent.new_entity(WIDTH/2fx,HEIGHT/2fx,{"/dynamic/graphics.lua",0})