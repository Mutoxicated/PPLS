--Entity: entities!
ppls.Entity = {
    CustomEntities = {},
    CustomType = {},
    CustomSpawn = {},

    new_type = function(name)
        local l = #ppls.Entity.CustomType
        local i = l+1
        table.insert(ppls.Entity.CustomType,name)
        ppls.Entity.CustomType[name] = i
    end,

    new_entity = function(x,y,mesh_info,radius,typee)-- in typee, you have to either add the number or ent.CustomType.(insert_type) or nil
        local e = pewpew.new_customizable_entity(x, y)
        pewpew.customizable_entity_set_mesh(e, mesh_info[1], mesh_info[2])
        if radius ~= nil then
            pewpew.entity_set_radius(e, radius)
        end
        if typee ~= nil then
            table.insert(ppls.Entity.CustomEntities,{e,typee})
        end
        return e
    end,

    destroy_entity = function(id,duration,func)
        if not pewpew.entity_get_is_started_to_be_destroyed(id) then
            func() end
        pewpew.customizable_entity_start_exploding(id, duration)
        pewpew.customizable_entity_set_player_collision_callback(id, nil)
        pewpew.customizable_entity_set_weapon_collision_callback(id, nil)
        pewpew.customizable_entity_configure_wall_collision(id,false,nil)
        pewpew.entity_set_update_callback(id, nil)
        for i = 1, #ppls.Entity.CustomEntities do
            if ppls.Entity.CustomEntities[i][1] == id then
                table.remove(ppls.Entity.CustomEntities,i)
                return --have to return to stop the for loop from causing nil index value error
            end
        end
    end,

    get_entity_type = function(id)
        for i = 1, #ppls.Entity.CustomEntities do
            if ppls.Entity.CustomEntities[i][1] == id then
                return ppls.Entity.CustomEntities[i][2]
            end
        end
        return print("Couldn't find the type!")
    end,

    get_entity_count = function(typee)
        local count = 0
        for i = 1, #ppls.Entity.CustomEntities do
            if ppls.Entity.CustomEntities[i][2] == typee then
                count = count + 1
            end
        end
        return count
    end,

    add_entities = function(ents)
        for key,ent in ipairs(ents) do
            require("/dynamic/entities/"..ent.."/code.lua")
        end
    end
}