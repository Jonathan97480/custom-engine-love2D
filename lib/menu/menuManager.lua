--[[ 
    Description: 
        Gestionnaire de menu
    author : Gauvin Jonathan
    date : 04/11/2023
    version : 1.0
    ]]

local Button = require("lib/menu/button") 
local Section = require("lib/menu/section")
local isDebug = true

local menuManager = {}
menuManager.menu = {}
menuManager.curentMenu = "mainMenu"

local myMenu={
    mainMenu ={
        name="mainMenu",
        position={x=(1280/2)-200,y=(720/2)-150},
        size={width=400,height=300},
        backgroundColor={r=0,g=0,b=0,a=0.5},
        curentSection="main",
        padding={
            top=5,
            left=5,
            right=5,
            bottom=5
        },
        section={
            main={
                position={x=0,y=0},
                size={width=0,height=0},
                name="main",
                flex ={
                    direction="column",
                    align="center",
                    justifyContent="center"
                },
                button={
                    {
                        type="button",
                        position={x=0,y=0},
                        size={width=100,height=30},
                        isGraphique=false,
                        image=nil,
                        state="normal",
                        color={
                            active = {r=1,g=1,b=1,a=1},
                            hover = {r=0,g=0,b=0,a=0},
                            click = {r=0,g=0,b=0,a=0},
                            disable = {r=0,g=0,b=0,a=0},

                        },
                        text={
                            value="new game",
                            font=love.graphics.newFont(12),
                            align="center",
                            margin={
                                top=0,
                                left=0,
                                right=0,
                                bottom=0
                            },
                            color={
                                active = {r=0,g=0,b=0,a=1},
                                hover = {r=0,g=0,b=0,a=0},
                                click = {r=0,g=0,b=0,a=0},
                                disable = {r=0,g=0,b=0,a=0},
                            }
                        },
                        margin={
                            top=5,
                            left=0,
                            right=0,
                            bottom=0
                        },
                        event={
                            click=function()
                                print("play")
                            end
                        }
                    },

                    {
                        text="load game",
                        type="button",
                        position={x=0,y=0},
                        size={width=0,height=0},
                        isGraphique=false,
                        state="normal",
                        image=nil,
                        color={
                            active = {r=1,g=1,b=1,a=1},
                            hover = {r=0,g=0,b=0,a=0},
                            click = {r=0,g=0,b=0,a=0},
                            disable = {r=0,g=0,b=0,a=0},

                        },
                        text={
                            value="load game",
                            font=love.graphics.newFont(12),
                            align="center",
                            margin={
                                top=0,
                                left=0,
                                right=0,
                                bottom=0
                            },
                            color={
                                active = {r=0,g=0,b=0,a=1},
                                hover = {r=0,g=0,b=0,a=0},
                                click = {r=0,g=0,b=0,a=0},
                                disable = {r=0,g=0,b=0,a=0},
                            }
                        },
                        margin={
                            top=5,
                            left=0,
                            right=0,
                            bottom=0
                        },
                        event={
                            click=function()
                                print("load")
                            end
                        }
                    },
                        
                    {
                        text="option",
                        type="button",
                        position={x=0,y=0},
                        size={width=100,height=30},
                        isGraphique=false,
                        state="normal",
                        image=nil,
                        color={
                            active = {r=1,g=1,b=1,a=1},
                            hover = {r=0,g=0,b=0,a=0},
                            click = {r=0,g=0,b=0,a=0},
                            disable = {r=0,g=0,b=0,a=0},

                        },
                        text={
                            value="options",
                            font=love.graphics.newFont(12),
                            align="center",
                            margin={
                                top=0,
                                left=0,
                                right=0,
                                bottom=0
                            },
                            color={
                                active = {r=0,g=0,b=0,a=1},
                                hover = {r=0,g=0,b=0,a=0},
                                click = {r=0,g=0,b=0,a=0},
                                disable = {r=0,g=0,b=0,a=0},
                            }
                        },
                        margin={
                            top=5,
                            left=0,
                            right=0,
                            bottom=0
                        },
                        event={
                            click=function()
                                menuManager.navigate("options")
                             
                            end
                        }
                    },
    
                    {
                        text="credits",
                        type="button",
                        position={x=0,y=0},
                        size={width=100,height=30},
                        isGraphique=false,
                        image=nil,
                        state="normal",
                        color={
                            active = {r=1,g=1,b=1,a=1},
                            hover = {r=0,g=0,b=0,a=0},
                            click = {r=0,g=0,b=0,a=0},
                            disable = {r=0,g=0,b=0,a=0},

                        },
                        text={
                            value="credits",
                            font=love.graphics.newFont(12),
                            align="center",
                            margin={
                                top=0,
                                left=0,
                                right=0,
                                bottom=0
                            },
                            color={
                                active = {r=0,g=0,b=0,a=1},
                                hover = {r=0,g=0,b=0,a=0},
                                click = {r=0,g=0,b=0,a=0},
                                disable = {r=0,g=0,b=0,a=0},
                            }
                        },
                        margin={
                            top=5,
                            left=0,
                            right=0,
                            bottom=0
                        },
                        event={
                            click=function()
                                print("credits")
                            end
                        },
                
                    }
                    
                }
            },
            options={
                position={x=0,y=0},
                size={width=0,height=0},
                name="options",
                flex ={
                    direction="column",
                    align="center",
                    justifyContent="center"
                },
                button={
                    {
                        type="button",
                        position={x=0,y=0},
                        size={width=100,height=30},
                        isGraphique=false,
                        image=nil,
                        state="normal",
                        color={
                            active = {r=1,g=1,b=1,a=1},
                            hover = {r=0,g=0,b=0,a=0},
                            click = {r=0,g=0,b=0,a=0},
                            disable = {r=0,g=0,b=0,a=0},

                        },
                        text={
                            value="graphic",
                            font=love.graphics.newFont(12),
                            align="center",
                            margin={
                                top=0,
                                left=0,
                                right=0,
                                bottom=0
                            },
                            color={
                                active = {r=0,g=0,b=0,a=1},
                                hover = {r=0,g=0,b=0,a=0},
                                click = {r=0,g=0,b=0,a=0},
                                disable = {r=0,g=0,b=0,a=0},
                            }
                        },
                        margin={
                            top=5,
                            left=0,
                            right=0,
                            bottom=0
                        },
                        event={
                            click=function()
                                print("graphic")
                            end
                        }
                    },

                    {
                        text="load game",
                        type="button",
                        position={x=0,y=0},
                        size={width=0,height=0},
                        isGraphique=false,
                        state="normal",
                        image=nil,
                        color={
                            active = {r=1,g=1,b=1,a=1},
                            hover = {r=0,g=0,b=0,a=0},
                            click = {r=0,g=0,b=0,a=0},
                            disable = {r=0,g=0,b=0,a=0},

                        },
                        text={
                            value="Sound",
                            font=love.graphics.newFont(12),
                            align="center",
                            margin={
                                top=0,
                                left=0,
                                right=0,
                                bottom=0
                            },
                            color={
                                active = {r=0,g=0,b=0,a=1},
                                hover = {r=0,g=0,b=0,a=0},
                                click = {r=0,g=0,b=0,a=0},
                                disable = {r=0,g=0,b=0,a=0},
                            }
                        },
                        margin={
                            top=5,
                            left=0,
                            right=0,
                            bottom=0
                        },
                        event={
                            click=function()
                                print("Sound")
                            end
                        }
                    },
                        
                    {
                        text="option",
                        type="button",
                        position={x=0,y=0},
                        size={width=100,height=30},
                        isGraphique=false,
                        state="normal",
                        image=nil,
                        color={
                            active = {r=1,g=1,b=1,a=1},
                            hover = {r=0,g=0,b=0,a=0},
                            click = {r=0,g=0,b=0,a=0},
                            disable = {r=0,g=0,b=0,a=0},

                        },
                        text={
                            value="Back",
                            font=love.graphics.newFont(12),
                            align="center",
                            margin={
                                top=0,
                                left=0,
                                right=0,
                                bottom=0
                            },
                            color={
                                active = {r=0,g=0,b=0,a=1},
                                hover = {r=0,g=0,b=0,a=0},
                                click = {r=0,g=0,b=0,a=0},
                                disable = {r=0,g=0,b=0,a=0},
                            }
                        },
                        margin={
                            top=5,
                            left=0,
                            right=0,
                            bottom=0
                        },
                        event={
                            click=function()
                               menuManager.navigate("main")
                            end
                        }
                    }
                    
                }
            }
        }
    }
}





--- Fonction pour charger le gestionnaire de menu
menuManager.load = function()
    
    for menuName, menu in pairs(myMenu) do
        
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

    --[[ si le menu n'est pas actif, ne dessinez rien ]]
    if   not menuManager.menu[menuManager.curentMenu].isActive then
        return
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
    if key == "escape" then
        -- Si le menu est actuellement actif, fermez-le
        if menuManager.menu[menuManager.curentMenu].isActive then
            menuManager.menu[menuManager.curentMenu].isActive = false
        else
            -- définir la position du menu et sa taille en se basant sur la résolution de la fenêtre de jeu
            --et le positionner au centre de l'écran si vous n'avez pas défini la position et la taille du menu
            menuManager.definePositionAndSizeMenu()

            -- Activez le menu
            menuManager.activeCurentMenu("main")
        end
    end
end

-- détections des mouvements de la sourie
menuManager.mousemoved = function(x, y, dx, dy)
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
