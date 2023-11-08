local levelsData ={

    {
        id = 1,
        name = "Ecran titre",
        curentMenu = "mainMenu",
        backgroundImg= "titreBack.jpg",
        backgroundMusic = "titreSound.mp3",
        map = nil,
        description = "Ecran titre du jeu",
    },
    {
        id = 2,
        name = "level1",
        curentMenu = "gameMenu",
        backgroundImg= nil,
        backgroundMusic = nil,
        map ={ 
            name ="map_test",
            tileSet = "map_test_tileset.png",
        },
        description = " level 1 du jeu ",
        
    }
   
}

return levelsData