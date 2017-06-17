json = require "json"

gl.setup(1920, 1080)

util.resource_loader{
    "OpenSans-Regular.ttf"
}
local font = resource.load_font("OpenSans-Regular.ttf")


function wrap(str, limit, indent, indent1)
  indent = indent or ""
  indent1 = indent1 or indent
  limit = limit or 72
  local here = 1-#indent1
  return indent1..str:gsub("(%s+)()(%S+)()",
                          function(sp, st, word, fi)
                            if fi-here > limit then
                              here = st - #indent
                              return "\n"..indent..word
                            end
                          end)
end



util.file_watch("NextdayMeals.json", function(content)
	meals = json.decode(content)
	for idx, meal in ipairs(meals) do
		meal.name = wrap(meal.name,35)

	end
end)


function node.render()
    gl.clear(0,0,0,1)
    font:write(20, 20, "Mensaplan", 128, 1,1,1,1)
    for idx, meal in ipairs(meals) do
    	font:write(20, 96 * (1+idx), meal.name, 32, 1,1,1,1)
    	idx2 = 1
    	for line in meal.name:gmatch("[^\r\n]+") do
    		font:write(20, 96 * (1+idx) + 32 * idx2, line, 32, 1,1,1,1)
    		idx2 = idx2 + 1
    	end
    end
end