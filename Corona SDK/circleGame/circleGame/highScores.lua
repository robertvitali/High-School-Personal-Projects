-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")
local composer = require "composer"
local scene = composer.newScene()

lastScene = composer.getSceneName("previous")

function scene:create (event)
	highScoreGroup = self.view
	width = display.contentWidth/2
	height = display.contentHeight/2
	
	red1 = 0
	blue1 = 0
	green1 = 0
	
	radomizeNumbers()
	backButton = display.newText("<", width/6, 50, native.systemFont, display.contentHeight/16)
		backButton.y = backButton.height*1.1

	rectangle1 = display.newRect(0,0, display.contentWidth, display.contentHeight+200)
		rectangle1.x = width
		rectangle1.y = height
		rectangle1:setFillColor(red1, green1, blue1)

	--High score text
	text1 = display.newText("High Scores:", width, backButton.y, native.systemFont, display.contentHeight/16)
	--Free Play text
	text2 = display.newText("Free Play:", display.contentWidth/2, text1.y, native.systemFont, display.contentHeight/22)
		text2.y = text1.y + text1.height 
		text2.x = text1.x - text1.width/2 + text2.width/2
	--first high score listing
	highScoreText1 = display.newText(("1. "..dataLocal.highScoreFPU1..": "..dataLocal.highScoreFP1), display.contentWidth, display.contentHeight, native.systemFont, display.contentHeight/27)
		highScoreText1.x = text2.x - text2.width/2 + highScoreText1.width/2
		highScoreText1.y = text2.y + text2.height 
	--second high score listing
	highScoreText2 = display.newText(("2. "..dataLocal.highScoreFPU2..": "..dataLocal.highScoreFP2), display.contentWidth, display.contentHeight, native.systemFont, display.contentHeight/27)
		highScoreText2.x = text2.x - text2.width/2 + highScoreText2.width/2
		highScoreText2.y = text2.y + text2.height + highScoreText2.height
	--third high score listing
	highScoreText3 = display.newText(("3. "..dataLocal.highScoreFPU3..": "..dataLocal.highScoreFP3), display.contentWidth, display.contentHeight, native.systemFont, display.contentHeight/27)
		highScoreText3.x = text2.x - text2.width/2 + highScoreText3.width/2
		highScoreText3.y = text2.y + text2.height + highScoreText2.height + highScoreText3.height

	highScoreGroup:insert(rectangle1)
	highScoreGroup:insert(backButton)
	highScoreGroup:insert(text1)
	highScoreGroup:insert(text2)
	highScoreGroup:insert(highScoreText1)
	highScoreGroup:insert(highScoreText2)
	highScoreGroup:insert(highScoreText3)

	


	function back(event)
		composer.gotoScene("startScreen")
		highScoreGroup:removeSelf()
	end
	backButton:addEventListener("tap", back)
end

	function radomizeNumbers()
		randomNum = math.random(0, 2)
		if randomNum == 0 then
			red1 = 1
			green1 = 0
			blue1 = 0
		elseif randomNum == 1 then
			red1 = 0
			green1 = 1
			blue1 = 0
		elseif randomNum == 2 then
			red1 = 0
			green1 = 0
			blue1 = 1
		end
	end

function scene:show(event)
	
end

function scene:hide(event)
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene