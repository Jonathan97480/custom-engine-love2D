-- Fichier de configuration des chemins

local Paths = {}

-- Chemins vers les répertoires
Paths.dir = {
    data = "data/",
    images = "images/",
    sprite = "images/sprite/",
    spriteSheet = "images/spriteSheet/",
    tileSet = "images/tileSet/",
    sounds = "sounds/",
    fonts = "fonts/",
    maps = "data/maps/",
}

-- Chemins vers les fichiers
Paths.file = {
    config = "config.lua",
    levels = "levels.lua",
}

return Paths