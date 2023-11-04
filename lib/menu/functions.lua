local menuFunctions={}

-- Fonction pour gérer le centrage des boutons
-- @param buttons table
-- @param sectionSize table
-- @return section table
 function menuFunctions.applyFlex(section)

    local flex = section.flex

    
    if flex.direction == "column" then
    

        for k, button in ipairs(section.button) do

            

            button.position.x = section.position.x + (section.size.width - button.size.width) / 2
            button.position.y = section.position.y + (section.size.height - button.size.height) / 2

            if k ==1 then
                if(flex.justifyContent == "flex-start") then
                    button.position.y = section.position.y + button.margin.top
                elseif(flex.justifyContent == "flex-end") then
                    button.position.y = section.position.y + section.size.height - button.size.height - button.margin.bottom
                elseif(flex.justifyContent == "center") then
                    button.position.y = section.position.y + (section.size.height - button.size.height) / 2
                    button.position.y = button.position.y - button.size.height- button.margin.bottom
                end

        
            else
                button.position.y = section.button[k-1].position.y + section.button[k-1].size.height + button.margin.top
            end

            if(flex.alignItems == "flex-start") then
                button.position.x = section.position.x + button.margin.left
            elseif(flex.alignItems == "flex-end") then
                button.position.x = section.position.x + section.size.width - button.size.width - button.margin.right
            elseif(flex.alignItems == "center") then
                button.position.x = section.position.x + (section.size.width - button.size.width) / 2
            end

           button.realX = button.position.x
            button.realY = button.position.y



        end
    elseif flex.direction == "row" then
        for k, button in ipairs(section.button) do
            button.position.x = section.position.x + (section.size.width - button.size.width) / 2
            button.position.y = section.position.y + (section.size.height - button.size.height) / 2

            if k ==1 then
                if(flex.justifyContent == "flex-start") then
                    button.position.x = section.position.x + button.margin.left
                elseif(flex.justifyContent == "flex-end") then
                    button.position.x = section.position.x + section.size.width - button.size.width - button.margin.right
                elseif(flex.justifyContent == "center") then
                    button.position.x = section.position.x + (section.size.width - button.size.width) / 2
                end

        
            else
                button.position.x = section.button[k-1].position.x + section.button[k-1].size.width + button.margin.left
            end

            if(flex.alignItems == "flex-start") then
                button.position.y = section.position.y + button.margin.top
            elseif(flex.alignItems == "flex-end") then
                button.position.y = section.position.y + section.size.height - button.size.height - button.margin.bottom
            elseif(flex.alignItems == "center") then
                button.position.y = section.position.y + (section.size.height - button.size.height) / 2
            end
        end

           button.realX = button.position.x
            button.realY = button.position.y
    end



    return section


end

-- Fonction pour définir la taille de la police pour les boutons
-- @param btns table
-- @return btns table
 function menuFunctions.setButtonFontSize(btns)
    for _, btn in ipairs(btns) do
        local maxTextWidth = btn.size.width - 2 * btn.text.margin.left
        local maxTextHeight = btn.size.height - 2 * btn.text.margin.top
        local maxFontSize = math.min(maxTextWidth, maxTextHeight)
        btn.text.font = love.graphics.newFont(maxFontSize)
        btn.text.value = love.graphics.newText(btn.text.font, btn.text.value)
    end
    return btns
end

return menuFunctions