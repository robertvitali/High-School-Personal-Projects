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
	local temp = display.newText("All Notes from "..lastScene, display.contentWidth/2, display.contentHeight-450, native.systemFont, 24)
		temp:setFillColor(1,1,1)
	
	
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
	
	local notesText = display.newText("Assignments: ", 80, display.contentHeight/2 - 170, nil, 24)
		notesText:setFillColor(1,1,1)
	
	local startHeight = display.contentHeight - notesText.y + 12
	local startHeight9 = startHeight/9

	if(UserInfo.gBand == "") then
		UserInfo.gBand = "G Band"
	end
	local notes1 = native.newTextBox(display.contentWidth/2, notesText.y + startHeight9, 310, 42)
	notes1.text = UserInfo.gBand.." Homework: "..UserInfo.gBandHomework
	notes1:setTextColor(.7,.7,.7)
	notes1.isEditable = false
	notes1.hasBackground = false
	notes1.size = 18

	if(UserInfo.fBand == "") then
		UserInfo.fBand = "F Band"
	end
	local notes2 = native.newTextBox(display.contentWidth/2, notesText.y + 2*startHeight9, 310, 42)
	notes2.text = UserInfo.fBand.." Homework: "..UserInfo.fBandHomework
	notes2:setTextColor(.7,.7,.7)
	notes2.isEditable = false
	notes2.hasBackground = false
	notes2.size = 18

	if(UserInfo.advising == "") then
		UserInfo.advising = "Advising"
	end
	local notes3 = native.newTextBox(display.contentWidth/2, notesText.y + 3*startHeight9, 310, 42)
	notes3.text = UserInfo.advising.." Notes: "..UserInfo.advising
	notes3:setTextColor(.7,.7,.7)
	notes3.isEditable = false
	notes3.hasBackground = false
	notes3.size = 18

	if(UserInfo.myBreak == "") then
		UserInfo.myBreak = "Break"
	end
	local notes4 = native.newTextBox(display.contentWidth/2, notesText.y + 4*startHeight9, 310, 42)
	notes4.text = UserInfo.myBreak.." Notes: "..UserInfo.myBreak
	notes4:setTextColor(.7,.7,.7)
	notes4.isEditable = false
	notes4.hasBackground = false
	notes4.size = 18

	if(UserInfo.eBand == "") then
		UserInfo.eBand = "E Band"
	end
	local notes5 = native.newTextBox(display.contentWidth/2, notesText.y + 5*startHeight9, 310, 42)
	notes5.text = UserInfo.eBand.." Homework: "..UserInfo.eBandHomework
	notes5:setTextColor(.7,.7,.7)
	notes5.isEditable = false
	notes5.hasBackground = false
	notes5.size = 18

	if(UserInfo.bBand == "") then
		UserInfo.bBand = "B Band"
	end
	local notes6 = native.newTextBox(display.contentWidth/2, notesText.y + 6*startHeight9, 310, 42)
	notes6.text = UserInfo.bBand.." Homework: "..UserInfo.bBandHomework
	notes6:setTextColor(.7,.7,.7)
	notes6.isEditable = false
	notes6.hasBackground = false
	notes6.size = 18

	if(UserInfo.lunch == "") then
		UserInfo.lunch = "Lunch"
	end
	local notes7 = native.newTextBox(display.contentWidth/2, notesText.y + 7*startHeight9, 310, 42)
	notes7.text = UserInfo.lunch.." Notes: "..UserInfo.lunch
	notes7:setTextColor(.7,.7,.7)
	notes7.isEditable = false
	notes7.hasBackground = false
	notes7.size = 18

	if(UserInfo.community == "") then
		UserInfo.community = "Community"
	end
	local notes8 = native.newTextBox(display.contentWidth/2, notesText.y + 8*startHeight9, 310, 42)
	notes8.text = UserInfo.community.." Notes: "..UserInfo.community
	notes8:setTextColor(.7,.7,.7)
	notes8.isEditable = false
	notes8.hasBackground = false
	notes8.size = 18

	if(UserInfo.aBand == "") then
		UserInfo.aBand = "A Band"
	end
	local notes9 = native.newTextBox(display.contentWidth/2, notesText.y + 9*startHeight9, 310, 42)
	notes9.text = UserInfo.aBand.." Homework: "..UserInfo.aBandHomework
	notes9:setTextColor(.7,.7,.7)
	notes9.isEditable = false
	notes9.hasBackground = false
	notes9.size = 18

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