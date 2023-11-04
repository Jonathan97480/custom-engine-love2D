
local saveFileManager = {}

-- Chemin du fichier de sauvegarde
local saveFilePath = "save.json"

-- Charge les données sauvegardées depuis le fichier
function saveFileManager.load()
    local file = io.open(saveFilePath, "r")
    if file then
        local data = file:read("*all")
        file:close()
        return Resources.modules.json.decode(data)
    end
    return nil
end

-- Sauvegarde les données dans le fichier
function saveFileManager.save(data)
    local file = io.open(saveFilePath, "w")
    if file then
        file:write(Resources.modules.json.encode(data))
        file:close()
    else
        print("Erreur : Impossible d'ouvrir le fichier de sauvegarde pour l'écriture.")
    end
end

return saveFileManager