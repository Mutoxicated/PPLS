require("/dynamic/ppls/global_variables.lua")
--General: player, sound, etc
ppls.General = {
    player_ships = {},

    create_player = function(x,y,weapon_config)
        local ship = pewpew.new_player_ship(x, y, 0)
        pewpew.configure_player_ship_weapon(ship, weapon_config)
        table.insert(ppls.General.player_ships,ship)
        return ship
    end,

    spawn = function()
        local best_length = -1fx
        local best_x = 0fx
        local best_y = 0fx
        local current_x,current_y = fmath.random_fixedpoint(0fx, WIDTH),fmath.random_fixedpoint(0fx, HEIGHT)
        for j = 1, 3 do
          local current_length = 9999fx
          for i = 1, #ppls.General.player_ships do
            local ship_id = ppls.General.player_ships[i]
            if pewpew.entity_get_is_alive(ship_id) then
              local x, y = pewpew.entity_get_position(ship_id)
              local dx = current_x - x
              local dy = current_y - y
              if dx < 0fx then
                dx = -dx
              end
              if dy < 0fx then
                dy = -dy
              end
              local manhattan_length = dx + dy
              if manhattan_length < current_length then
                  current_length = manhattan_length
              end
            else
              ppls.General.player_ships[i] = ppls.General.player_ships[#ppls.General.player_ships]
              table.remove(ppls.General.player_ships, #ppls.General.player_ships)
            end
          end
          if current_length > best_length then
              if current_length > 150fx then
                  return current_x, current_y
              end
              best_x = current_x
              best_y = current_y
              best_length = current_length
          end
        end
        return best_x, best_y
    end,

    rangle = function()
      return fmath.random_fixedpoint(0fx, fmath.tau())
    end,

    split = function(str, pat)
      local t = {}  -- NOTE: use {n = 0} in Lua-5.0
      local fpat = "(.-)" .. pat
      local last_end = 1
      local s, e, cap = str:find(fpat, 1)
      while s do
         if s ~= 1 or cap ~= "" then
            table.insert(t,cap)
         end
         last_end = e+1
         s, e, cap = str:find(fpat, last_end)
      end
      if last_end <= #str then
         cap = str:sub(last_end)
         table.insert(t, cap)
      end
      return t
   end,

    parseSound = function(link)
        local parts = gen.split(link, '%%22')
        local sound = {}
      
        for i = 2, #parts,2 do
          local value = parts[i + 1]:sub(4, -4)
          if parts[i] == 'waveform' then
            value = parts[i + 2]
          end
          if parts[i] == 'amplification' then
            value = value / 100.0
          end
          if value == "true" then
            value = true
          end
          if value == "false" then
            value = false
          end
          sound[parts[i]] = value
        end
        return sound
    end,

    make_color = function(r, g, b, a)
      local color = r * 256 + g
      color = color * 256 + b
      color = color * 256 + a
      return color
    end,

    color_to_string = function(color)
      local s = string.format("%x", color)
      while string.len(s) < 8 do
        s = "0" .. s
      end
      return "#" .. s
    end
}