-- RESTART PAGE
--4/12/16

display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
local scene = composer.newScene()

function scene:create (event)
	restartScreen = self.view

	--composer.removeScene("gamePlay")

	local whiteRectangle = display.newRect(restartScreen, display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
	whiteRectangle:setFillColor(0,0,0)

	restartButton = display.newImage("restart.png")
	restartButton.x = display.contentWidth/2
	restartButton.y = display.contentHeight/2
	restartButton.width = 64
	restartButton.height = 64

	restartScreen:insert(restartButton)


	--THIS BUTTON TO GO BACK TO THE GAME
	local function restartButtonFunction(event)
		restartScreen.alpha = 0
		restartScreen:removeSelf()
		composer.gotoScene("gamePlay", {time = 80})
		score = 0
		health = 3
		timer.resume(asteroidTimer1)
		timer.resume(asteoroidTimer2)
		timer.resume(starTimer1)
		timer.resume(starTimer2)		
		timer.resume(timerScoreUpdating)
	end

	restartButton:addEventListener("tap", restartButtonFunction)

end

function scene:show(event)
	
end

function scene:hide(event)
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene



