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

	background = display.newRect(width, height, display.contentWidth, display.contentHeight)
		background:setFillColor(0,0,0)

	red1 = 0
	green1 = 0
	blue1 = 0

	red2 = 0
	green2 = 0
	blue2 = 0

	score = 0
	colorStreak = 0

	timerNumber = 900

	radii = width*.9

	circle1 = display.newCircle(width, height, width/3)
	circle2 = display.newCircle(width, height, radii)
	circle2:setFillColor(0,0,0)
	text = display.newText("", width, height, native.systemFont, display.contentHeight/18)
	text:setFillColor(0,0,0)
	scoreText = display.newText("Score: "..score, width, height/8, native.systemFont, display.contentHeight/18)
	radomizeNumbers2()

	saveButton = display.newText("Save Score", width, height*1.95, native.systemFontBold, display.contentHeight/26)
	backButton = display.newText("<", width/6, (height/8) - 80, native.systemFontBold, display.contentHeight/26)
		backButton.y = scoreText.y

	rectangle1 = display.newRect(0,0, display.contentWidth/1.5, width/1.8)
		rectangle1:setFillColor(0,0,0)
		rectangle1.x = width
		rectangle1.y = height
		rectangle1.alpha = 0
	rectangle2 = display.newRect(0,0, display.contentWidth/2, width/2 - 110)
		rectangle2.x = width
		rectangle2.y = height
		rectangle2.alpha = 0
	textField1 = native.newTextField(width, height, rectangle2.width, rectangle2.height)
		textField1.placeholder = "Player's Name"
		textField1.alpha = 0
	doneButton = display.newText("Save Name", width, height*1.95, native.systemFontBold, display.contentHeight/28)
		doneButton.alpha = 0
		doneButton.x = display.contentWidth/2
		doneButton.y = scoreText.y + 1.1*doneButton.height
	p1Bool = 0
	p2Bool = 0
	p3Bool = 0

	playScreenGroup:insert(background)
	playScreenGroup:insert(circle2)
	playScreenGroup:insert(circle1)
	playScreenGroup:insert(text)
	playScreenGroup:insert(scoreText)
	playScreenGroup:insert(saveButton)
	playScreenGroup:insert(backButton)

	function checkClick(event)
		if (randomNumText == randomNumCircle)then
			score = score + 1
			if timerNumber > 500 then
				timerNumber = timerNumber - 20
			end
		else
			if score >= 1 then
				score = score - 1
			end
			timerNumber = 900
		end
		scoreText.text = "Score: "..score
	end
	circle2:addEventListener("tap", checkClick)

	function save()
		timer.pause(timer1)
		playScreenGroup.alpha = .4
		rectangle1.alpha = .7
		rectangle2.alpha = 1
		textField1.alpha = 1
		doneButton.alpha = 1
		backButton.alpha = 0
		saveButton.alpha = 0
		if (score > dataLocal.highScoreFP1) then
			dataLocal.highScoreFP3 = dataLocal.highScoreFP2
			dataLocal.highScoreFP2 = dataLocal.highScoreFP1
			dataLocal.highScoreFP1 = score
			p1Bool = 1
		elseif (score > dataLocal.highScoreFP2) then
			dataLocal.highScoreFP3 = dataLocal.highScoreFP2
			dataLocal.highScoreFP2 = score
			p2Bool = 1
		elseif (score > dataLocal.highScoreFP3) then
			dataLocal.highScoreFP3 = score
			p3Bool = 1
		end
		table.save(dataLocal, "userstuff1")
	end
	saveButton:addEventListener("tap", save)

	function saveNameFunction()
		if p1Bool == 1 then
			dataLocal.highScoreFPU3 = dataLocal.highScoreFPU2
			dataLocal.highScoreFPU2 = dataLocal.highScoreFPU1
			dataLocal.highScoreFPU1 = textField1.text
			p1Bool = 0
		elseif p2Bool == 1 then
			dataLocal.highScoreFPU3 = dataLocal.highScoreFPU2
			dataLocal.highScoreFPU2 = textField1.text
			p2Bool = 0
		elseif p3Bool == 1 then
			dataLocal.highScoreFPU3 = textField1.text
			p3Bool = 0
		end
		table.save(dataLocal, "userstuff1")
		rectangle1.alpha = 0
		rectangle2.alpha = 0
		textField1.alpha = 0
		doneButton.alpha = 0
		playScreenGroup.alpha = 1
		native.setKeyboardFocus(nil)
		composer.gotoScene("highScores")
	end
	doneButton:addEventListener("tap", saveNameFunction)

	function back()
		composer.gotoScene("startScreen")
	end
	backButton:addEventListener("tap", back)

	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end

	background:addEventListener("tap", keyboardListener)

	-- scrolls the page up when the user taps in a textfield
	local function contactListener( event )
    	if event.phase == "began" then
			textField1.y = textField1.y - 150
			rectangle1.y = rectangle1.y - 150
			rectangle2.y = rectangle2.y - 150
		elseif event.phase == "ended" then
			textField1.y = textField1.y + 150
			rectangle1.y = rectangle1.y + 150
			rectangle2.y = rectangle2.y + 150
    	end
	end

	textField1:addEventListener("userInput", contactListener)

	function radomizeNumbers(event)
		randomNumCircle = math.random(0, 3)
		randomNumText = math.random(0,3)

		if randomNumText ~= randomNumCircle then
			colorStreak = colorStreak + 1
			if colorStreak > 7 then
				randomNumCircle = randomNumText
				colorStreak = 0
			end
		else
			colorStreak = 0
		end

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

function radomizeNumbers2(event)
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


function scene:show(event)
	
end

function scene:hide(event)
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene