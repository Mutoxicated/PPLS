require("/dynamic/ppls/ppls.lua")
pewpew.set_level_size(WIDTH, HEIGHT)

local ship = gen.create_player(SPAWN_X,SPAWN_Y,{frequency = FREQ10, cannon = DOUBLE})
pewpew.configure_player(0, {CAM_DIST = cam_distance, shield = 4})

pewpew.new_asteroid(gen.spawn())

ppls.Entity.STAR(RX,RY,RANGLE,8fx)
ppls.Entity.STAR(RX,RY,RANGLE,8fx)
ppls.Entity.CUBE(RX,RY)
ppls.Entity.CUBE(RX,RY)

pewpew.add_update_callback(function() 
    if TIME % 400 == 0 then 
        pewpew.new_asteroid(RX, RY)
    end
end)