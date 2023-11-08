--- Module de gestion de carte pour le jeu.
-- Ce module gère le chargement de cartes, le dessin de tuiles, la détection de collision et la manipulation de tuiles.
-- @module map

local map = {}
local tileset 

--- Charge une carte depuis un fichier.
-- @param nameMap Le nom du fichier de carte à charger.
function map.load(nameMap,tileSet)
     tileset = Resources.loadTileSet(tileSet,16)
    map0 = require(Resources.modules.paths.dir.maps..nameMap)
    map.debugColision = false
end

--- Décharge la carte actuelle.
function map.unload()
    map0 = nil
end

--- Met à jour la carte.
-- @param dt Delta time.
function map.update(dt)

end

--- Récupère la largeur de la carte.
-- @return La largeur de la carte.
function map.getMapWidth()
    return map0.width * map0.tilesets[1].tilewidth
end

--- Récupère la hauteur de la carte.
-- @return La hauteur de la carte.
function map.getMapHeight()
    return map0.height * map0.tilesets[1].tileheight
end



--- Dessine la carte à l'écran en prenant en compte la caméra.
function map.draw()

    ---[[ dessin pas la map si aucune map n'est chargée ]]
    if map0 == nil then
        return
    end


    local cameraX, cameraY = Resources.modules.camera.getPosition()
    local cameraWidth, cameraHeight = Resources.modules.camera.getSize()
    local tileWidth = map0.tilesets[1].tilewidth
    local tileHeight = map0.tilesets[1].tileheight

    -- Appliquez une découpe pour limiter le rendu aux limites de la caméra
    love.graphics.setScissor(0, 0, cameraWidth, cameraHeight)
    love.graphics.translate(-cameraX, -cameraY)
    
    for l = 1, #map0.layers do
        local layer = map0.layers[l]
        if layer.type == "tilelayer" and layer.visible then
            for t = 1, #layer.data do
                local id = layer.data[t]
                if id ~= 0 then
                 
                    local tilesetX = (id - 1) % (tileset.imagewidth / tileWidth)
                    local tilesetY = math.floor((id - 1) / (tileset.imagewidth / tileWidth))
                    local x = (t - 1) % map0.width * tileWidth
                    local y = math.floor((t - 1) / map0.width) * tileHeight

                    -- Dessinez uniquement les tuiles visibles
                    love.graphics.draw(tileset.image, tileset.quads[id], x, y)
                    
                    -- Dessin des limites de la caméra en mode debug
                    if map.debugColision then
                        love.graphics.rectangle("line", x, y, tileWidth, tileHeight)
                    end
                end
            end
        end
    end

    -- Réinitialisez la découpe
    love.graphics.setScissor()
end

--- Vérifie s'il y a une collision à la position donnée.
-- @param x La position X.
-- @param y La position Y.
-- @return `true` s'il y a une collision, sinon `false`.
function map.getColision(x, y)

    if map0 == nil then
        return false
    end

    for l = 1, #map0.layers do
        if map0.layers[l].name == "colision" then
            local layer = map0.layers[l]
            local tileWidth = map0.tilesets[1].tilewidth
            local tileHeight = map0.tilesets[1].tileheight
            local colX = math.floor(x / tileWidth) + 1
            local colY = math.floor(y / tileHeight) + 1
            local index = (colY - 1) * map0.width + colX
            local id = layer.data[index] or 0
            return id ~= 0
        end
    end
    return false
end

--- Récupère l'ID de la tuile à la position donnée dans une couche spécifiée.
-- @param x La position X.
-- @param y La position Y.
-- @param layerName Le nom de la couche.
-- @return L'ID de la tuile ou `false` s'il n'y en a pas.
function map.getTile(x, y, layerName)
    for l = 1, #map0.layers do
        if map0.layers[l].name == layerName then
            local layer = map0.layers[l]
            local index = (y - 1) * map0.width + x
            local id = layer.data[index] or 0
            return id
        end
    end
    return false
end

--- Définit l'ID de la tuile à la position donnée dans une couche spécifiée.
-- @param x La position X.
-- @param y La position Y.
-- @param id L'ID de la nouvelle tuile.
-- @param layerName Le nom de la couche.
function map.setTile(x, y, id, layerName)
    for l = 1, #map0.layers do
        if map0.layers[l].name == layerName then
            local layer = map0.layers[l]
            local index = (y - 1) * map0.width + x
            layer.data[index] = id
        end
    end
end

return map
