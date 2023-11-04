


--[[ variable  ]]
local listGameState = {"menu", "game", "pause", "gameOver"}
local gameState =   listGameState[1]
local lib = {}

function lib.Load ()
    --[[ init window ]]
Resources.modules.windowManager.load()
--[[ init map ]]
Resources.modules.map.load("map_test","map_test_tileset.png")
--[[ init camera ]]
Resources.modules.camera.init()

--[[ init menu ]]
Resources.modules.menuManager.load()
--[[gameManager]]
Resources.modules.gameManager.load()


end

function lib.update(dt)
    --[[ update window ]]
    Resources.modules.windowManager.update(dt)
    --[[ update camera ]]
    Resources.modules.camera.update(dt)
    --[[ update map ]]
    Resources.modules.map.update(dt)
    --[[ update menu ]]
    Resources.modules.menuManager.update(dt)

    --[[ update gameManager ]]
    Resources.modules.gameManager.update(dt)

end


function lib.draw()
   
    Resources.modules.windowManager.drawStart()   
    Resources.modules.map.draw()
   
    Resources.modules.gameManager.draw()
    Resources.modules.windowManager.drawEnd()
    --[[ draw menu and ui ]]
    Resources.modules.menuManager.draw()
end


function lib.keypressed(key)
    Resources.modules.menuManager.keypressed(key)
    Resources.modules.gameManager.keypressed(key)
end


function lib.keyreleased(key)
   
    Resources.modules.windowManager.keypressed(key)
    Resources.modules.gameManager.keyreleased(key)
end

function lib.mousepressed(x, y, button)
    Resources.modules.menuManager.mousepressed(x, y, button)
    Resources.modules.gameManager.mousepressed(x, y, button)
end

function lib.mousereleased(x, y, button)
    Resources.modules.menuManager.mousereleased(x, y, button)
    Resources.modules.gameManager.mousereleased(x, y, button)
end

function lib.wheelmoved(x, y)
    Resources.modules.menuManager.wheelmoved(x, y)
  
end

function lib.mousemoved(x, y, dx, dy)
    Resources.modules.menuManager.mousemoved(x, y, dx, dy)
    Resources.modules.gameManager.mousemoved(x, y, dx, dy)
end
   

return lib