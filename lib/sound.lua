--[[ Description: 
    Gestion des sons du jeu 
    author : Gauvin Jonathan
    date : 04/11/2023
    version : 1.0
]]--


local Sound = {}
local fxVol=0.5
local musicVol=0.5
local globalVol = 0.5

Sound.list = {
    fx ={},
    music = {}
}

--- Charge les sons
Sound.load = function()

--- Référence et classe les sons dans des tables
    for k,v in pairs (Resources.sounds) do
       
        if v.type == "fx" then
            
            Sound.list.fx[v.name] = v.sound
            Sound.list.fx[v.name].setVolume(fxVol)
        
        elseif v.type == "music" then

            Sound.list.music[v.name] = v.sound
            Sound.list.music[v.name].setVolume(musicVol)
        end
    end

end

--- Joue un son
-- @param name string
Sound.play = function(name)
    if Sound.list.fx[name] ~= nil then
        Sound.list.fx[name]:play()
    elseif Sound.list.music[name] ~= nil then
        Sound.list.music[name]:play()
    end
end

--- Stop un son
-- @param name string
Sound.stop = function(name)
    if Sound.list.fx[name] ~= nil then
        Sound.list.fx[name]:stop()
    elseif Sound.list.music[name] ~= nil then
        Sound.list.music[name]:stop()
    end
end

--- Pause un son
-- @param name string
Sound.pause = function(name)
    if Sound.list.fx[name] ~= nil then
        Sound.list.fx[name]:pause()
    elseif Sound.list.music[name] ~= nil then
        Sound.list.music[name]:pause()
    end
end

--- Resume un son
-- @param name string
Sound.resume = function(name)
    if Sound.list.fx[name] ~= nil then
        Sound.list.fx[name]:resume()
    elseif Sound.list.music[name] ~= nil then
        Sound.list.music[name]:resume()
    end
end

--- Set le volume des fx
-- @param volume number
Sound.setFxVolume = function(volume)
    fxVol = volume

    for k,v in pairs (Sound.list.fx) do

        v:setVolume(volume + globalVol)

    end
end

--- Set le volume de la musique
-- @param volume number
Sound.setMusicVolume = function(volume)
    musicVol = volume

    for k,v in pairs (Sound.list.music) do

        v:setVolume(volume + globalVol)

    end
end

--- Set le volume global
-- @param volume number
Sound.setGlobalVolume = function(volume)
    globalVol = volume
    --on set les fx et la musique
    Sound.setFxVolume(volume+fxVol)
    Sound.setMusicVolume(volume+musicVol)

end


return Sound