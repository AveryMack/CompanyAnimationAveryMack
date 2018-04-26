-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Avery Mack
-- Date: April 10, 2018
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local logo
local scrollSpeed = 8
local FAZGames = audio.loadSound("sounds/Woosh-boomEdited.mp3")
local FAZGamesChannel
local FAZGamesText

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

local rotationSpeed = 3
local speed = 3


-- The function that moves the puppy across the screen and makes it rotate and fade in
local function moveLogo()
    logo.alpha = logo.alpha + 0.008
    logo.x = logo.x + scrollSpeed
    logo.rotation = logo.rotation + speed
    FAZGamesText.alpha = FAZGamesText.alpha + 0.008
end



-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    -- Insert the puppy image
    logo = display.newImageRect("Images/CompanyLogoAvery.png", 200, 200)

    -- create the text that will say Faz Games
    FAZGamesText = display.newText("FAZ Games", display.contentWidth/2, display.contentHeight*0.5/3, nil, 50)
    FAZGamesText:setTextColor(1,1,1)
    FAZGamesText.alpha = 0

    -- make the logo transpearent 
    logo.alpha = 0

    -- set the initial x and y position of the puppy
    logo.x = 100
    logo.y = display.contentHeight/2

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( logo )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene

    -----------------------------------------------------------------------------------------
    local sceneGroup = self.view

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        FAZGamesChannel = audio.play( FAZGames )

        -- Call the movepuppy function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveLogo)


    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen
        audio.stop(FAZGamesChannel)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
