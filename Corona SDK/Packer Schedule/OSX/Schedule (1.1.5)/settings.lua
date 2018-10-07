-- new settings page


local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"
require("extensions.table")

--TO MAKE SURE THAT THE INFO WAS SAVED
local function saveButtonEvent (event)
	local phase = event.phase
	
	if "ended" == phase then
		print ("Information saved")
	end
end

local height = display.contentHeight/30
local height2 = display.contentHeight/12

local temp = display.newText("Settings", display.contentWidth/2, height, native.systemFont, 20)
	temp:setFillColor(0,0,0)
	
local back = widget.newButton
	{
		left = 0,
		top = temp.y - 15,
		height = 20,
		width = 60,
		id = "back",
		label = "< Back",
		labelColor = {default = {0,0,0}, over = {0,0,0}} ,
	}
	
local save = widget.newButton
	{
		left = display.contentWidth - 60,
		top = temp.y - 15,
		width = 60, 
		height = 20,
		id = "save",
		label = " Save",
		labelColor = {default = {0,0,0}, over = {0,0,0}},
	}
	
local reset = widget.newButton
	{
		left = display.contentWidth/2-30,
		top = display.viewableContentHeight,
		width = 60,
		height = 20,
		id = "reset",
		label = " Reset",
		labelColor = {default = {0,0,0}, over = {0,0,0}},
	}
	
local ruler = display.newLine(0,temp.y + (temp.height/2) + 2, display.contentWidth, temp.y + (temp.height/2) + 2)
	ruler.strokeWidth = 1
	ruler:setStrokeColor(0,0,0)

--TO MAKE SURE THAT THE BACK BUTTON WAS PRESSED AND WORKS
local function backButtonEvent (event)
	local phase = event.phase
	
	if "ended" == phase then
		print ("Returned to Day 1 page")
	end
end

local scrollView = widget.newScrollView
	{
		backgroundColor = {0.6, 0, 0},
		left = 0,
		top= -(45),
		width = display.contentWidth,
		height = display.contentHeight + 100,
		topPadding = 30,
		bottomPadding = 40,
		horizontalScrollDisabled = true,
		verticalScrollDisabled = false,
	}
--	scrollView:setIsLocked( true )

-- scrolls the page up when the user taps in a textfield
	local function contactListener( event )
    	    if event.phase == "began" then
			temp.alpha = 0
			ruler.alpha = 0
			save.alpha = 0
			back.alpha = 0
			reset.alpha = 0
        	scrollView:scrollToPosition
			{
    			y = -150,
    			time = 600,
			}
		elseif event.phase == "ended" then
			temp.alpha = 1
			ruler.alpha = 1
			save.alpha = 1
			back.alpha = 1
			reset.alpha = 1
			scrollView:scrollToPosition
			{
    			y = 30,
    			time = 400,
			}
    	     end
	end

--CREATING SCENE HERE
function scene:create (event)
	local settingsGroup = self.view
	
	background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, 670)
		background:setFillColor(.6,0,0)
		
	aText = display.newText("A Band: ", 72, height2 + 4, native.systemFont, 14)
		aText:setFillColor(0,0,0)
	aBandField = native.newTextField(200, aText.y + 2, 200, 22)
	aBandField.text = UserInfo.aBand
	local period2Border = display.newRect(200, aText.y + 2, 201, 23)
		period2Border.strokeWidth = 3
		period2Border:setStrokeColor(0,0,0)
		aBandField.inputType = "default"
		
	bText = display.newText("B Band: ", 72, 2*height2 + 4, native.systemFont, 14)
		bText:setFillColor(0,0,0)
	bBandField = native.newTextField(200, bText.y + 2, 200, 22)
	bBandField.text = UserInfo.bBand
	local period3Border = display.newRect(200, bText.y + 2, 201, 23)
		period3Border.strokeWidth = 3
		period3Border:setStrokeColor(0,0,0)
	bBandField.inputType = "default"

	cText = display.newText("C Band: ", 72, 3*height2 + 4, native.systemFont, 14)
		cText:setFillColor(0,0,0)
	cBandField = native.newTextField(200, cText.y + 2, 200, 22)
	cBandField.text = UserInfo.cBand
	local period4Border = display.newRect(200, cText.y + 2, 201, 23)
		period4Border.strokeWidth = 3
		period4Border:setStrokeColor(0,0,0)
		cBandField.inputType = "default"

	breakText = display.newText("Break: ", 76, 4*height2 + 4, native.systemFont, 14)
		breakText:setFillColor(0,0,0)
	breakField = native.newTextField(200, breakText.y + 2, 200, 22)
	breakField.text = UserInfo.myBreak
	local period5Border = display.newRect(200, breakText.y + 2, 201, 23)
		period5Border.strokeWidth = 3
		period5Border:setStrokeColor(0,0,0)
		breakField.inputType = "default"

	advisingText = display.newText("Advising: ", 70, 5*height2 +4, native.systemFont, 14)
		advisingText:setFillColor(0,0,0)
	advisingField = native.newTextField(200, advisingText.y + 2, 200, 22)
	advisingField.text = UserInfo.advising
	local period6Border = display.newRect(200, advisingText.y + 2, 201, 23)
		period6Border.strokeWidth = 3
		period6Border:setStrokeColor(0,0,0)
	advisingField.inputType = "default"

	lunchText = display.newText("Lunch: ", 75, 6*height2 + 4, native.systemFont, 14)
		lunchText:setFillColor(0,0,0)
	lunchField = native.newTextField(200, lunchText.y + 2, 200, 22)
	lunchField.text = UserInfo.lunch
	local period7Border = display.newRect(200, lunchText.y + 2, 201, 23)
		period7Border.strokeWidth = 3
		period7Border:setStrokeColor(0,0,0)
		lunchField.inputType = "default"

	dText = display.newText("D Band: ", 72, 7*height2+4, native.systemFont, 14)
		dText:setFillColor(0,0,0)		
	dBandField = native.newTextField(200, dText.y + 2, 200, 22)
	dBandField.text = UserInfo.dBand
	local period8Border = display.newRect(200, dText.y + 2, 201, 23)
		period8Border.strokeWidth = 3
		period8Border:setStrokeColor(0,0,0)
	dBandField.inputType = "default"
	
	eText = display.newText("E Band: ", 72, 8*height2+ 4, native.systemFont, 14)
		eText:setFillColor(0,0,0)		
	eBandField = native.newTextField(200, eText.y + 2, 200, 22)
	eBandField.text = UserInfo.eBand
	local period9Border = display.newRect(200, eText.y + 2, 201, 23)
		period9Border.strokeWidth = 3
		period9Border:setStrokeColor(0,0,0)
	eBandField.inputType = "default"

	fText = display.newText("F Band: ", 72, 9*height2+4, native.systemFont, 14)
		fText:setFillColor(0,0,0)
	fBandField = native.newTextField(200, fText.y + 2, 200, 22)
	dBandField.text = UserInfo.dBand
	local period10Border = display.newRect(200, fText.y + 2, 201, 23)
		period10Border.strokeWidth = 3
		period10Border:setStrokeColor(0,0,0)
		fBandField.inputType = "default"

	gText = display.newText("G Band: ", 72, 10*height2+4, native.systemFont, 14)
		gText:setFillColor(0,0,0)
	gBandField = native.newTextField(200, gText.y + 2, 200, 22)
	gBandField.text = UserInfo.gBand
	local period11Border = display.newRect(200, gText.y + 2, 201, 23)
		period11Border.strokeWidth = 3
		period11Border:setStrokeColor(0,0,0)
	gBandField.inputType = "default"
	
	communityText = display.newText("Community: ", 55, 11*height2 + 4, native.systemFont, 14)
		communityText:setFillColor(0,0,0)
	communityField = native.newTextField(200, communityText.y + 2, 200, 22)
	communityField.text = UserInfo.community
	local period12Border = display.newRect(200, communityText.y + 2, 201, 23)
		period12Border.strokeWidth = 3
		period12Border:setStrokeColor(0,0,0)
	communityField.inputType = "default"
	
	scrollView:insert(background)
	scrollView:insert(temp)
	scrollView:insert(ruler)
	scrollView:insert(back)
	scrollView:insert(save)
	scrollView:insert(reset)
	scrollView:insert(aBandField)
	scrollView:insert(bBandField)
	scrollView:insert(cBandField)
	scrollView:insert(dBandField)
	scrollView:insert(eBandField)
	scrollView:insert(fBandField)
	scrollView:insert(gBandField)
	scrollView:insert(breakField)
	scrollView:insert(advisingField)
	scrollView:insert(lunchField)
	scrollView:insert(communityField)
	scrollView:insert(aText)
	scrollView:insert(bText)
	scrollView:insert(cText)
	scrollView:insert(dText)
	scrollView:insert(eText)
	scrollView:insert(fText)
	scrollView:insert(gText)
	scrollView:insert(breakText)
	scrollView:insert(advisingText)
	scrollView:insert(lunchText)
	scrollView:insert(communityText)
	scrollView:insert(period2Border)
	scrollView:insert(period3Border)
	scrollView:insert(period4Border)
	scrollView:insert(period5Border)
	scrollView:insert(period6Border)
	scrollView:insert(period7Border)
	scrollView:insert(period8Border)
	scrollView:insert(period9Border)
	scrollView:insert(period10Border)
	scrollView:insert(period11Border)
	scrollView:insert(period12Border)
	settingsGroup:insert(scrollView)

	
	-- include the event listener for each textfield that you want it to scrollup
	dBandField:addEventListener( "userInput", contactListener)
	eBandField:addEventListener( "userInput", contactListener)
	fBandField:addEventListener( "userInput", contactListener)
	gBandField:addEventListener( "userInput", contactListener)
	lunchField:addEventListener( "userInput", contactListener)
	communityField:addEventListener( "userInput", contactListener)



	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
		scrollView:scrollToPosition
			{
    			y = 30,
    			time = 400,
			}
	end

	local function backButton(event)
	aBandField.isVisible = false
	bBandField.isVisible = false
	cBandField.isVisible = false
	dBandField.isVisible = false
	eBandField.isVisible = false
	fBandField.isVisible = false
	gBandField.isVisible = false
	breakField.isVisible = false
	advisingField.isVisible = false
	lunchField.isVisible = false
	communityField.isVisible = false
		native.setKeyboardFocus(nil)
		composer.gotoScene("HomeScreen", {effect = "fade", time = 200})
	end

	local function saveButton(event)
		composer.loadScene("Day1")
		composer.loadScene("Day2")
		composer.loadScene("Day3")
		composer.loadScene("Day4")
		composer.loadScene("Day5")
		composer.loadScene("Day6")
		composer.loadScene("Day7")
		UserInfo.aBand=aBandField.text
		UserInfo.bBand=bBandField.text
		UserInfo.cBand=cBandField.text
		UserInfo.dBand=dBandField.text
		UserInfo.eBand=eBandField.text
		UserInfo.fBand=fBandField.text
		UserInfo.gBand=gBandField.text
		UserInfo.myBreak=breakField.text
		UserInfo.advising=advisingField.text
		UserInfo.community=communityField.text
		UserInfo.lunch=lunchField.text
		--SAVES THE INPUT INTO A FILE
		table.print_r(UserInfo)
		table.save(UserInfo, "userstuff")
	
		backButton() -- return to homescreen
	

	end --ENDS SAVE BUTTON FUNCTION

		local function resetSettings(event)
			UserInfo.aBand = ""
			UserInfo.bBand = ""
			UserInfo.cBand = ""
			UserInfo.dBand = ""
			UserInfo.eBand = ""
			UserInfo.fBand = ""
			UserInfo.gBand = ""
			UserInfo.advising = ""
			UserInfo.myBreak = ""
			UserInfo.lunch = ""
			UserInfo.community = ""
		
			table.print_r(UserInfo)
			table.save(UserInfo, "userstuff")
			
			backButton()
		end

	background:addEventListener("tap", keyboardListener)
	back:addEventListener("tap", backButton)
	save:addEventListener("tap", saveButton)
	reset:addEventListener("tap", resetSettings)
end  -- end of create scene



function scene:hide (event)

end

function scene:show (event)

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene

--[[NOTES
]]