-----------------------------------------------------------------------------------------
--
-- Home Screen
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.DarkStatusBar)
local composer = require "composer"
local scene = composer.newScene()



function scene:create (event)
	homeScreenGroup = self.view

	--SET UP BACKRGROUND RECTANGLE SO THAT COLOR CAN BE CHANGED EASILY
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(0, 0.6, 0)

	button1 = display.newRect(display.contentWidth/2, display.contentHeight/2 - 100, 240, 110)
	button1:setStrokeColor(.6,0,0)
	button1Text = display.newText("Encrypt Message", display.contentWidth/2, display.contentHeight/2 - 100, nil, 30)
	button1Text:setFillColor(0,0,0)
	

	button2 = display.newRect(display.contentWidth/2, display.contentHeight/2 + 100, 240, 110)
	button2:setStrokeColor(.6,0,0)
	button2Text = display.newText("Decrypt Message", display.contentWidth/2, display.contentHeight/2 + 100, nil, 30)
	button2Text:setFillColor(0,0,0)

	homeScreenGroup:insert(background)
	homeScreenGroup:insert(button1)
	homeScreenGroup:insert(button1Text)
	homeScreenGroup:insert(button2)
	homeScreenGroup:insert(button2Text)
end

local function ButtonTap1 (event)
	composer.gotoScene("Encrypt", {effect = "slideLeft", time = 300})
end

local function ButtonTap2 (event)
	composer.gotoScene("Decrypt", {effect = "slideLeft", time = 300})
end

function scene:show(event)
	button1:addEventListener("tap", ButtonTap1)
	button2:addEventListener("tap", ButtonTap2)
end


function scene:hide(event)
	button1:addEventListener("tap", ButtonTap1)
	button2:addEventListener("tap", ButtonTap2)
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene