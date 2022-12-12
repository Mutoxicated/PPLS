function ppls.Entity.CUBE(x,y)
    RX,RY = gen.spawn()
    local id = ent.new_entity(x,y,{ENT_PATH.."cube/mesh.lua",0},16fx,ent.CustomType.CUBE)
    pewpew.customizable_entity_set_position_interpolation(id, true)
    local HP = 17
    local ex,ey = 0fx,0fx
    local ov,ov2,ov3 = 0,0,0
    pewpew.entity_set_update_callback(id, function() 
        ex,ey = pewpew.entity_get_position(id)
        local dx, dy = PX - ex, PY - ey
        local length = fmath.sqrt((dx * dx) + (dy * dy))
        local distance = fmath.sqrt((dx*dx)+(dy*dy))
        local max_distance = fmath.sqrt((WIDTH*WIDTH)+(HEIGHT*HEIGHT))

        ov = mat.remap(1fx,max_distance,1fx,255fx,distance)
        ov2 = mat.remap(1fx,max_distance,255fx,1fx,distance)
        ov3 = mat.remap(1fx,max_distance,60fx,190fx,distance)
        
        pewpew.customizable_entity_set_mesh_color(id, gen.make_color(fmath.to_int(ov),fmath.to_int(ov2),fmath.to_int(ov3),255))
        pewpew.customizable_entity_add_rotation_to_mesh(id, 0.409fx, 1fx, 0fx, 0fx)
    end)
    pewpew.customizable_entity_set_weapon_collision_callback(id, function(entity_id, player_index, weapon_type) 
        if weapon_type == BULLET then
            if HP == 0 then
                ent.destroy_entity(id,0,function()
                    pewpew.play_sound(ENT_PATH.."cube/sfx.lua", 0, ex, ey)
                    pewpew.increase_score_of_player(player_index, 100)
                    pewpew.create_explosion(ex, ey, gen.make_color(fmath.to_int(ov),fmath.to_int(ov2),fmath.to_int(ov3),255), 1fx, 50)
                end)
            else
                pewpew.increase_score_of_player(player_index, 10)
                HP = HP - 1
                return true
            end
        end
    end)
end