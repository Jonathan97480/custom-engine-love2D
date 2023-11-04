--- Module de caméra pour LOVE2D
-- @module camera

-- Vous pouvez ajouter ici une description plus détaillée du module, de ses fonctions et de son utilisation.

local cameraHeight 
local cameraWidth 
local cameraX 
local cameraY 
local offsetX 
local offsetY 

local camera = {}

--chargement des parametre par defaut de la camera
camera.init =function()

    cameraHeight = Resources.modules.windowManager.getCurentResolution().y
    cameraWidth =  Resources.modules.windowManager.getCurentResolution().x
    local curentScale = Resources.modules.windowManager.getScale()
   --[[ calcul de l'offset ]]
    offsetX = 130
    offsetY = 60
    
    camera.set(0, 0)
end




--- Définit la taille de la caméra.
-- @param width La nouvelle largeur de la caméra.
-- @param height La nouvelle hauteur de la caméra.
function camera.setSize(width, height)
    cameraWidth = width
    cameraHeight = height
end

--- Définit la position de la caméra.
-- @param x La coordonnée X de la nouvelle position de la caméra.
-- @param y La coordonnée Y de la nouvelle position de la caméra.
function camera.set(x, y)
    cameraX = x
    cameraY = y
end

--- Récupère la position actuelle de la caméra.
-- @return La coordonnée X et Y de la caméra.
function camera.getPosition()
    return cameraX, cameraY
end

--- Récupère la hauteur de la caméra.
-- @return La hauteur de la caméra.
function camera.getCameraHeight()
    return cameraHeight
end

--- Récupère la largeur de la caméra.
-- @return La largeur de la caméra.
function camera.getCameraWidth()
    return cameraWidth
end

--- Récupère la taille de la caméra.
-- @return La largeur et la hauteur de la caméra.
function camera.getSize()
    return cameraWidth, cameraHeight
end

--- Récupère l'offset de la caméra.
-- @return L'offset en X et Y de la caméra.
function camera.getOffset()
    return offsetX, offsetY
end

--- Récupère l'offset en X de la caméra.
-- @return L'offset en X de la caméra.
function camera.getOffsetX()
    return offsetX
end


--- Récupère l'offset en Y de la caméra.
-- @return L'offset en Y de la caméra.
function camera.getOffsetY()
    return offsetY
end

---function de linear interpolation
-- @param a La valeur de départ.
-- @param b La valeur d'arrivée.
-- @param t Le pourcentage de l'interpolation.
-- @return La valeur interpolée.
local function lerp(a, b, t)
    return a + (b - a) * t
end

--- Met à jour la caméra.
-- @param dt Delta time.
function camera.update(dt)
    
end


--- Déplace la caméra en douceur vers une nouvelle position.
-- @param x La coordonnée X de la nouvelle position de la caméra.
-- @param y La coordonnée Y de la nouvelle position de la caméra.
function camera.move(x, y)
    
    local _cameraX =  x
    local _cameraY = y
     
     _cameraX = _cameraX - offsetX
    _cameraY = _cameraY - offsetY 

   
    cameraX = lerp(cameraX, _cameraX, 0.05)
    cameraY = lerp(cameraY, _cameraY, 0.05)
   
end



--- Déplace la caméra en douceur vers une nouvelle position.

function camera.moveInstant(x, y)
    
    local _cameraX =  x
    local _cameraY = y
     
     _cameraX = _cameraX - offsetX
    _cameraY = _cameraY - offsetY 

   
    cameraX = _cameraX
    cameraY = _cameraY
   
end

--- tranblement de la camera
function camera.shake()
    local _cameraX =  cameraX
    local _cameraY = cameraY
    local _offsetX = offsetX
    local _offsetY = offsetY
    local _cameraWidth = cameraWidth
    local _cameraHeight = cameraHeight

    cameraX = _cameraX + math.random(-5,5)
    cameraY = _cameraY + math.random(-5,5)
    offsetX = _offsetX + math.random(-5,5)
    offsetY = _offsetY + math.random(-5,5)
    cameraWidth = _cameraWidth + math.random(-5,5)
    cameraHeight = _cameraHeight + math.random(-5,5)


end




function camera.setOffset(x,y)
    offsetX = x
    offsetY = y
end
--- Applique la transformation de la caméra pour le dessin.
function camera.draw()
    love.graphics.translate(-cameraX, -cameraY) 


end



return camera
