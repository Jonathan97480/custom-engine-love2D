
--[[ 
    Description:
    Gestion des ressources du jeu
    author : Gauvin Jonathan
    date : 04/11/2023
    version : 1.0
 ]]

local Resources = {}

-- Chargement des images
Resources.images = {}

-- Chargement des sons
Resources.sounds = {}

-- Chargement des polices
Resources.fonts = {}

Resources.tileSet = {}

Resources.sprite = {}

Resources.spriteSheet = {}



-- Chargement des fichiers de données
Resources.data = {
    levels = love.filesystem.load("data/levels.lua")(),
    config = love.filesystem.load("data/config.lua")(),
}

-- chargement des modules
Resources.modules = {
    json=require("lib/json"),
    windowManager = require("lib/windowManager"),
    camera = require("lib/camera"),
    paths = require("lib/paths"),
    map = require("lib/mapManager"),
    saveFileManager = require("lib/saveFileManager"),
    menuManager = require("lib/menu/menuManager"),
    lib = require("lib/lib"),
    gameManager = require("data/game/gameManager"),
    sound = require("lib/sound"),

}

function loadFxSound(namefx)

    local fx ={}
    fx.sound = love.audio.newSource( Resources.modules.paths.dir.sounds..namefx, "static")
    fx.sound:setVolume(2)
    fx.sound:setLooping(false)
    fx.type = "fx"
    --[[ on récupère le non de son via le path sans extension ]]
    local namefx = string.gsub(namefx, Resources.modules.paths.dir.sounds, "")
    namefx = string.gsub(namefx, ".mp3", "")
    fx.name = namefx
    return fx

    

end


function loadMusic(nameMusic)

    local music ={}
    music.sound = love.audio.newSource( Resources.modules.paths.dir.sounds..nameMusic, "stream")
    music.sound:setVolume(0.5)
    music.sound:setLooping(true)
    music.type = "music"
    --[[ on récupère le non de son via le path sans extension ]]
    local nameMusic = string.gsub(nameMusic, Resources.modules.paths.dir.sounds, "")
    nameMusic = string.gsub(nameMusic, ".mp3", "")
    music.name = nameMusic
    return music
end


Resources.loadSounds = function(path,type)
    

    if type == "fx" then
        table.insert(Resources.sounds, loadFxSound(path))
    elseif type == "music" then
        table.insert(Resources.sounds, loadMusic(path))
    end


end

Resources.unloadSounds = function(namefx)
    for i, fx in ipairs(Resources.sounds) do
        if fx.name == namefx then
            table.remove(Resources.sounds, i)
        end
    end
end

Resources.loadTileSet = function(nameTileset,tileSize)
    local tileset = {}
    tileset.image = love.graphics.newImage(Resources.modules.paths.dir.tileSet..nameTileset)
    tileset.image:setFilter("nearest", "nearest")
    tileset.quads = {}
    tileset.imagewidth = tileset.image:getWidth()
    tileset.imageheight = tileset.image:getHeight()
    local tileWidth = tileSize
    local tileHeight = tileSize
    local tilesetX = 0
    local tilesetY = 0
    local id = 1
    for y = 0, tileset.imageheight - tileHeight, tileHeight do
        for x = 0, tileset.imagewidth - tileWidth, tileWidth do
            tileset.quads[id] = love.graphics.newQuad(x, y, tileWidth, tileHeight, tileset.imagewidth, tileset.imageheight)
            id = id + 1
        end
    end
    --[[ on recupere le non de son via le path sans l'extenssion ]]
    local nameTileset = string.gsub(nameTileset, Resources.modules.paths.dir.tileSet, "")
    nameTileset = string.gsub(nameTileset, ".png", "")
    tileset.name = nameTileset
    table.insert(Resources.tileSet, tileset)
    return tileset

end

Resources.unloadTileSet = function(nameTileset)
    for i, tileset in ipairs(Resources.tileSet) do
        if tileset.name == nameTileset then
            table.remove(Resources.tileSet, i)
        end
    end
end

Resources.loadFont = function(nameFont)
    local font = {}
    font.font = love.graphics.newFont(Resources.modules.paths.dir.fonts..nameFont, 32)
    font.name = nameFont
    table.insert(Resources.fonts, font)
    return font
end

Resources.unloadFont = function(nameFont)
    for i, font in ipairs(Resources.fonts) do
        if font.name == nameFont then
            table.remove(Resources.fonts, i)
        end
    end
end


Resources.loadSprite = function(nameSprite)

    local sprite = {}
    sprite.image = love.graphics.newImage(Resources.modules.paths.dir.sprite..nameSprite)
    sprite.image:setFilter("nearest", "nearest")
    local spriteWidth = 32
    local spriteHeight = 32
    local spriteX = 0
    local spriteY = 0
    --[[ on recupere le non de son via le path sans l'extenssion ]]
    local nameSprite = string.gsub(nameSprite,Resources.modules.paths.dir.sprite, "")
    nameSprite = string.gsub(nameSprite, ".png", "")
    sprite.name = nameSprite
    table.insert(Resources.sprite, sprite)
    return sprite

end

Resources.unloadSprite = function(nameSprite)
    for i, sprite in ipairs(Resources.sprite) do
        if sprite.name == nameSprite then
            table.remove(Resources.sprite, i)
        end
    end
end

Resources.loadSpriteSheet = function(nameSpriteSheet,spriteSize)

    local spriteSheet = {}
    spriteSheet.image = love.graphics.newImage(Resources.modules.paths.dir.spriteSheet..nameSpriteSheet)
    spriteSheet.image:setFilter("nearest", "nearest")
    spriteSheet.spriteWidth = spriteSize
    spriteSheet.spriteHeight = spriteSize
    spriteSheet.imagewidth = spriteSheet.image:getWidth()
    spriteSheet.imageheight = spriteSheet.image:getHeight()
    local spriteX = 0
    local spriteY = 0
    local id = 1
    spriteSheet.quads = {}
    local nbColumns = (spriteSheet.image:getWidth() /spriteSheet.spriteWidth)+1
    local nbLines = spriteSheet.image:getHeight() / spriteSheet.spriteHeight
    local id = 1
    for l = 0, nbLines - 1 do
        for c = 0, nbColumns - 1 do
            spriteSheet.quads[id] = love.graphics.newQuad(c * spriteSheet.spriteWidth, l * spriteSheet.spriteHeight, spriteSheet.spriteWidth, spriteSheet.spriteHeight, spriteSheet.image:getDimensions())
            id = id + 1
        end
    end
    --[[ on recupere le non de son via le path sans l'extenssion ]]
    local nameSpriteSheet = string.gsub(nameSpriteSheet, Resources.modules.paths.dir.spriteSheet, "")
    nameSpriteSheet = string.gsub(nameSpriteSheet, ".png", "")
    spriteSheet.name = nameSpriteSheet
    table.insert(Resources.spriteSheet, spriteSheet)
    return spriteSheet

end

Resources.unloadSpriteSheet = function(nameSpriteSheet)
    for i, spriteSheet in ipairs(Resources.spriteSheet) do
        if spriteSheet.name == nameSpriteSheet then
            table.remove(Resources.spriteSheet, i)
        end
    end
end



return Resources