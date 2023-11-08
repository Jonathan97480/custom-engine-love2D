
local myMenu={
    mainMenu ={
        name="mainMenu",
        position={x=(1280/2)-200,y=(720/2)-150},
        size={width=400,height=300},
        backgroundColor={r=0,g=0,b=0,a=0.0},
        curentSection="main",
        isPermanent=true,
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
                        size={width=150,height=30},
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
                               Resources.modules.levelsManager.loadNextLevel()
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
                        size={width=150,height=30},
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
                        size={width=150,height=30},
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
                        size={width=150,height=30},
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
    },
    gameMenu ={
        name="gameMenu",
        position={x=(1280/2)-200,y=(720/2)-150},
        size={width=400,height=300},
        backgroundColor={r=0,g=0,b=0,a=0.0},
        curentSection="main",
        isPermanent=false,
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
                        size={width=150,height=30},
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
                               Resources.modules.levelsManager.loadNextLevel()
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
                        size={width=150,height=30},
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
                        size={width=150,height=30},
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
                        size={width=150,height=30},
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

return myMenu