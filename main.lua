
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
  end


--[[ importation du lib ]]
Resources = require("resources")



--[[ Chargement des ressources ]]
function love.load()
    --[[ init game ]]
   Resources.modules.lib.Load()
   
end


function love.update(dt)

  Resources.modules.lib.update(dt)

  
end


function love.draw()
 
  Resources.modules.lib.draw()

end


function love.keypressed(key, scancode, isrepeat)

  Resources.modules.lib.keypressed(key)

end


function love.keyreleased(key, scancode)
 
  Resources.modules.lib.keyreleased(key)

end


function love.mousepressed(x, y, button, istouch, presses)

  Resources.modules.lib.mousepressed(x, y, button, istouch, presses)

end


function love.mousereleased(x, y, button, istouch, presses)

  Resources.modules.lib.mousereleased(x, y, button, istouch, presses)



end


function love.mousemoved(x, y, dx, dy, istouch)

  Resources.modules.lib.mousemoved(x, y, dx, dy, istouch)

end

function love.wheelmoved(x , y)

  Resources.modules.lib.wheelmoved(x, y)

end



