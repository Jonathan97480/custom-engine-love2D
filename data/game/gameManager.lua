local player = require ("data/game/player")

local gameManager ={}


gameManager.load = function()
    
        player.load()
end


gameManager.update = function(dt)
    player.update(dt)
 
end


gameManager.draw = function()
   
    player.draw()
end


gameManager.keypressed = function(key)

end


gameManager.keyreleased = function(key)

end


gameManager.mousepressed = function(x,y,button)

end


gameManager.mousereleased = function(x,y,button)

end


gameManager.mousemoved = function(x,y,dx,dy)

end


gameManager.wheelmoved = function(x,y)

end














return gameManager