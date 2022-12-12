require("/dynamic/ppls/ppls.lua")

meshes = {
    gfx.new_mesh()
}

gfx.add_fading_outlines(meshes[1],{0,0,0},IWIDTH/2,IHEIGHT/2,0,100,9,{255,0},{255,255,255})