--- Gestionnaire de fenêtre et de résolution pour LOVE2D.
-- Ce module gère la fenêtre, la résolution, la mise à l'échelle et le plein écran dans le framework LOVE2D.
-- @module windowManager

local windowManager = {}
local defaultResolution = {x = 0, y = 0}
local displayindex = 1
local nameWindow 
local defaultScale = {x = defaultResolution.x / 256, y = defaultResolution.y / 144}
local curentScale = {x = 5, y = 5}
local isFullScreen = false
local curentResolution = {x = 0, y = 0}
local width, height

local function lerp(a, b, t)
    return a + (b - a) * t
end

--- Charge la configuration initiale de la fenêtre.
function windowManager.load()

    --[[ on recupere la config ]]
    local  config = Resources.data.config
    defaultResolution.x = config.window.width
    defaultResolution.y = config.window.height
    isFullScreen = config.window.fullscreen
    nameWindow = config.window.title
    
    --[[ on charge la fenetre ]]
    windowManager.setResolution(defaultResolution.x, defaultResolution.y)
    --[[ on charge le titre de la fenetre ]]
    love.window.setTitle(nameWindow)
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setBackgroundColor(0, 0, 0, 0)
    love.graphics.setLineStyle("rough")
    love.graphics.setLineWidth(1)
    love.graphics.setPointSize(1)
    love.graphics.setBlendMode("alpha")
end

--- Fonction de mise à jour de la fenêtre.
-- Vous pouvez ajouter ici le code de mise à jour si nécessaire.
-- @param dt Delta time (temps écoulé depuis la dernière mise à jour).
function windowManager.update(dt)
    -- Ajoutez ici le code de mise à jour si nécessaire
end

--- Met à jour l'échelle en fonction de la nouvelle résolution.
-- @param newResolution Nouvelle résolution sous forme de table {x, y}.
function windowManager.updateScale(newResolution)
    windowManager.setScale({x = newResolution.x / 256, y = newResolution.y / 144})
end

--- Gère l'événement de pression d'une touche.
-- Si la touche "Alt" et la touche "Entrée" sont pressées, bascule entre le mode plein écran et le mode fenêtré.
-- @param key Touche pressée.
function windowManager.keypressed(key)
    if love.keyboard.isDown("lalt") and key == "return" then
        windowManager.fullScreenToggle()
    end
end

--- Bascule entre le mode plein écran et le mode fenêtré.
function windowManager.fullScreenToggle()
    if isFullScreen then
        windowManager.setResolution(defaultResolution.x, defaultResolution.y)
    else
        windowManager.setResolution(windowManager.fullScreenFixeResolution())
    end
    windowManager.setIsFullScreen(not isFullScreen)
end

--- Récupère la résolution par défaut.
-- @return La résolution par défaut sous forme de table {x, y}.
function windowManager.getDefaultResolution()
    return defaultResolution
end

--- Récupère l'échelle par défaut.
-- @return L'échelle par défaut sous forme de table {x, y}.
function windowManager.getScaledefault()
    return defaultScale
end

--- Récupère l'échelle actuelle.
-- @return L'échelle actuelle sous forme de table {x, y}.
function windowManager.getScale()
    return curentScale
end

--- Définit une nouvelle échelle.
-- @param newScale Nouvelle échelle sous forme de table {x, y}.
function windowManager.setScale(newScale)
    curentScale = newScale
end

--- Vérifie si le mode plein écran est activé.
-- @return `true` si le mode plein écran est activé, sinon `false`.
function windowManager.getIsFullScreen()
    return isFullScreen
end

--- Active ou désactive le mode plein écran.
-- @param newIsFullScreen `true` pour activer le mode plein écran, `false` pour désactiver.
function windowManager.setIsFullScreen(newIsFullScreen)
    isFullScreen = newIsFullScreen
    love.window.setFullscreen(newIsFullScreen)
end

--- Récupère la résolution actuelle.
-- @return La résolution actuelle sous forme de table {x, y}.
function windowManager.getCurentResolution()
    return curentResolution
end

--- Définit une nouvelle résolution pour la fenêtre.
-- @param x Largeur de la nouvelle résolution.
-- @param y Hauteur de la nouvelle résolution.
function windowManager.setResolution(x, y)
    curentResolution = {x = x, y = y}
    love.window.setMode(x, y, {resizable = false, vsync = true, minwidth = 1280, minheight = 720})
    windowManager.updateScale({x = x, y = y})
end

--- Récupère les dimensions du bureau de l'ordinateur.
-- @return La largeur et la hauteur du bureau de l'ordinateur.
function windowManager.getDesktopDimensions()
    if not width or not height then
        width, height = love.window.getDesktopDimensions(displayindex)
    end
    return width, height
end

--- Calcule la résolution en 16:9 pour le mode plein écran.
-- @return La résolution en 16:9 sous forme de table {x, y}.
function windowManager.fullScreenFixeResolution()
    local width, height = windowManager.getDesktopDimensions()
    local width32, height9 = width, height
    local width16 = (16 * height9) / 9
    return width16, height9
end

--- Débute le rendu en appliquant l'échelle actuelle.
function windowManager.drawStart()
    love.graphics.push()
    love.graphics.scale(curentScale.x, curentScale.y)
end

--- Termine le rendu en restaurant l'échelle précédente.
function windowManager.drawEnd()
    love.graphics.pop()
end

return windowManager
