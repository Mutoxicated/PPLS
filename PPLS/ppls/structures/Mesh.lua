--Mesh: advanced meshes & helper
ppls.Mesh = {

  new_mesh = function()--returns an empty mesh
      local mesh = {}
      mesh.vertexes = {}
      mesh.segments = {}
      mesh.colors = {}
      return mesh
  end,

  add_line_to_mesh = function(mesh, vertexes, colors, close_loop)
      local vertex_count = #mesh.vertexes
      local color_count = #mesh.colors
      local segment_count = #mesh.segments
      local number_of_new_segments = #vertexes - 1
      local segments = {}
    
      for i = 1, #vertexes do
        table.insert(mesh.vertexes, vertexes[i])
        table.insert(mesh.colors, colors[i])
      end
    
      table.insert(segments, vertex_count)
      for i = 1, number_of_new_segments do
        table.insert(segments, vertex_count + i)
      end
      if close_loop then
        table.insert(segments, vertex_count)
      end
      table.insert(mesh.segments, segments)
  end,

  add_poly1 = function(mesh, center, sides, radius, startangle, color)
      if sides > 2 then
        local x = center[1]
        local y = center[2]
        local z = center[3]
        local vertices = {} 
        local colors = {}
    
        for i = 1, sides do
          local angle = (math.pi * 2 * i)/sides + startangle
          table.insert(vertices, {x + radius * math.cos(angle),y + radius * math.sin(angle), z})
          table.insert(colors, color)
        end
    
        ppls.Mesh.add_line_to_mesh(mesh, vertices, colors ,true)
      end
  end,

  add_poly2 = function(mesh, center, sides, radius, height, startangle, color)
      if sides > 2 then
        local x = center[1]
        local y = center[2]
        local z = center[3]
        local vertices = {} -- 1st face
        local vertices2 = {} -- 2nd face
        local colors = {} -- colors for 1st face
        local colors2 = {} -- colors for 2nd face
    
        for i = 1, sides do
          local angle = (math.pi * 2 * i)/sides + startangle
          table.insert(vertices, {x + radius * math.cos(angle),y + radius * math.sin(angle), z + height})
          table.insert(vertices2, {x + radius * math.cos(angle),y + radius * math.sin(angle), z - height})
          table.insert(colors, color[1])
          table.insert(colors2, color[2])
        end
    
        ppls.Mesh.add_line_to_mesh(mesh, vertices, colors ,true)
        ppls.Mesh.add_line_to_mesh(mesh, vertices2, colors2 ,true)
        for i = 1, sides do
          ppls.Mesh.add_line_to_mesh(mesh, {vertices[i], vertices2[i]}, {color[1],color[2]})
        end
      end
  end,

  add_star = function(mesh, center, radius, startangle, color)
      local x = center[1]
      local y = center[2]
      local z = center[3]
      local colors = {}
      local vertices = {}
      for i = 1, 5 do
        local angle = (2*math.pi/5)*i*2+startangle
        local xchange = math.cos(angle)
        local ychange = math.sin(angle)
        table.insert(vertices,{x + xchange*radius, y + ychange*radius, z})
        table.insert(colors,color)
      end
      ppls.Mesh.add_line_to_mesh(mesh, vertices, colors, true)
  end,

  add_cube = function(mesh, center, side_length, color)
      local half = side_length / 2
      local x = center[1]
      local y = center[2]
      local z = center[3]
    
      local a = {x - half, y - half, z - half}
      local b = {x - half, y + half, z - half}
      local c = {x + half, y + half, z - half}
      local d = {x + half, y - half, z - half}
      local e = {x - half, y - half, z + half}
      local f = {x - half, y + half, z + half}
      local g = {x + half, y + half, z + half}
      local h = {x + half, y - half, z + half}
    
      ppls.Mesh.add_line_to_mesh(mesh, {a, b, c, d}, {color, color, color, color}, true)
      ppls.Mesh.add_line_to_mesh(mesh, {e, f, g, h}, {color, color, color, color}, true)
      
      ppls.Mesh.add_line_to_mesh(mesh, {a, e}, {color, color})
      ppls.Mesh.add_line_to_mesh(mesh, {b, f}, {color, color})
      ppls.Mesh.add_line_to_mesh(mesh, {c, g}, {color, color})
      ppls.Mesh.add_line_to_mesh(mesh, {d, h}, {color, color})
  end,

  add_rectangle = function(mesh,center,x_radius,y_radius,color)
      local x = center[1]
      local y = center[2]
      local z = center[3]
      
      local a = {x-x_radius,y-y_radius,z}
      local b = {x+x_radius,y-y_radius,z}
      local c = {x+x_radius,y+y_radius,z}
      local d = {x-x_radius,y+y_radius,z}
  
      ppls.Mesh.add_line_to_mesh(mesh, {a,b,c,d},{color,color,color,color},true)
  end,

  add_grid = function(mesh,x,y,color)
    -- a lil explanation on x and y:
    -- x = {start of x, end of x, x incrementation}
    -- y = {start of y, end of y, y incrementation}
    local vertices = {}
    local max = #mesh.vertexes
    local seg = {}
    local x_times = 0
    local y_times = 0
    local tablee = 0
    for i = y[1], y[2], y[3] do
      for i2 = x[1],x[2],x[3] do
        table.insert(vertices,{i2,i})
      end
    end
    for i = y[1], y[2], y[3] do
      y_times = y_times + 1
      table.insert(seg,{})
    end
    for i = x[1], x[2], x[3] do
      x_times = x_times + 1
      table.insert(seg,{})
    end
    for i = max,(#vertices-1)+max do
      if i % x_times == 0 then
        tablee = tablee + 1
      end
      table.insert(seg[tablee],i)
    end
    for i = max, (x_times-1)+max do
      tablee = tablee + 1
      for i2 = i, (#vertices-1)+max, x_times do
        table.insert(seg[tablee],i2)
      end
    end
    for i = 1, #vertices do
      if color ~= nil then table.insert(mesh.colors,color) end
      table.insert(mesh.vertexes,vertices[i]) 
    end
    for i = 0, #seg do
      table.insert(mesh.segments,seg[i])
    end
  end,

  add_fading_outlines = function(mesh,center,xradius,yradius,zstart,zend,amount,alpha,color)
    local x,y,z = center[1],center[2],center[3]
    local r,g,b = color[1],color[2],color[3]
    local a = alpha[1]
    local distance = zend-zstart
    local inc = distance//amount
    for i = zstart, zend-inc, inc do
      local c_distance = zend-i
      local percent = (a-alpha[2])-(c_distance / distance * (a-alpha[2]))
      gfx.add_rectangle(mesh,{x,y,i},xradius,yradius,gen.make_color(r,g,b,a-percent))
    end
  end
}