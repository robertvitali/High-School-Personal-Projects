-----------------------------------------------------------------------------------------
--
-- Home Screen
--
-----------------------------------------------------------------------------------------

local composer = require "composer"
local widget = require "widget"
local json = require "json"
local scene = composer.newScene()
local pasteboard = require ("plugin.pasteboard")

local scrollView = widget.newScrollView
	{
		backgroundColor = {0.4196, 0.7373, 0.27},
		left = 0,
		top = (0),
		width = display.contentWidth,
		height = display.contentHeight,
		topPadding = 0,
		bottomPadding = 0,
		horizontalScrollDisabled = true,
		verticalScrollDisabled = true,
	}
	scrollView.x = display.contentWidth/2
	scrollView.y = display.contentHeight/2


function scene:create (event)
	local dayGroup1 = self.view

	-- Set a default theme
	widget.setTheme( "widget_theme_ios7" )

	--background
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(0.4196, 0.7373, 0.27)
		
	--title
	local title = display.newText("Encryption", display.contentWidth/2, display.contentHeight/7, native.systemFontBold, display.contentHeight/20)
		title:setFillColor(0,0,0)

	--variables
	local string1 = ""
	local string2 = ""
	local string3 = ""
	local count = 0
	
	--home button
	local homeButton = display.newText("<", display.contentWidth, display.contentHeight, native.systemFontBold, display.contentHeight/20)
		homeButton.x = 1.1*homeButton.width
		homeButton.y = homeButton.height
		homeButton:setFillColor(0,0,0)

	--text field
	notes1 = native.newTextBox(display.contentWidth/2, 0, display.contentWidth*.9, display.contentHeight*.47)
		notes1.y = 2*title.y + notes1.height/2
		notes1.size = display.contentHeight/30
		notes1:setTextColor(0,0,0)
		notes1.placeholder = "Write your message here and\nclick 'Encrypt' to get message\ncopied to your clipboard."
		notes1.isEditable = true
		notes1:setTextColor(0,0,0)
	
	--text on top of textbox
	local notesText = display.newText("Message: ", 0, 0, native.systemFontBold, display.contentHeight/30)
		notesText:setFillColor(0,0,0)
		notesText.x = notes1.x - notes1.width/2 + notesText.width/2
		notesText.y = notes1.y - notes1.height/2 - notesText.width/5

	--encrypt button text
	local encrypt = display.newText("Encrypt", 0,0,native.systemFontBold, display.contentHeight/25)
		encrypt:setFillColor(0,0,0)
		encrypt.y = notes1.y + notes1.height/2 + encrypt.height
		encrypt.x = display.viewableContentWidth/2
	
	--encrypt button border
	local encryptBackground = display.newRoundedRect(encrypt.x, encrypt.y, encrypt.width*1.3, encrypt.height *1.25, 250)
	


	scrollView:insert(background)
	scrollView:insert(title)
	scrollView:insert(homeButton)
	scrollView:insert(encryptBackground)
	scrollView:insert(encrypt)
	scrollView:insert(notesText)
	scrollView:insert(notes1)
	dayGroup1:insert(scrollView)

	local function encryptFunction()
		string1 = string.reverse(string1)
		string1 = string.lower(string1)
		for i=1,string.len(string1) do
			string2 = string.sub(string1,i,i)
			if(count == 0)then
				if(string2 == "a") then
					string2 = string.gsub(string2, "a", "b")
					string3 = string3..string2
				elseif(string2 == "b") then
					string2 = string.gsub(string2, "b", "c")
					string3 = string3..string2
				elseif(string2 == "c") then
					string2 = string.gsub(string2, "c", "d")
					string3 = string3..string2
				elseif(string2 == "d") then
					string2 = string.gsub(string2, "d", "e")
					string3 = string3..string2
				elseif(string2 == "e") then
					string2 = string.gsub(string2, "e", "f")
					string3 = string3..string2	
				elseif(string2 == "f") then
					string2 = string.gsub(string2, "f", "g")
					string3 = string3..string2
				elseif(string2 == "g") then
					string2 = string.gsub(string2, "g", "h")
					string3 = string3..string2
				elseif(string2 == "h") then
					string2 = string.gsub(string2, "h", "i")
					string3 = string3..string2
				elseif(string2 == "i") then
					string2 = string.gsub(string2, "i", "j")
					string3 = string3..string2
				elseif(string2 == "j") then
					string2 = string.gsub(string2, "j", "k")
					string3 = string3..string2
				elseif(string2 == "k") then
					string2 = string.gsub(string2, "k", "l")
					string3 = string3..string2
				elseif(string2 == "l") then
					string2 = string.gsub(string2, "l", "m")
					string3 = string3..string2
				elseif(string2 == "m") then
					string2 = string.gsub(string2, "m", "n")
					string3 = string3..string2
				elseif(string2 == "n") then
					string2 = string.gsub(string2, "n", "o")
					string3 = string3..string2
				elseif(string2 == "o") then
					string2 = string.gsub(string2, "o", "p")
					string3 = string3..string2
				elseif(string2 == "p") then
					string2 = string.gsub(string2, "p", "q")
					string3 = string3..string2
				elseif(string2 == "q") then
					string2 = string.gsub(string2, "q", "r")
					string3 = string3..string2
				elseif(string2 == "r") then
					string2 = string.gsub(string2, "r", "s")
					string3 = string3..string2
				elseif(string2 == "s") then
					string2 = string.gsub(string2, "s", "t")
					string3 = string3..string2
				elseif(string2 == "t") then
					string2 = string.gsub(string2, "t", "u")
					string3 = string3..string2
				elseif(string2 == "u") then
					string2 = string.gsub(string2, "u", "v")
					string3 = string3..string2
				elseif(string2 == "v") then
					string2 = string.gsub(string2, "v", "w")
					string3 = string3..string2
				elseif(string2 == "w") then
					string2 = string.gsub(string2, "w", "x")
					string3 = string3..string2
				elseif(string2 == "x") then
					string2 = string.gsub(string2, "x", "y")
					string3 = string3..string2
				elseif(string2 == "y") then
					string2 = string.gsub(string2, "y", "z")
					string3 = string3..string2
				elseif(string2 == "z") then
					string2 = string.gsub(string2, "z", "a")
					string3 = string3..string2
				elseif(string2 == "1") then
					string2 = string.gsub(string2, "1", "2")
					string3 = string3..string2
				elseif(string2 == "2") then
					string2 = string.gsub(string2, "2", "3")
					string3 = string3..string2
				elseif(string2 == "3") then
					string2 = string.gsub(string2, "3", "4")
					string3 = string3..string2
				elseif(string2 == "4") then
					string2 = string.gsub(string2, "4", "5")
					string3 = string3..string2
				elseif(string2 == "5") then
					string2 = string.gsub(string2, "5", "6")
					string3 = string3..string2
				elseif(string2 == "6") then
					string2 = string.gsub(string2, "6", "7")
					string3 = string3..string2
				elseif(string2 == "7") then
					string2 = string.gsub(string2, "7", "8")
					string3 = string3..string2
				elseif(string2 == "8") then
					string2 = string.gsub(string2, "8", "9")
					string3 = string3..string2
				elseif(string2 == "9") then
					string2 = string.gsub(string2, "9", "0")
					string3 = string3..string2
				elseif(string2 == "0") then
					string2 = string.gsub(string2, "0", "1")
					string3 = string3..string2
				--[[elseif(string2 == "." or "?" or "!") then
					string3 = string3.." "]]
				else
					string3 = string3..string2
				end
				count = 1
			elseif(count == 1)then
				if(string2 == "a") then
					string2 = string.gsub(string2, "a", "c")
					string3 = string3..string2
				elseif(string2 == "b") then
					string2 = string.gsub(string2, "b", "d")
					string3 = string3..string2
				elseif(string2 == "c") then
					string2 = string.gsub(string2, "c", "e")
					string3 = string3..string2
				elseif(string2 == "d") then
					string2 = string.gsub(string2, "d", "f")
					string3 = string3..string2
				elseif(string2 == "e") then
					string2 = string.gsub(string2, "e", "g")
					string3 = string3..string2	
				elseif(string2 == "f") then
					string2 = string.gsub(string2, "f", "h")
					string3 = string3..string2
				elseif(string2 == "g") then
					string2 = string.gsub(string2, "g", "i")
					string3 = string3..string2
				elseif(string2 == "h") then
					string2 = string.gsub(string2, "h", "j")
					string3 = string3..string2
				elseif(string2 == "i") then
					string2 = string.gsub(string2, "i", "k")
					string3 = string3..string2
				elseif(string2 == "j") then
					string2 = string.gsub(string2, "j", "l")
					string3 = string3..string2
				elseif(string2 == "k") then
					string2 = string.gsub(string2, "k", "m")
					string3 = string3..string2
				elseif(string2 == "l") then
					string2 = string.gsub(string2, "l", "n")
					string3 = string3..string2
				elseif(string2 == "m") then
					string2 = string.gsub(string2, "m", "o")
					string3 = string3..string2
				elseif(string2 == "n") then
					string2 = string.gsub(string2, "n", "p")
					string3 = string3..string2
				elseif(string2 == "o") then
					string2 = string.gsub(string2, "o", "q")
					string3 = string3..string2
				elseif(string2 == "p") then
					string2 = string.gsub(string2, "p", "r")
					string3 = string3..string2
				elseif(string2 == "q") then
					string2 = string.gsub(string2, "q", "s")
					string3 = string3..string2
				elseif(string2 == "r") then
					string2 = string.gsub(string2, "r", "t")
					string3 = string3..string2
				elseif(string2 == "s") then
					string2 = string.gsub(string2, "s", "u")
					string3 = string3..string2
				elseif(string2 == "t") then
					string2 = string.gsub(string2, "t", "v")
					string3 = string3..string2
				elseif(string2 == "u") then
					string2 = string.gsub(string2, "u", "w")
					string3 = string3..string2
				elseif(string2 == "v") then
					string2 = string.gsub(string2, "v", "x")
					string3 = string3..string2
				elseif(string2 == "w") then
					string2 = string.gsub(string2, "w", "y")
					string3 = string3..string2
				elseif(string2 == "x") then
					string2 = string.gsub(string2, "x", "z")
					string3 = string3..string2
				elseif(string2 == "y") then
					string2 = string.gsub(string2, "y", "a")
					string3 = string3..string2
				elseif(string2 == "z") then
					string2 = string.gsub(string2, "z", "b")
					string3 = string3..string2
				elseif(string2 == "1") then
					string2 = string.gsub(string2, "1", "3")
					string3 = string3..string2
				elseif(string2 == "2") then
					string2 = string.gsub(string2, "2", "4")
					string3 = string3..string2
				elseif(string2 == "3") then
					string2 = string.gsub(string2, "3", "5")
					string3 = string3..string2
				elseif(string2 == "4") then
					string2 = string.gsub(string2, "4", "6")
					string3 = string3..string2
				elseif(string2 == "5") then
					string2 = string.gsub(string2, "5", "7")
					string3 = string3..string2
				elseif(string2 == "6") then
					string2 = string.gsub(string2, "6", "8")
					string3 = string3..string2
				elseif(string2 == "7") then
					string2 = string.gsub(string2, "7", "9")
					string3 = string3..string2
				elseif(string2 == "8") then
					string2 = string.gsub(string2, "8", "0")
					string3 = string3..string2
				elseif(string2 == "9") then
					string2 = string.gsub(string2, "9", "1")
					string3 = string3..string2
				elseif(string2 == "0") then
					string2 = string.gsub(string2, "0", "2")
					string3 = string3..string2
				elseif(string2 == "." or "!" or "?")then
					string3 = string3.." "
				else
					string3 = string3..string2
				end
				count = 2
			elseif(count == 2)then
				if(string2 == "a") then
					string2 = string.gsub(string2, "a", "d")
					string3 = string3..string2
				elseif(string2 == "b") then
					string2 = string.gsub(string2, "b", "e")
					string3 = string3..string2
				elseif(string2 == "c") then
					string2 = string.gsub(string2, "c", "f")
					string3 = string3..string2
				elseif(string2 == "d") then
					string2 = string.gsub(string2, "d", "g")
					string3 = string3..string2
				elseif(string2 == "e") then
					string2 = string.gsub(string2, "e", "h")
					string3 = string3..string2	
				elseif(string2 == "f") then
					string2 = string.gsub(string2, "f", "i")
					string3 = string3..string2
				elseif(string2 == "g") then
					string2 = string.gsub(string2, "g", "j")
					string3 = string3..string2
				elseif(string2 == "h") then
					string2 = string.gsub(string2, "h", "k")
					string3 = string3..string2
				elseif(string2 == "i") then
					string2 = string.gsub(string2, "i", "l")
					string3 = string3..string2
				elseif(string2 == "j") then
					string2 = string.gsub(string2, "j", "m")
					string3 = string3..string2
				elseif(string2 == "k") then
					string2 = string.gsub(string2, "k", "n")
					string3 = string3..string2
				elseif(string2 == "l") then
					string2 = string.gsub(string2, "l", "o")
					string3 = string3..string2
				elseif(string2 == "m") then
					string2 = string.gsub(string2, "m", "p")
					string3 = string3..string2
				elseif(string2 == "n") then
					string2 = string.gsub(string2, "n", "q")
					string3 = string3..string2
				elseif(string2 == "o") then
					string2 = string.gsub(string2, "o", "r")
					string3 = string3..string2
				elseif(string2 == "p") then
					string2 = string.gsub(string2, "p", "s")
					string3 = string3..string2
				elseif(string2 == "q") then
					string2 = string.gsub(string2, "q", "t")
					string3 = string3..string2
				elseif(string2 == "r") then
					string2 = string.gsub(string2, "r", "u")
					string3 = string3..string2
				elseif(string2 == "s") then
					string2 = string.gsub(string2, "s", "v")
					string3 = string3..string2
				elseif(string2 == "t") then
					string2 = string.gsub(string2, "t", "w")
					string3 = string3..string2
				elseif(string2 == "u") then
					string2 = string.gsub(string2, "u", "x")
					string3 = string3..string2
				elseif(string2 == "v") then
					string2 = string.gsub(string2, "v", "y")
					string3 = string3..string2
				elseif(string2 == "w") then
					string2 = string.gsub(string2, "w", "z")
					string3 = string3..string2
				elseif(string2 == "x") then
					string2 = string.gsub(string2, "x", "a")
					string3 = string3..string2
				elseif(string2 == "y") then
					string2 = string.gsub(string2, "y", "b")
					string3 = string3..string2
				elseif(string2 == "z") then
					string2 = string.gsub(string2, "z", "c")
					string3 = string3..string2
				elseif(string2 == "1") then
					string2 = string.gsub(string2, "1", "4")
					string3 = string3..string2
				elseif(string2 == "2") then
					string2 = string.gsub(string2, "2", "5")
					string3 = string3..string2
				elseif(string2 == "3") then
					string2 = string.gsub(string2, "3", "6")
					string3 = string3..string2
				elseif(string2 == "4") then
					string2 = string.gsub(string2, "4", "7")
					string3 = string3..string2
				elseif(string2 == "5") then
					string2 = string.gsub(string2, "5", "8")
					string3 = string3..string2
				elseif(string2 == "6") then
					string2 = string.gsub(string2, "6", "9")
					string3 = string3..string2
				elseif(string2 == "7") then
					string2 = string.gsub(string2, "7", "0")
					string3 = string3..string2
				elseif(string2 == "8") then
					string2 = string.gsub(string2, "8", "1")
					string3 = string3..string2
				elseif(string2 == "9") then
					string2 = string.gsub(string2, "9", "2")
					string3 = string3..string2
				elseif(string2 == "0") then
					string2 = string.gsub(string2, "0", "3")
					string3 = string3..string2
				elseif(string2 == "." or "?" or "!")then
					string3 = string3.." "
				else
					string3 = string3..string2
				end
				count = 0
			end
		end	
	end

	--home page function
	local function homeButtonF(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("HomeScreen", {time = 300})
	end

	items =
		{
		    { type = "string", value = string3 },
		}

	local function showShare()
    local popupName = "activity"
    local isAvailable = native.canShowPopup( popupName )
    local isSimulator = "simulator" == system.getInfo( "environment" )
 
    -- If it is possible to show the popup
    if isAvailable then
        local listener = {}
        function listener:popup( event )
            print( "name(" .. event.name .. ") type(" .. event.type .. ") activity(" .. tostring(event.activity) .. ") action(" .. tostring(event.action) .. ")" )
        end
 
        -- Show the popup
        native.showPopup( popupName,
        {
            items = items,
            -- excludedActivities = { "UIActivityTypeCopyToPasteboard", },
            listener = listener,
            origin = encrypt.contentBounds,
            permittedArrowDirections={ "up", "down" }
        })
    else
        if isSimulator then
            native.showAlert( "Build for device", "This plugin is not supported on the Corona Simulator, please build for an iOS/Android device or the Xcode simulator", { "OK" } )
        else
            -- Popup isn't available; show error message
            native.showAlert( "Error", "Can't display the view controller. Are you running iOS 7 or later?", { "OK" } )
        end
    end
end

	--encrypt button function
	local function encryptButton(event)
		count = 0
		if(notes1.text == "") then
		else
		pasteboard.clear()
		string1 = ""
		string1 = notes1.text
		string2 = ""
		string3 = ""
		notes1.text = ""
		encryptFunction()
		notes1.placeholder = "Your encrypted message has been copied."
		pasteboard.copy("string", string3)
		native.setKeyboardFocus(nil)
		title.alpha = 1
		notesText.alpha = 1
		if ( system.getInfo( "platformName" ) == "Android" ) then
    	else
    		items =
			{
		   		{ type = "string", value = string3 },
			}
    		showShare()
		end
		
	end
	end

	homeButton:addEventListener("tap", homeButtonF)
	encrypt:addEventListener("tap", encryptButton)

	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
		scrollView:scrollToPosition
			{
    			y = 0,
    			time = 100,
			}
	end

	background:addEventListener("tap", keyboardListener)

	-- scrolls the page up when the user taps in a textfield
	local function contactListener( event )
    	    if event.phase == "began" then
			title.alpha = 0
			notesText.alpha = 0
			notes1.text = ""
        	scrollView:scrollToPosition
			{
    			y = -display.contentHeight/4,
    			time = 100,
			}

			
		elseif event.phase == "ended" then
			title.alpha = 1
			notesText.alpha = 1
			scrollView:scrollToPosition
			{
    			y = 0,
    			time = 100,
			}
			keyboardListener()
    	     end
	end

	notes1:addEventListener("userInput", contactListener)
	
end
	

function scene:show(event)
end


function scene:hide(event)
	
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene