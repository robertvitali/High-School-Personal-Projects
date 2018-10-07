local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"
require("extensions.table")


local lastScene = composer.getSceneName("previous")

function scene:create (event)
	aBandGroup1 = self.view

	--fixes issues with buttons showing weird on android version
	widget.setTheme( "widget_theme_ios7" )

	--SET UP BACKRGROUND RECTANGLE AND COLOR SO THAT 
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
	--	background:setFillColor(154/255, 17/255, 49/255)
	--	background:setFillColor(25/255, 140/255, 191/255)
	background:setFillColor(89/255,89/255,89/255)

	--Top Bar
	local whiteBar2 = display.newRect(display.contentWidth/2, -28, display.contentWidth, display.contentHeight/6.65-20)
	whiteBar2:setFillColor(1,1,1)
	
	--BACK BUTTON
	back = widget.newButton
	{
	left = 0,
	top = -30,
	width = 120,
	height = 40,
	id = "back",
	label = "<",
	labelColor = {default = {0,0,0}, over = {0,0,0}},
	fontSize = 65,
	emboss = true
	}
	back.y = whiteBar2.y
	
	--RESET BUTTON
	reset = widget.newButton
	{
	left = display.contentWidth/2 - 50,
	top = display.contentHeight - 20,
	width = 40,
	height = 40,
	id = "reset",
	label = "Clear Text",
	labelColor = {default = {1,1,1}, over = {0,0,0}},
	fontSize = 48
	}
	reset.x = display.contentWidth/2
	
	--TITLE ABOVE TEXT BOX
	local notesText = display.newText("Notes", display.contentWidth/2, whiteBar.y, native.systemFontBold, 50)
	notesText:setFillColor(0,0,0)
	
	--TEXT BOX WHERE YOU INPUT HOMEWORK AND SEE HOMEWORK THAT WAS SAVED
	local notes1 = native.newTextBox(display.contentWidth/2, display.contentHeight/3.3, 19*display.contentWidth/20, display.contentHeight/2)
	notes1.text = UserInfo.notes
	notes1.size=40
	notes1:setTextColor(0,0,0)
	notes1:setReturnKey("done")

	local rectangle1 = display.newRoundedRect(notes1.x, notes1.y, notes1.width + 20, notes1.height + 20, 26)
	
	--DEFINING WHAT THE TEXT BOX IS ALLOWED TO DO
	notes1.isEditable = true
	notes1:setTextColor(0,0,0)

	--INSERTING EACH ELEMENT OF THE PAGE INTO THE GROUP TO MAKE REMOVAL EASIER
	aBandGroup1:insert(background)
	aBandGroup1:insert(whiteBar2)
	aBandGroup1:insert(back)
	aBandGroup1:insert(reset)
	aBandGroup1:insert(notesText)
	aBandGroup1:insert(notes1)
	aBandGroup1:insert(rectangle1)

	

	--ALLOWS YOU TO OPEN AND CLOSE KEYBOARD BY TAPPING ON SCREEN 
	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end

	local function textListener( event )
	    if ( event.phase == "editing" ) then
	   		if(event.newCharacters == "\n")then
	    		keyboardListener()
	    	end
	        UserInfo.notes = notes1.text
	        table.save(UserInfo, "userSavedInfo")
	     elseif ( event.phase == "ended" or event.phase == "submitted" ) then
	     	keyboardListener()
	    end
	end
	notes1:addEventListener("userInput", textListener)

	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function backButton(event)
		notes1.isVisible = false
		native.setKeyboardFocus(nil)
		composer.gotoScene(lastScene)
		timer.pause(timer1)
	end

	--CLEARS INFORMATION THAT WOULD BE STORED IN TEXT BOX
	local function resetButton(event)
		UserInfo.notes = ""
		table.save(UserInfo, "userSavedInfo")
		notes1.text = ""
	end

	notes1:addEventListener("ended", keyboardListener)
	notes1:addEventListener("submitted", keyboardListener)
	background:addEventListener("tap", keyboardListener)
	whiteBar2:addEventListener("tap", keyboardListener)
	back:addEventListener("tap", backButton)
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
