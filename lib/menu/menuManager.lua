--[[ 
    Description: 
        Gestionnaire de menu
    author : Gauvin Jonathan
    date : 04/11/2023
    version : 1.0
    ]]

--- Modules    
local Button = require("lib/menu/button") 
local Section = require("lib/menu/section")

--- Variables locales
local isDebug = true



local menuManager = {}
menuManager.menu = {}
menuManager.curentMenu = nil
menuManager.isPermanent = false --- si le menu est permanent ou non ( si il est permanent il ne se ferme pas avec la touche echap)

---Recuperation des menus du jeu
menuGame = require("data/game/files/menu")

--- Fonction pour charger le gestionnaire de menu
menuManager.load = function( curentMenu)

    if curentMenu == nil then
        print("Error: curentMenu is nil")
        return
    end

    menuManager.curentMenu = curentMenu

    menuManager.isPermanent = menuGame[curentMenu].isPermanent

    for menuName, menu in pairs(menuGame) do
        
        menuManager.createMenu(menu)
    
        for _sectionName, _section in pairs(menu.section) do

           local section = Section.new(_section,menu)
            menuManager.menu[menu.name][section.name] = section
            for i, button in ipairs(section.button) do
                local btn = Button.new(button)
                section.button[i] = btn
                Button.resize(section)

            end 
        end
        
    end

    --[[ on active le menu si il est permanent ]]
    if menuManager.isPermanent then
        menuManager.activeMenu("main")
    end

end

--- Fonction pour décharger le gestionnaire de menu
menuManager.unload = function()
    menuManager.menu = {}
    menuManager.curentMenu = nil
    menuManager.isPermanent = false

    print("unload menu")
end
 


--- Fonction pour créer un menu
-- @param menuData table
menuManager.createMenu = function(menuData)
   size ={ width = Resources.modules.windowManager.getCurentResolution().x/2,height = Resources.modules.windowManager.getCurentResolution().y/2 }
    
    menuManager.menu[menuData.name] = {
        position = menuData.position or { x = 0, y = 0 },
        backgroundColor = menuData.backgroundColor or { r = 0, g = 0, b = 0, a = 0 },
        size = menuData.size  or size,
        isActive = false,
        curentSection = menuData.curentSection or "main",
    }

end


--- Fonction pour naviguer entre les sections
-- @param sectionName string
menuManager.navigate = function(sectionName)
    menuManager.menu[menuManager.curentMenu].curentSection = sectionName
end

menuManager.setMenu = function(menuName)
    menuManager.curentMenu = menuName
end

menuManager.update = function()
    if not menuManager.menu.isActive then
        return
    end

    
end

--- Fonction pour vérifier si la souris est sur un bouton
-- @param mousePosition table
-- @param button table
menuManager.isMouseOverButton = function(mousePosition, button)
    local btnx, btny = button.realX, button.realY
    return mousePosition.x > btnx and mousePosition.x < btnx + button.size.width and mousePosition.y > btny and mousePosition.y < btny + button.size.height
end


--- Fonction pour dessiner le menu
menuManager.draw = function()

    if menuManager.curentMenu == nil then
        return
    end

    --[[ si le menu n'est pas actif, ne dessinez rien ]]
    if isPermanent~=true then

        if   not menuManager.menu[menuManager.curentMenu].isActive then
            return
        end

    end


    local curentMenu = menuManager.menu[menuManager.curentMenu]
    local section = curentMenu[curentMenu.curentSection]

    ---[[ dessiner le menu ]]
   menuManager.drawMenu() 

    ---[[ dessiner les boutons ]]
    for i, btn in ipairs(section.button) do
        Button.draw(btn)
    end 

    ---[[ dessiner le debug pour la section ]]
    if isDebug then
        menuManager.debugDraw(section)
    end

end

--- Fonction pour dessiner le debug pour la section
menuManager.debugDraw = function(section)
    --[[ debug draw button ]]
    for i, btn in ipairs(section.button) do
        love.graphics.setColor(0, 255, 0)
        love.graphics.rectangle("line", btn.realX, btn.realY, btn.size.width, btn.size.height)
        love.graphics.setColor(255, 255, 255)
    end
    --[[ end debug draw button ]]
end

--- Fonction pour gérer les clics de souris
menuManager.mousepressed =function(x, y, button)

    if menuManager.curentMenu == nil then
        return
    end

    if not menuManager.menu[menuManager.curentMenu].isActive then
        return
    end

    --[[ on regarde sur quel bouton on a cliquer ]]
    local curentMenu = menuManager.menu[menuManager.curentMenu]
    local curentSection = curentMenu[curentMenu.curentSection]
    local mousePosition = {x = x, y = y}
   for i, btn in ipairs(curentSection.button) do

        if menuManager.isMouseOverButton(mousePosition, btn) then

            btn.state = "click"
            local clickEvent = btn.event.click
            if clickEvent then
                clickEvent()
            end
        end
    end 

end

--- Fonction pour gérer les relâchements de souris
menuManager.mousereleased =function(x, y, button)

end


--- Fonction pour dessiner le menu
menuManager.drawMenu = function()
 
    love.graphics.setColor(
        menuManager.menu[menuManager.curentMenu].backgroundColor.r,
        menuManager.menu[menuManager.curentMenu].backgroundColor.g,
        menuManager.menu[menuManager.curentMenu].backgroundColor.b,
        menuManager.menu[menuManager.curentMenu].backgroundColor.a
    )

    love.graphics.rectangle(
        "fill", 
        menuManager.menu[menuManager.curentMenu].position.x, 
        menuManager.menu[menuManager.curentMenu].position.y, 
        menuManager.menu[menuManager.curentMenu].size.width, 
        menuManager.menu[menuManager.curentMenu].size.height
    )

    love.graphics.setColor(255, 255, 255)
    love.graphics.setFont(love.graphics.newFont(12))

end


--- Fonction pour gérer les touches du clavier
menuManager.keypressed = function(key)

    if menuManager.curentMenu == nil or menuManager.isPermanent==true then
        return
    end

    if key == "escape" then
        -- Si le menu est actuellement actif, fermez-le
        if menuManager.menu[menuManager.curentMenu].isActive then
            menuManager.menu[menuManager.curentMenu].isActive = false
        else
            --[[ si le menu n'est pas actif, activez-le ]]
            menuManager.activeCurentMenu("main")
        end
    end
end

--- active le menu 
menuManager.activeMenu = function(menuName)
   -- définir la position du menu et sa taille en se basant sur la résolution de la fenêtre de jeu
   --et le positionner au centre de l'écran si vous n'avez pas défini la position et la taille du menu
    menuManager.definePositionAndSizeMenu()

    -- Activez le menu
    menuManager.activeCurentMenu(menuName)
end

-- détections des mouvements de la sourie
menuManager.mousemoved = function(x, y, dx, dy)

    if menuManager.curentMenu == nil then
        return
    end

    if not menuManager.menu[menuManager.curentMenu].isActive then
        return
    end
    local curentMenu = menuManager.menu[menuManager.curentMenu]
    local curentSection = curentMenu[curentMenu.curentSection]

    local mousePosition = {x = x, y = y}
   for i, btn in ipairs(curentSection.button) do
    
        if menuManager.isMouseOverButton(mousePosition, btn) then
            btn.state = "hover"
           
        else
            btn.state = "normal"
        end
       
  
    end 
end

--- Fonction pour activer le menu   
-- @param menuName string
menuManager.activeCurentMenu = function(menuName)
    
    -- Définissez la section actuelle sur la section spécifiée
    menuManager.menu[menuManager.curentMenu].curentSection = menuName
    -- Activez le menu
    menuManager.menu[menuManager.curentMenu].isActive = true
 
end

--- Fonction pour définir la position et la taille du menu
menuManager.definePositionAndSizeMenu = function()
   
    --[[ si la position et la taille du menu sont définies, ne faites rien ]]
    if menuManager.menu[menuManager.curentMenu].position.x~=nil or menuManager.menu[menuManager.curentMenu].position.y~=nil then
        return
    end

    local gameScreenW = Resources.modules.windowManager.getCurentResolution().x
    local gameScreenH = Resources.modules.windowManager.getCurentResolution().y

    --[[ définir la position et la taille du menu pour qu'il soit au centre de l'écran  ]]
    menuManager.menu[menuManager.curentMenu].position.x =  gameScreenW / 2 - (gameScreenW / 2) / 2
    menuManager.menu[menuManager.curentMenu].position.y = gameScreenH / 2 - (gameScreenH / 2) / 2

    menuManager.menu[menuManager.curentMenu].size.width = gameScreenW / 2
    menuManager.menu[menuManager.curentMenu].height = gameScreenH / 2
end


--- Fonction pour gérer les mouvements de la molette de la souris

menuManager.wheelmoved = function()


end

return menuManager
