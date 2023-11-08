

local luaToJson = {}
local json = require("lib/json")

luaToJson.Convert = function (data,path,name)
    local json = json.encode(data)
    local pathfile = path..name..".json"
    local file = io.open( pathfile , "w")
    file:write(json)
    file:close()
end

return luaToJson