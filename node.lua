json = require "json"

gl.setup(1920, 1080)

util.resource_loader{
    "OpenSans-Regular.ttf"
}
local font = resource.load_font("OpenSans-Regular.ttf")

function node.render()
    gl.clear(0,0,0,1)
    font:write(250, 300, "Test", 128, 1,1,1,1)
end

util.file_watch("NextdayMeals.json", function(content)
	meals = json.decode(content)
	for idx, meal in ipairs(meals) do
		

	end
end)