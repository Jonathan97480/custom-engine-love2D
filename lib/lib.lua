


--[[ variable  ]]
local listGameState = {"menu", "game", "pause", "gameOver"}
local gameState =   listGameState[1]
local lib = {}

function lib.Load ()

    --[[ init window ]]
Resources.modules.windowManager.load()

--[[ init camera ]]
Resources.modules.camera.init()

--[[gameManager]]
Resources.modules.gameManager.load()

--[[ load levels manager  ]]
Resources.modules.levelsManager.load()


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

    --[[ update background ]]
    Resources.modules.BackgroundManager.update(dt)

end


function lib.draw()
    local screenCanvas = love.graphics.newCanvas( Resources.data.config.window.width, Resources.data.config.window.height)
    

       --[[ draw background ]]
       Resources.modules.BackgroundManager.draw()
    Resources.modules.windowManager.drawStart()   

    --[[ draw map ]]
    Resources.modules.map.draw()
    --[[ draw game ]]
    Resources.modules.gameManager.draw()
    --[[ draw end ]]
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