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
	playScreenGroup = self.view
	width = display.contentWidth/2
	height = display.contentHeight/2

	red1 = 0
	green1 = 0
	blue1 = 0

	red2 = 0
	green2 = 0
	blue2 = 0

	score = 0
	streak = 0

	timerNumber = 900

	radii = width*.9

	circle1 = display.newCircle(width, height, width/3)
	circle2 = display.newCircle(width, height, radii)
	circle2:setFillColor(0,0,0)
	text = display.newText("", width, height, native.systemFont, 60)
	text:setFillColor(0,0,0)
	scoreText = display.newText("Score: "..score, width, height/8, native.systemFont, 60)
	streakText = display.newText("Streak: "..streak, width, scoreText.y - 80, native.systemFont, 60)
	radomizeNumbers()

	resetButton = display.newText("Reset", width, height*1.95, native.systemFont, 40)
	backButton = display.newText("< Back", width/6, streakText.y, native.systemFont, 35)

	playScreenGroup:insert(circle2)
	playScreenGroup:insert(circle1)
	playScreenGroup:insert(text)
	playScreenGroup:insert(scoreText)
	playScreenGroup:insert(streakText)
	playScreenGroup:insert(resetButton)
	playScreenGroup:insert(backButton)

	function checkClick(event)
		if (randomNumText == randomNumCircle)then
			score = score + 1
			streak = streak + 1
			timerNumber = timerNumber - 20
		else
			score = score - 1
			streak = 0
			timerNumber = 900
		end
		scoreText.text = "Score: "..score
		streakText.text = "Streak: "..streak
		print(timerNumber)
	end
	circle1:addEventListener("tap", checkClick)

	function reset(event)
		score = 0
		streak = 0
		scoreText.text = "Score: "..score
		streakText.text = "Streak: "..streak
	end
	resetButton:addEventListener("tap", reset)

	function back(event)
		composer.gotoScene("startScreen")
		score = 0
		streak = 0
	end
	backButton:addEventListener("tap", back)


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
			green2 = 0
			blue2 = 1
			text:setFillColor(0,0,0)
		elseif randomNumCircle == 2 then
			red1 = 1
			green1 = 1
			blue1 = 1
			red2 = 0
			green2 = 1
			blue2 = 0
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

		if randomNumText == 0 then
			text.text = "Red"
		elseif randomNumText == 1 then
			text.text = "Blue"
		elseif randomNumText == 2 then
			text.text = "Green"
		elseif randomNumText == 3 then
			text.text = "Yellow"
		end
			circle2:setFillColor(red2, green2, blue2)
			circle1:setFillColor(red1, green1, blue1)
	end
	timer1 = timer.performWithDelay(timerNumber, radomizeNumbers, 0)
end




function scene:show(event)
	
end

function scene:hide(event)
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene