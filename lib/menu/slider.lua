
menuManager.drawSLider = function(slider)

    local state = slider.state
    if state == "normal" then
        slider.color = slider.colorDefault
        slider.colorText = slider.colorTextDefault
    elseif state == "hover" then
        slider.color = slider.colorHover
        slider.colorText = slider.colorTextHover
    elseif state == "click" then
        slider.color = slider.colorClick
        slider.colorText = slider.colorTextClick
    elseif state == "disable" then
        slider.color = slider.colorDisable
        slider.colorText = slider.colorTextDisable
    end
    love.graphics.setColor(slider.color.r, slider.color.g, slider.color.b)
    love.graphics.rectangle("fill", slider.realX, slider.realY, slider.width, slider.height)
    love.graphics.setColor(slider.colorText.r, slider.colorText.g, slider.colorText.b)

    
    --[[ on verifie si cest un bouton graphique ou un string ]]
    if slider.isGraphique then
        love.graphics.draw(slider.image, slider.realX + slider.textPaddingX, slider.realY + slider.textPaddingY)
        return
    end

    --[[ on verifie si cest un string ou un objet drawable ]]
    if type(slider.text) == "string" then
        love.graphics.printf(slider.text, slider.realX + slider.textPaddingX, slider.realY + slider.textPaddingY, slider.width - 2 * slider.textPaddingX, slider.textAlign)
    else
        love.graphics.draw(slider.text, slider.realX + slider.textPaddingX, slider.realY + slider.textPaddingY)
    end
    love.graphics.setColor(255, 255, 255)

end

end

menuManager.createSLider = function ()

    local slider = {}
    slider.type = "slider"
    slider.value = 0
    slider.min = 0
    slider.max = 100
    slider.width = 100
    slider.height = 20
    slider.x = 0
    slider.y = 0
    slider.realX = 0
    slider.realY = 0
    slider.marginTop = 5
    slider.marginLeft = 0
    slider.marginRight = 0
    slider.marginBottom = 0
    slider.isGraphique = false
    slider.image = nil
    slider.font = love.graphics.newFont(12)
    slider.textAlign = "center"
    slider.textPaddingX = 5
    slider.textPaddingY = 5
    slider.colorText = COLORS.normal.text
    slider.colorTextHover = COLORS.hover.text
    slider.colorTextClick = COLORS.click.text
    slider.colorTextDisable = COLORS.disable.text
    slider.colorTextDefault = COLORS.normal.text
    slider.color = COLORS.normal.background
    slider.colorHover = COLORS.hover.background
    slider.colorClick = COLORS.click.background
    slider.colorDisable = COLORS.disable.background
    slider.colorDefault = COLORS.normal.background
    slider.state = "normal" -- state possible: normal, hover, click, disable
    slider.event = {}
    slider.event.click = function()
        print("click")
    end
    slider.event.hover = function()
        print("hover")
    end
    slider.event.disable = function()
        print("disable")
    end
    slider.event.normal = function()
        print("normal")
    end
    slider.event.update = function()
        print("update")
    end

    return slider

end