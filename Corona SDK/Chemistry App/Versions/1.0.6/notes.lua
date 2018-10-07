local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"
require("extensions.table")


local lastScene = composer.getSceneName("previous")

function scene:create (event)
	notesGroup = self.view

	--fixes issues with buttons showing weird on android version
	widget.setTheme( "widget_theme_ios7" )

	--SET UP BACKRGROUND RECTANGLE AND COLOR SO THAT 
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(89/255,89/255,89/255)

	--Top Bar
	local whiteBar2 = display.newRect(display.contentWidth/2, display.contentHeight/7, display.contentWidth, display.contentHeight/8)
		whiteBar2.y = whiteBar.height/2
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
	fontSize = display.contentHeight/18,
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
	fontSize = display.contentHeight/20
	}
	reset.x = display.contentWidth/2
	reset.y = display.viewableContentHeight - reset.height
	
	--TITLE ABOVE TEXT BOX
	local notesText = display.newText("Notes", display.contentWidth/2, whiteBar.y, native.systemFontBold, display.contentHeight/25)
	notesText:setFillColor(0,0,0)
	
	--TEXT BOX WHERE YOU INPUT HOMEWORK AND SEE HOMEWORK THAT WAS SAVED
	local notes1 = native.newTextBox(display.contentWidth/2, whiteBar2.y + whiteBar2.height/2, 13*display.contentWidth/14, display.contentHeight/2.4)
		notes1.y = notes1.y + notes1.height/1.85
		notes1.text = localData.notes
		notes1.size = display.contentHeight/35
		notes1:setTextColor(0,0,0)
		notes1:setReturnKey("done")
		notes1.isEditable = true


	local rectangle1 = display.newRoundedRect(notes1.x, notes1.y, notes1.width*1.05 , notes1.height*1.04, display.contentHeight/35)

	--INSERTING EACH ELEMENT OF THE PAGE INTO THE GROUP TO MAKE REMOVAL EASIER
	notesGroup:insert(background)
	notesGroup:insert(whiteBar2)
	notesGroup:insert(back)
	notesGroup:insert(reset)
	notesGroup:insert(notesText)
	notesGroup:insert(notes1)
	notesGroup:insert(rectangle1)

	

	--ALLOWS YOU TO OPEN AND CLOSE KEYBOARD BY TAPPING ON SCREEN 
	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end

	local function textListener( event )
	    if ( event.phase == "editing" ) then
	   		if(event.newCharacters == "\n")then
	    		keyboardListener()
	    	end
	        localData.notes = notes1.text
	        table.save(localData, "localDataSaved")
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
		localData.notes = ""
		table.save(localData, "localDataSaved")
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
