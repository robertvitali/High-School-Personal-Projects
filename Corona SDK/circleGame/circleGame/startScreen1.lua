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
	startScreenGroup = self.view
	width = display.contentWidth/2
	height = display.contentHeight/2
	
	red1 = 0
	green1 = 0
	blue1 = 0

	red2 = 0
	green2 = 0
	blue2 = 0

	score = 0

	radii = width*.9

	--white smaller circle
	circle1 = display.newCircle(width, height, width/3)
	--colorful circle
	circle2 = display.newCircle(width, height, radii)
		circle2:setFillColor(0,0,0)
	--text in middle of circle
	text = display.newText("Click To\n   Start", width, height, native.systemFont, display.contentHeight/25)
		text:setFillColor(0,0,0)
	--Exit button
	backButton = display.newText("Exit", width/6, display.contentHeight, native.systemFont, display.contentHeight/30)
		backButton.y = display.viewableContentHeight - backButton.height/2
	radomizeNumbers()
	changeColor()


	startScreenGroup:insert(circle2)
	startScreenGroup:insert(circle1)
	startScreenGroup:insert(text)
	startScreenGroup:insert(backButton)

	function play()
		if number == 1 then
			composer.gotoScene("gamePlay1")
		elseif number == 2 then
			composer.gotoScene("gamePlay3")
		elseif number == 3 then
			composer.gotoScene("gamePlay2")
		end
		score = 0
		number = 0
		timer.resume(timer1)
	end
	circle1:addEventListener("tap", play)

	function back(event)
		composer.gotoScene("startScreen")
		score = 0
	end
	backButton:addEventListener("tap", back)
end


function radomizeNumbers(event)
	randomNumCircle = math.random(0, 3)
	randomNumText = math.random(0,3)
	if randomNumCircle == 0 then
		red1 = 1
		green1 = 1
		blue1 = 1
		red2 = 1
		green2 = 0
		blue2 = 0
		text:setFillColor(0,0,0)
	elseif randomNumCircle == 1 then
		red1 = 1
		green1 = 1
		blue1 = 1
		red2 = 0
		green2 = 1
		blue2 = 0
		text:setFillColor(0,0,0)
	elseif randomNumCircle == 2 then
		red1 = 1
		green1 = 1
		blue1 = 1
		red2 = 0
		green2 = 0
		blue2 = 1
		text:setFillColor(0,0,0)
	elseif randomNumCircle == 3 then
		red1 = 1
		green1 = 1
		blue1 = 1
		red2 = 1
		green2 = 1
		blue2 = 0
		text:setFillColor(0,0,0)
	end
end


function changeColor(event)
	circle2:setFillColor(red2, green2, blue2)
	circle1:setFillColor(red1, green1, blue1)
end

function scene:show(event)
	
end

function scene:hide(event)
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene