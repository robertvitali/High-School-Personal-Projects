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

	


	circle1 = display.newCircle(width/2, height/2, width/3 - 15)
	circle2 = display.newCircle(circle1.x, circle1.y, width/3 + 45)
	circle2:setFillColor(1,0,0)
	text = display.newText("Free Play", circle1.x, circle1.y, native.systemFont, 40)
	text:setFillColor(0,0,0)
	
	circle3 = display.newCircle((width + width/2), height/2, width/3 - 15)
	circle4 = display.newCircle(circle3.x, circle3.y, width/3 + 45)
	circle4:setFillColor(0,1,0)
	text2 = display.newText("Time Trial", circle3.x, circle3.y, native.systemFont, 40)
	text2:setFillColor(0,0,0)

	circle5 = display.newCircle(width/2, (height + height/2), width/3 - 15)
	circle6 = display.newCircle(circle5.x, circle5.y, width/3 + 45)
	circle6:setFillColor(0,0,1)
	text3 = display.newText("Elite Play", circle5.x, circle5.y, native.systemFont, 40)
	text3:setFillColor(0,0,0)

	circle7 = display.newCircle((width + width/2), (height + height/2), width/3 - 15)
	circle8 = display.newCircle(circle7.x, circle7.y, width/3 + 45)
	circle8:setFillColor(1,1,0)
	text4 = display.newText("High Scores", circle7.x, circle7.y, native.systemFont, 38)
	text4:setFillColor(0,0,0)


	circle1.alpha = .5
	circle3.alpha = .5
	circle5.alpha = .5
	circle7.alpha = .5



	startScreenGroup:insert(circle2)
	startScreenGroup:insert(circle1)
	startScreenGroup:insert(text)
	startScreenGroup:insert(circle4)
	startScreenGroup:insert(circle3)
	startScreenGroup:insert(text2)
	startScreenGroup:insert(circle6)
	startScreenGroup:insert(circle5)
	startScreenGroup:insert(text3)
	startScreenGroup:insert(circle8)
	startScreenGroup:insert(circle7)
	startScreenGroup:insert(text4)

	function play()
		composer.gotoScene("startScreen1", {effect = "zoomInOutFade", time = 180} )
	end
	circle2:addEventListener("tap", play)
	circle4:addEventListener("tap", play)
	circle6:addEventListener("tap", play)

	function tap1()
		number = 1
	end
	circle2:addEventListener("tap", tap1)

	function tap2()
		number = 2
	end
	circle4:addEventListener("tap", tap2)

	function tap3()
		number = 3
	end
	circle6:addEventListener("tap", tap3)
end

function scene:show(event)
	
end

function scene:hide(event)
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene