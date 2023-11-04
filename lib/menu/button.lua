local menuFunctions = require("lib/menu/functions")
local Button = {}




-- Fonction pour créer un bouton
-- @param text string
-- @param event function
-- @param image drawable
-- @return button table
Button.new = function(_button)
    
    _button.realX = nil
    _button.realY = nil

    local button = {}   
    for k, v in pairs(_button) do
        button[k] = v
       

    end  
    return button
end

--- Fonction pour redimensionner les boutons
-- @param _section table
-- @return section table
Button.resize = function(_section)
 local section = menuFunctions.applyFlex(_section)
 section = menuFunctions.setButtonFontSize(section)
 return section
end




Button.draw = function(button)
    local state = button.state or "normal"
    local textColor = {r=0, g=0, b=0}
    local btnColor = {r=0, g=0, b=0}
    if state == "normal" then
        btnColor = button.color.active
        textColor = button.text.color.active
    elseif state == "hover" then
       btnColor = button.color.hover
        textColor = button.text.color.hover
    elseif state == "click" then
        btnColor = button.color.click
        textColor = button.text.color.click
    elseif state == "disable" then
        btnColor = button.color.disable
        textColor = button.text.color.disable
    end
    love.graphics.setColor(btnColor.r, btnColor.g, btnColor.b)
    love.graphics.rectangle("fill", button.realX, button.realY, button.size.width, button.size.height)
    love.graphics.setColor(textColor.r, textColor.g, textColor.b)

    
    --[[ on verifie si cest un bouton graphique ou un string ]]
    if button.isGraphique then
        love.graphics.draw(button.image, button.realX + button.text.margin.left, button.realY + button.text.margin.top)
        return
    end

    --[[ on verifie si cest un string ou un objet drawable ]]
    if type(button.text.value) == "string" then
        love.graphics.printf(button.text.value, button.realX + button.text.margin.left, button.realY + button.text.margin.top, button.size.width - 2 * button.text.margin.left, button.align)
    else
        love.graphics.draw(button.text.value, button.realX + button.text.margin.left, button.realY + button.text.margin.top)
    end
    love.graphics.setColor(255, 255, 255)
end







return Button

