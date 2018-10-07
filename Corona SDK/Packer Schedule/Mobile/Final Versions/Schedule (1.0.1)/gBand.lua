local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"
require("extensions.table")

--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
--TEXT BOXES?

local lastScene = composer.getSceneName("previous")

function scene:create (event)
	gBandGroup1 = self.view
	
	--SET UP BACKRGROUND RECTANGLE SO THAT COLOR CAN BE CHANGED EASILY
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
	--THE LOCAL TEMP USED TO BE TEMPORARY TEXT- NOW IS TITLE TEXT FOR EACH PAGE
	local temp = display.newText(UserInfo.gBand, display.contentWidth/2, display.contentHeight-430, native.systemFont, 20)
		if(UserInfo.gBand == "") then
			temp.text = "G Band"
		end
		
		temp:setFillColor(0,0,0)
	--THIS ALLOWS FOR THE TITLE OF THIS PAGE TO CHANGE IF THE NAME OF THE BAND IS CHANGED
--	if(gBandField.text ~= "")then
--		temp = display.newText(gBandField.text, display.contentWidth/2, 0, native.systemFont, 20)
--	end
--	temp:setFillColor(0,0,0)
	
	back = widget.newButton
	{
	left = 0,
	top = -15,
	width = 60,
	height = 20,
	id = "back",
	label = "< Back",
	labelColor = {default = {0,0,0}, over = {0,0,0}}
	}
	
	save = widget.newButton
	{
	left = 260,
	top = -15,
	width = 60,
	height = 20,
	id = "save",
	label = " Save",
	labelColor = {default = {0,0,0}, over = {0,0,0}}
	}
	
	reset = widget.newButton
	{
	left = display.contentWidth/2 - 25,
	top = display.contentHeight - 10,
	width = 20,
	height = 20,
	id = "reset",
	label = " Reset",
	labelColor = {default = {0,0,0}, over = {0,0,0}}
	}
	
	local notesText = display.newText("Homework: ", 65, display.contentHeight/2 - 140, nil, 24)
		notesText:setFillColor(0,0,0)
	local notes1 = native.newTextBox(display.contentWidth/2, display.contentHeight/2-10, 310, 225)
		notes1.text = UserInfo.gBandHomework
		notes1.size=28
		notes1:setTextColor(0,0,0)
	
		if(UserInfo.gBandHomework == "")then
		notes1.placeholder = "Write Your Homework Here"
		else
		notes1.text = UserInfo.gBandHomework
		end
	
		notes1.isEditable = true
		notes1.size = 20
		notes1:setTextColor(0,0,0)

	--INSERTING EACH ELEMENT OF THE PAGE INTO THE GROUP TO MAKE REMOVAL EASIER
	gBandGroup1:insert(background)
	gBandGroup1:insert(temp)
	gBandGroup1:insert(back)
	gBandGroup1:insert(save)
	gBandGroup1:insert(reset)
	gBandGroup1:insert(notesText)
	gBandGroup1:insert(notes1)

function keyboardListener(event)
	native.setKeyboardFocus(nil)
end

	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function backButton(event)
		notes1.isVisible = false
		native.setKeyboardFocus(nil)
		table.save(UserInfo, "userstuff")
		composer.gotoScene(lastScene, {effect = "fromLeft", time = 200})
	end
	
	local function saveButton(event)
		UserInfo.gBandHomework = notes1.text
		table.print_r(UserInfo)
		table.save(UserInfo, "userstuff")
		notes1.text = UserInfo.gBandHomework
		backButton()
	end

	local function resetButton(event)
		UserInfo.gBandHomework = ""
		table.print_r(UserInfo)
		table.save(UserInfo, "userstuff")
		backButton()
	end

	background:addEventListener("tap", keyboardListener)
	back:addEventListener("tap", backButton)
	save:addEventListener("tap", saveButton)
	reset:addEventListener("tap", resetButton)
end



--THIS FUNCTION HIDES THE WHOLE PAGE
function scene:hide (event)

end

--THIS FUNCTION SHOWS THE NEXT EVENT
function scene:show (event)

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene

--[[	PROBLEMS TO RESOLVE
1) TEXT BOX DOESN'T WORK
2) THE TITLE TEXT (TEMP) DOESN'T CHANGE WHEN THE gBandFIELD TEXT IS CHANGED
]]