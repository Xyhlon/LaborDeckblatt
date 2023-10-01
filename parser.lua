require("lualibs.lua")
local inspect = require("inspect")

local function getJsonFromFile(file)
	local fileHandle = io.open(file, "r")
	local jsonData = nil
	if fileHandle then
		local jsonString = fileHandle:read("*a")
		jsonData = utilities.json.tolua(jsonString)
		fileHandle:close()
	end
	-- tex.print(" " .. jsonString .. "")
	-- tex.print(tostring(inspect(jsonData)))
	-- tex.print(tostring(jsonData == nil))
	return jsonData
end

function printAuthors(file)
	local json = getJsonFromFile(file)
	-- tex.print(tostring(inspect(json)))
	if json then
		-- tex.print(tostring(inspect(json)))
		-- tex.print("hey hey")
		-- for author in json do
		-- 	tex.print(tostring(inspect(author)))
		for key, value in pairs(json) do
			-- tex.print(key)
			tex.print(
				"{{\\bfseries Name:} "
					.. value["vorname"]
					.. " {\\scshape "
					.. value["nachname"]
					.. "}\\par} & & & {{\\bfseries Mat. Nr:} "
					.. value["matNumb"]
					.. "\\par} &  & \\\\"
			)
		end
		-- end
	end
end
