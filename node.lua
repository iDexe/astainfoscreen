gl.setup(1920, 1080)

util.resource_loader{
    "OpenSans-Regular.ttf"
}
local font = resource.load_font("OpenSans-Regular.ttf")

function node.render()
    gl.clear(0,0,0,1)
    font:write(250, 300, "Communism will win!!", 128, 1,1,1,1)
end
