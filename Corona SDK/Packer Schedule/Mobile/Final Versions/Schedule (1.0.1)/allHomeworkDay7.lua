local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"
require("extensions.table")

--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
--TEXT BOXES?

local lastScene = composer.getSceneName("previous")

function scene:create (event)
	allHomework1 = self.view
	
	--SET UP BACKRGROUND RECTANGLE SO THAT COLOR CAN BE CHANGED EASILY
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
	--THE LOCAL TEMP USED TO BE TEMPORARY TEXT- NOW IS TITLE TEXT FOR EACH PAGE
	local temp = display.newText("All Notes from "..lastScene, display.contentWidth/2, display.contentHeight-460, native.systemFont, 20)
		temp:setFillColor(1,1,1)
	--THIS ALLOWS FOR THE TITLE OF THIS PAGE TO CHANGE IF THE NAME OF THE BAND IS CHANGED
--	if(bBandField.text ~= "")then
--		temp = display.newText(bBandField.text, display.contentWidth/2, 0, native.systemFont, 20)
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
	--[[
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
	]]
	local notesText = display.newText("Assignments: ", 80, display.contentHeight/2 - 170, nil, 24)
		notesText:setFillColor(1,1,1)
	--local notes1 = native.newTextBox(display.contentWidth/2, display.contentHeight/2-10, 310, 225)
		--notes1.text = UserInfo.aBandHomework..UserInfo.bBandHomework
		--notes1.size=28
	if(UserInfo.gBand == "") then
		UserInfo.gBand = "G Band"
	end
	local notes1 = display.newText(UserInfo.gBand.." Homework: "..UserInfo.gBandHomework, display.contentWidth/2, display.contentHeight/2 - 130, nil, 20)
		notes1:setFillColor(1,1,1)

	if(UserInfo.fBand == "") then
		UserInfo.fBand = "F Band"
	end
	local notes2 = display.newText(UserInfo.fBand.." Homework: "..UserInfo.fBandHomework, display.contentWidth/2, display.contentHeight/2 - 90, nil, 20)
		notes2:setFillColor(1,1,1)

	if(UserInfo.advising == "") then
		UserInfo.advising = "Advising"
	end
	local notes3 = display.newText(UserInfo.advising.." Notes: "..UserInfo.advisingTasks, display.contentWidth/2, display.contentHeight/2 - 50, nil, 20)
		notes3:setFillColor(1,1,1)

	if(UserInfo.myBreak == "") then
		UserInfo.myBreak = "Break"
	end
	local notes4 = display.newText(UserInfo.myBreak.." Notes: "..UserInfo.breakTasks, display.contentWidth/2, display.contentHeight/2 - 10, nil, 20)
		notes4:setFillColor(1,1,1)

	if(UserInfo.eBand == "") then
		UserInfo.eBand = "E Band"
	end
	local notes5 = display.newText(UserInfo.eBand.." Homework: "..UserInfo.eBandHomework, display.contentWidth/2, display.contentHeight/2 + 30, nil, 20)
		notes5:setFillColor(1,1,1)

	if(UserInfo.bBand == "") then
		UserInfo.bBand = "B Band"
	end
	local notes6 = display.newText(UserInfo.bBand.." Homework: "..UserInfo.bBandHomework, display.contentWidth/2, display.contentHeight/2 + 70, nil, 20)
		notes6:setFillColor(1,1,1)

	if(UserInfo.lunch == "") then
		UserInfo.lunch = "Lunch"
	end
	local notes7 = display.newText(UserInfo.lunch.." Notes: "..UserInfo.lunchTasks, display.contentWidth/2, display.contentHeight/2 + 110, nil, 20)
		notes7:setFillColor(1,1,1)

	if(UserInfo.community == "") then
		UserInfo.community = "Community"
	end
	local notes8 = display.newText(UserInfo.community.." Notes: "..UserInfo.communityTasks, display.contentWidth/2, display.contentHeight/2 + 150, nil, 20)
		notes8:setFillColor(1,1,1)

	if(UserInfo.aBand == "") then
		UserInfo.aBand = "A Band"
	end
	local notes9 = display.newText(UserInfo.aBand.." Homework: "..UserInfo.aBandHomework, display.contentWidth/2, display.contentHeight/2 + 190, nil, 20)
		notes9:setFillColor(1,1,1)
	
		--[[if(UserInfo.bBandHomework == "")then
		notes1.placeholder = "Write Your Homework Here"
		else
		notes1.text = UserInfo.bBandHomework
		end]]
	
		--notes1.isEditable = true
		--notes1.size = 20
		--notes1:setTextColor(0,0,0)

	--INSERTING EACH ELEMENT OF THE PAGE INTO THE GROUP TO MAKE REMOVAL EASIER
	allHomework1:insert(background)
	allHomework1:insert(temp)
	allHomework1:insert(back)
	--allHomework1:insert(save)
	--bBandGroup1:insert(reset)
	allHomework1:insert(notesText)
	allHomework1:insert(notes1)
	allHomework1:insert(notes2)
	allHomework1:insert(notes3)
	allHomework1:insert(notes4)
	allHomework1:insert(notes5)
	allHomework1:insert(notes6)
	allHomework1:insert(notes7)
	allHomework1:insert(notes8)
	allHomework1:insert(notes9)
--	bBandGroup1:insert(notesBorder)

	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end

	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function backButton(event)
		notes1.isVisible = false
		native.setKeyboardFocus(nil)
		table.save(UserInfo, "userstuff")
		composer.gotoScene(lastScene, {effect = "fromLeft", time = 200})
	end

	--[[local function saveButton(event)
		UserInfo.bBandHomework = notes1.text
		table.print_r(UserInfo)
		table.save(UserInfo, "userstuff")
		notes1.text = UserInfo.bBandHomework
		backButton()
	end

	local function resetButton(event)
		UserInfo.bBandHomework = ""
		table.print_r(UserInfo)
		table.save(UserInfo, "userstuff")
		backButton()
	end]]

	background:addEventListener("tap", keyboardListener)
	back:addEventListener("tap", backButton)
	--[[save:addEventListener("tap", saveButton)
	reset:addEventListener("tap", resetButton)]]
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
2) THE TITLE TEXT (TEMP) DOESN'T CHANGE WHEN THE bBandFIELD TEXT IS CHANGED
]]