local Section ={}


-- Fonction pour créer une section
-- @param name string
-- @param position table
-- @param size table
-- @param button table
-- @return section table
Section.new = function(sectionData,menu)
    local section = {}
    local newPosition = {
        x=sectionData.position.x, 
        y=sectionData.position.y
    }
    
    newPosition.x = newPosition.x + menu.position.x
    newPosition.y = newPosition.y + menu.position.y
    
    section.name =sectionData.name or "default"
    section.position = newPosition
    section.button = sectionData.button or {}

    section.flex= sectionData.flex or {
        direction = "column",
        justifyContent = "flex-start",
        alignItems = "flex-start"
    }

    ---calcul de la taille de la section en fonction de la taille du menu et des padding
    local w =menu.size.width- menu.padding.left - menu.padding.right
    local h =menu.size.height- menu.padding.top - menu.padding.bottom
    
    section.size = {
        width = w,
        height = h
    }
    --- positionnement de la section en fonction du padding
    section.position.x = section.position.x + menu.padding.left
    section.position.y = section.position.y + menu.padding.top
    
    return section
end




return Section