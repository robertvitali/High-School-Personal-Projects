-- ROCKET SHIP GAME PRODUCED BY ROBERT VITALI
--MAIN FILE
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")
local composer = require "composer"
--composer.recycleOnSceneChange = true

local sceneGroup = display.newGroup()

splashscreenbg = display.newRect(sceneGroup, display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)

local function removeSplash(event)
sceneGroup:removeSelf()
sceneGroup=nil
composer.gotoScene("gamePlay", {effect = "zoomInOutFade", time = 380})
end 
timer.performWithDelay(2000,removeSplash)