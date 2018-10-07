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


	circle1 = display.newCircle(width, height, width/3)
	circle2 = display.newCircle(width, height, radii)
	circle2:setFillColor(0,0,0)
	text = display.newText("Click Here\n   To Play", width, height, native.systemFont, 45)
	text:setFillColor(0,0,0)
	radomizeNumbers()
	changeColor()


	startScreenGroup:insert(circle2)
	startScreenGroup:insert(circle1)
	startScreenGroup:insert(text)

	function play()
		composer.gotoScene("gamePlay", {effect = "zoomInOutFade", time = 380} )
	end
	circle1:addEventListener("tap", play)
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