
BackgroundManager = {}


-- private variables
local backgroundImg
local backgroundMusicPlaying = false
local backgroundMusicSound = nil


--- Charge une image de fond et une musique de fond.
-- @param bkgImg L'image de fond.
-- @param music La musique de fond.
function BackgroundManager.load(bkgImg , music)

        local config = Resources.data.config

        if bkgImg ~= nil then
                      
            backgroundImg = bkgImg

        end
        
        if music ~= nil then
            backgroundMusicSound = music
        end
        
        print("BackgroundManager.load()")

   
end

--- Met à jour le gestionnaire de fond.
function BackgroundManager.update(dt)

    if backgroundMusicSound ~= nil then
        backgroundMusicPlaying = backgroundMusicSound:isPlaying()
    end


end
--- Joue la musique de fond.
function BackgroundManager.playMusic()
    
    if backgroundMusicSound ~= nil then
        if backgroundMusicPlaying == false then
            backgroundMusicSound:play()
        end
    end

end

---Dessine l'image de fond.
function BackgroundManager.draw()
    
    if backgroundImg ~= nil then
        --[[ define scale by game size ]]
      local  w,h =love.graphics.getDimensions()
      local  sw = w/ backgroundImg:getWidth()
      local  sh = h/ backgroundImg:getHeight()
        love.graphics.draw(backgroundImg,0,0,0,sw,sh)
    end
    
  
end

---Stop la musique de fond.
function BackgroundManager.stopMusic()
    if backgroundMusicSound ~= nil then
        backgroundMusicSound:stop()
    end
end


--- Décharge l'image de fond et la musique de fond.
function BackgroundManager.unload()
    backgroundImg = nil
    backgroundMusicPlaying = false
    backgroundMusicSound = nil
end

return BackgroundManager