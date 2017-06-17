json = require "json"

gl.setup(1920, 1080)

util.resource_loader{
    "OpenSans-Regular.ttf"
}
local font = resource.load_font("OpenSans-Regular.ttf")


function wrap(str, limit, indent, indent1)
    limit = limit or 72
    local here = 1
    local wrapped = str:gsub("(%s+)()(%S+)()", function(sp, st, word, fi)
        if fi-here > limit then
            here = st
            return "\n"..word
        end
    end)
    local splitted = {}
    for token in string.gmatch(wrapped, "[^\n]+") do
        splitted[#splitted + 1] = token
    end
    return splitted
end



util.file_watch("NextdayMeals.json", function(content)
	meals = json.decode(content)
	for idx, meal in ipairs(meals) do


	end
end)


function node.render()
    gl.clear(0,0,0,1)
    font:write(20, 20, "Mensaplan", 128, 1,1,1,1)
    for idx, meal in ipairs(meals) do
    	font:write(20, 96 * (1+idx), meal.name, 32, 1,1,1,1)
    	font:write(20, 96 * (1+idx) + 32, wrap(meal.name,35)[1], 32, 1,1,1,1)
    	font:write(20, 96 * (1+idx) + 64, wrap(meal.name,35)[2], 32, 1,1,1,1)
    end
end