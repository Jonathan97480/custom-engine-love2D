
local curentLevel = 1

local levelsManager = {}

--- Charge le niveau courant.
levelsManager.load = function()

    levelsManager.levels = require("data/game/files/levels")

    if levelsManager.levels == nil then
        print("Error: levelsManager.levels is nil")
        return
    end

    if levelsManager.levels[curentLevel] == nil then
        print("Error: levelsManager.levels[curentLevel] is nil")
        return
    end

    if levelsManager.levels[curentLevel].map~= nil then
        local map = levelsManager.levels[curentLevel].map
        levelsManager.levels[curentLevel].map = Resources.modules.map.load(map.name,map.tileSet)
       
    end

    if levelsManager.levels[curentLevel].backgroundImg~= nil then
        local backgroundImg = levelsManager.levels[curentLevel].backgroundImg
        levelsManager.levels[curentLevel].backgroundImg = Resources.loadImage(backgroundImg)
    end   

    if levelsManager.levels[curentLevel].backgroundMusic~= nil then
        local backgroundMusic = levelsManager.levels[curentLevel].backgroundMusic
        levelsManager.levels[curentLevel].backgroundMusic = Resources.loadSound(backgroundMusic,"music")
    end

    if levelsManager.levels[curentLevel].backgroundImg ~=nil or levelsManager.levels[curentLevel].backgroundMusic~=nil then
        Resources.modules.BackgroundManager.load(levelsManager.levels[curentLevel].backgroundImg,levelsManager.levels[curentLevel].backgroundMusic)
    end

    if levelsManager.levels[curentLevel].curentMenu~= nil then
        local curentMenu = levelsManager.levels[curentLevel].curentMenu
        Resources.modules.menuManager.load(curentMenu)
    end
end

--- Charge le niveau suivant.
levelsManager.loadNextLevel = function()
    levelsManager.unload()
    curentLevel = curentLevel + 1
    levelsManager.load()
end

--- Décharge le niveau courant.
levelsManager.unload = function()
    if levelsManager.levels[curentLevel].map~= nil then
        Resources.modules.map.unload()
    end

    if levelsManager.levels[curentLevel].backgroundImg~= nil then
        Resources.unloadImage(levelsManager.levels[curentLevel].backgroundImg)
    end   

    if levelsManager.levels[curentLevel].backgroundMusic~= nil then
        Resources.unloadSound(levelsManager.levels[curentLevel].backgroundMusic)
    end

    if levelsManager.levels[curentLevel].backgroundImg ~=nil or levelsManager.levels[curentLevel].backgroundMusic~=nil then
        Resources.modules.BackgroundManager.unload()
    end

    if levelsManager.levels[curentLevel].curentMenu~= nil then
        Resources.modules.menuManager.unload()
    end
end

return levelsManager