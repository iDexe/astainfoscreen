json = require "json"

gl.setup(1920, 1080)

util.resource_loader{
    "OpenSans-Regular.ttf"
}
local font = resource.load_font("OpenSans-Regular.ttf")


util.file_watch("NextdayMeals.json", function(content)
	meals = json.decode(content)
	for idx, meal in ipairs(meals) do


	end
end)


function node.render()
    gl.clear(0,0,0,1)
    font:write(20, 20, "Mensaplan", 64, 1,1,1,1)
    for idx, meal in ipairs(meals) do
    	font:write(20, 64 * (1+idx), meal.name, 64, 1,1,1,1)
    end
end