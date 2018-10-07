display.setStatusBar(display.DarkStatusBar)
local composer = require "composer"
local scene = composer.newScene()



function scene:create (event)
	homeScreenGroup = self.view
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
	setting = display.newImage("settingIcon.png", display.viewableContentWidth + 25, display.viewableContentHeight -435)

	--SETTING UP THE BUTTONS FOR FIRST PAGE
	button1 = display.newRect (display.contentWidth/2, 30, 150, 35)
--	button1 = display.newImage("Day_1.jpg", display.contentWidth/2, 30)
	button1.strokeWidth = 2
	button1:setStrokeColor(0,0,0)
	day1Text = display.newText("Day 1", display.contentWidth/2, 30, nil, 20)
	day1Text:setFillColor(.6,0,0) --MAROON COLOR #6F0000

	button2 = display.newRect (display.contentWidth/2, 100, 150, 35)
	button2.strokeWidth = 2
	button2:setStrokeColor(0,0,0)
	day2Text = display.newText("Day 2", display.contentWidth/2, 100, nil, 20)
	day2Text:setFillColor(.6,0,0)

	button3 = display.newRect (display.contentWidth/2, 170, 150, 35)
	button3.strokeWidth = 2
	button3:setStrokeColor(0,0,0)
	day3Text = display.newText("Day 3", display.contentWidth/2, 170, nil, 20)
	day3Text:setFillColor(.6,0,0)

	button4 = display.newRect (display.contentWidth/2, 240, 150, 35)
	button4.strokeWidth = 2
	button4:setStrokeColor(0,0,0)
	day4Text = display.newText("Day 4", display.contentWidth/2, 240, nil, 20)
	day4Text:setFillColor(.6,0,0)

	button5 = display.newRect (display.contentWidth/2, 310, 150, 35)
	button5.strokeWidth = 2
	button5:setStrokeColor(0,0,0)
	day5Text = display.newText("Day 5", display.contentWidth/2, 310, nil, 20)
	day5Text:setFillColor(.6,0,0)

	button6 = display.newRect (display.contentWidth/2, 380, 150, 35)
	button6.strokeWidth = 2
	button6:setStrokeColor(0,0,0)
	day6Text = display.newText("Day 6", display.contentWidth/2, 380, nil, 20)
	day6Text:setFillColor(.6,0,0)

	button7 = display.newRect (display.contentWidth/2, 450, 150, 35)
	button7.strokeWidth = 2
	button7:setStrokeColor(0,0,0)
	day7Text = display.newText("Day 7", display.contentWidth/2, 450, nil, 20)
	day7Text:setFillColor(.6,0,0)

	homeScreenGroup:insert(background)
	homeScreenGroup:insert(setting)
	homeScreenGroup:insert(button1)
	homeScreenGroup:insert(day1Text)
	homeScreenGroup:insert(button2)
	homeScreenGroup:insert(day2Text)
	homeScreenGroup:insert(button3)
	homeScreenGroup:insert(day3Text)
	homeScreenGroup:insert(button4)
	homeScreenGroup:insert(day4Text)
	homeScreenGroup:insert(button5)
	homeScreenGroup:insert(day5Text)
	homeScreenGroup:insert(button6)
	homeScreenGroup:insert(day6Text)
	homeScreenGroup:insert(button7)
	homeScreenGroup:insert(day7Text)
end

function settingButton(event)
	composer.gotoScene("settings", {effect = "fade", time = 200})
	
	aBandField.text = ""
	bBandField.text = ""
	cBandField.text = ""
	breakField.text = ""
	advisingField.text = ""
	lunchField.text = ""
	dBandField.text = ""
	fBandField.text = ""
	gBandField.text = ""
	communityField.text = ""
end


local function ButtonTap1 (event)
	composer.gotoScene("Day1", {effect = "fromRight", time = 225})
end

local function ButtonTap2 (event)
	composer.gotoScene("Day2", {effect = "fromRight", time = 225})
end

local function ButtonTap3 (event)
	composer.gotoScene("Day3", {effect = "fromRight", time = 225})
end

local function ButtonTap4 (event)
	composer.gotoScene("Day4", {effect = "fromRight", time = 225})
end

local function ButtonTap5 (event)
	composer.gotoScene("Day5", {effect = "fromRight", time = 225})
end

local function ButtonTap6 (event)
	composer.gotoScene("Day6", {effect = "fromRight", time = 225})
end

local function ButtonTap7 (event)
	composer.gotoScene("Day7", {effect = "fromRight", time = 225})
end


function scene:show(event)
	button1:addEventListener("tap", ButtonTap1)
	button2:addEventListener("tap", ButtonTap2)
	button3:addEventListener("tap", ButtonTap3)
	button4:addEventListener("tap", ButtonTap4)
	button5:addEventListener("tap", ButtonTap5)
	button6:addEventListener("tap", ButtonTap6)
	button7:addEventListener("tap", ButtonTap7)
	setting:addEventListener("tap", settingButton)
end

function scene:hide(event)
	button1:addEventListener("tap", ButtonTap1)
	button2:addEventListener("tap", ButtonTap2)
	button3:addEventListener("tap", ButtonTap3)
	button4:addEventListener("tap", ButtonTap4)
	button5:addEventListener("tap", ButtonTap5)
	button6:addEventListener("tap", ButtonTap6)
	button7:addEventListener("tap", ButtonTap7)
	setting:addEventListener("tap", settingButton)
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene

--MAYBE PUT THE SETTINGS PAGE OVER HERE SO THAT YOU CAN GO STRAIGHT TO THE HOME PAGE INSTEAD OF EACH INDIVIDUAL PAGE