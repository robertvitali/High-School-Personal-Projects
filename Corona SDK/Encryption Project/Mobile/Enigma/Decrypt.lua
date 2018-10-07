-----------------------------------------------------------------------------------------
--
-- Home Screen
--
-----------------------------------------------------------------------------------------

local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()
local pasteboard = require ("plugin.pasteboard")


function scene:create (event)
	local dayGroup2 = self.view

	-- Set a default theme
	widget.setTheme( "widget_theme_ios7" )

	--background
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(0.4196, 0.7373, 0.27)
		
	--title
	local title = display.newText("Decryption:", display.contentWidth/2, display.contentHeight/7, native.systemFontBold, display.contentHeight/20)
		title:setFillColor(0,0,0)

	local string1 = ""
	local string2 = ""
	local string3 = ""
	local count = 0
	
	
	--home button
	local home = display.newText("<", display.contentWidth, display.contentHeight, native.systemFontBold, display.contentHeight/20)
		home.x = 1.1*home.width
		home.y = home.height
		home:setFillColor(0,0,0)

	--text field
	notes2 = native.newTextBox(display.contentWidth/2, display.contentHeight/2 - 35, display.contentWidth*.9, display.contentHeight*.47)
		notes2.y = 2*title.y + notes2.height/2
		notes2.size = display.contentHeight/30
		notes2:setTextColor(0,0,0)
		notes2.placeholder = "Click Decrypt to get the original message. Note: make sure the encrypted message is copied and in your clipboard."
		notes2.isEditable = true
		notes2:setTextColor(0,0,0)

	--decrypt button text
	local decrypt = display.newText("Decrypt", 0,0,native.systemFontBold, display.contentHeight/25)
		decrypt:setFillColor(0,0,0)
		decrypt.y = notes2.y + notes2.height/2 + decrypt.height
		decrypt.x = display.viewableContentWidth/2
	
	--decrypt button border
	local decryptBackground = display.newRoundedRect(decrypt.x, decrypt.y, decrypt.width*1.3, decrypt.height *1.25, 250)
	

	dayGroup2:insert(background)
	dayGroup2:insert(title)
	dayGroup2:insert(home)
	dayGroup2:insert(decryptBackground)
	dayGroup2:insert(decrypt)
	dayGroup2:insert(notes2)

	local function decryptFunction()
		string1 = string.lower(string1)
		for i=1,string.len(string1) do
			string2 = string.sub(string1,i,i)
			if(count == 0)then
				if(string2 == "b") then
					string2 = string.gsub(string2, "b", "a")
					string3 = string3..string2
				elseif(string2 == "c") then
					string2 = string.gsub(string2, "c", "b")
					string3 = string3..string2
				elseif(string2 == "d") then
					string2 = string.gsub(string2, "d", "c")
					string3 = string3..string2
				elseif(string2 == "e") then
					string2 = string.gsub(string2, "e", "d")
					string3 = string3..string2
				elseif(string2 == "f") then
					string2 = string.gsub(string2, "f", "e")
					string3 = string3..string2	
				elseif(string2 == "g") then
					string2 = string.gsub(string2, "g", "f")
					string3 = string3..string2
				elseif(string2 == "h") then
					string2 = string.gsub(string2, "h", "g")
					string3 = string3..string2
				elseif(string2 == "i") then
					string2 = string.gsub(string2, "i", "h")
					string3 = string3..string2
				elseif(string2 == "j") then
					string2 = string.gsub(string2, "j", "i")
					string3 = string3..string2
				elseif(string2 == "k") then
					string2 = string.gsub(string2, "k", "j")
					string3 = string3..string2
				elseif(string2 == "l") then
					string2 = string.gsub(string2, "l", "k")
					string3 = string3..string2
				elseif(string2 == "m") then
					string2 = string.gsub(string2, "m", "l")
					string3 = string3..string2
				elseif(string2 == "n") then
					string2 = string.gsub(string2, "n", "m")
					string3 = string3..string2
				elseif(string2 == "o") then
					string2 = string.gsub(string2, "o", "n")
					string3 = string3..string2
				elseif(string2 == "p") then
					string2 = string.gsub(string2, "p", "o")
					string3 = string3..string2
				elseif(string2 == "q") then
					string2 = string.gsub(string2, "q", "p")
					string3 = string3..string2
				elseif(string2 == "r") then
					string2 = string.gsub(string2, "r", "q")
					string3 = string3..string2
				elseif(string2 == "s") then
					string2 = string.gsub(string2, "s", "r")
					string3 = string3..string2
				elseif(string2 == "t") then
					string2 = string.gsub(string2, "t", "s")
					string3 = string3..string2
				elseif(string2 == "u") then
					string2 = string.gsub(string2, "u", "t")
					string3 = string3..string2
				elseif(string2 == "v") then
					string2 = string.gsub(string2, "v", "u")
					string3 = string3..string2
				elseif(string2 == "w") then
					string2 = string.gsub(string2, "w", "v")
					string3 = string3..string2
				elseif(string2 == "x") then
					string2 = string.gsub(string2, "x", "w")
					string3 = string3..string2
				elseif(string2 == "y") then
					string2 = string.gsub(string2, "y", "x")
					string3 = string3..string2
				elseif(string2 == "z") then
					string2 = string.gsub(string2, "z", "y")
					string3 = string3..string2
				elseif(string2 == "a") then
					string2 = string.gsub(string2, "a", "z")
					string3 = string3..string2
				elseif(string2 == "1") then
					string2 = string.gsub(string2, "1", "0")
					string3 = string3..string2
				elseif(string2 == "2") then
					string2 = string.gsub(string2, "2", "1")
					string3 = string3..string2
				elseif(string2 == "3") then
					string2 = string.gsub(string2, "3", "2")
					string3 = string3..string2
				elseif(string2 == "4") then
					string2 = string.gsub(string2, "4", "3")
					string3 = string3..string2
				elseif(string2 == "5") then
					string2 = string.gsub(string2, "5", "4")
					string3 = string3..string2
				elseif(string2 == "6") then
					string2 = string.gsub(string2, "6", "5")
					string3 = string3..string2
				elseif(string2 == "7") then
					string2 = string.gsub(string2, "7", "6")
					string3 = string3..string2
				elseif(string2 == "8") then
					string2 = string.gsub(string2, "8", "7")
					string3 = string3..string2
				elseif(string2 == "9") then
					string2 = string.gsub(string2, "9", "8")
					string3 = string3..string2
				elseif(string2 == "0") then
					string2 = string.gsub(string2, "0", "9")
					string3 = string3..string2
				else
					string3 = string3..string2
				end
				count = 1
			elseif(count == 1)then
				if(string2 == "c") then
					string2 = string.gsub(string2, "c", "a")
					string3 = string3..string2
				elseif(string2 == "d") then
					string2 = string.gsub(string2, "d", "b")
					string3 = string3..string2
				elseif(string2 == "e") then
					string2 = string.gsub(string2, "e", "c")
					string3 = string3..string2
				elseif(string2 == "f") then
					string2 = string.gsub(string2, "f", "d")
					string3 = string3..string2
				elseif(string2 == "g") then
					string2 = string.gsub(string2, "g", "e")
					string3 = string3..string2	
				elseif(string2 == "h") then
					string2 = string.gsub(string2, "h", "f")
					string3 = string3..string2
				elseif(string2 == "i") then
					string2 = string.gsub(string2, "i", "g")
					string3 = string3..string2
				elseif(string2 == "j") then
					string2 = string.gsub(string2, "j", "h")
					string3 = string3..string2
				elseif(string2 == "k") then
					string2 = string.gsub(string2, "k", "i")
					string3 = string3..string2
				elseif(string2 == "l") then
					string2 = string.gsub(string2, "l", "j")
					string3 = string3..string2
				elseif(string2 == "m") then
					string2 = string.gsub(string2, "m", "k")
					string3 = string3..string2
				elseif(string2 == "n") then
					string2 = string.gsub(string2, "n", "l")
					string3 = string3..string2
				elseif(string2 == "o") then
					string2 = string.gsub(string2, "o", "m")
					string3 = string3..string2
				elseif(string2 == "p") then
					string2 = string.gsub(string2, "p", "n")
					string3 = string3..string2
				elseif(string2 == "q") then
					string2 = string.gsub(string2, "q", "o")
					string3 = string3..string2
				elseif(string2 == "r") then
					string2 = string.gsub(string2, "r", "p")
					string3 = string3..string2
				elseif(string2 == "s") then
					string2 = string.gsub(string2, "s", "q")
					string3 = string3..string2
				elseif(string2 == "t") then
					string2 = string.gsub(string2, "t", "r")
					string3 = string3..string2
				elseif(string2 == "u") then
					string2 = string.gsub(string2, "u", "s")
					string3 = string3..string2
				elseif(string2 == "v") then
					string2 = string.gsub(string2, "v", "t")
					string3 = string3..string2
				elseif(string2 == "w") then
					string2 = string.gsub(string2, "w", "u")
					string3 = string3..string2
				elseif(string2 == "x") then
					string2 = string.gsub(string2, "x", "v")
					string3 = string3..string2
				elseif(string2 == "y") then
					string2 = string.gsub(string2, "y", "w")
					string3 = string3..string2
				elseif(string2 == "z") then
					string2 = string.gsub(string2, "z", "x")
					string3 = string3..string2
				elseif(string2 == "a") then
					string2 = string.gsub(string2, "a", "y")
					string3 = string3..string2
				elseif(string2 == "b") then
					string2 = string.gsub(string2, "b", "z")
					string3 = string3..string2
				elseif(string2 == "1") then
					string2 = string.gsub(string2, "1", "9")
					string3 = string3..string2
				elseif(string2 == "2") then
					string2 = string.gsub(string2, "2", "0")
					string3 = string3..string2
				elseif(string2 == "3") then
					string2 = string.gsub(string2, "3", "1")
					string3 = string3..string2
				elseif(string2 == "4") then
					string2 = string.gsub(string2, "4", "2")
					string3 = string3..string2
				elseif(string2 == "5") then
					string2 = string.gsub(string2, "5", "3")
					string3 = string3..string2
				elseif(string2 == "6") then
					string2 = string.gsub(string2, "6", "4")
					string3 = string3..string2
				elseif(string2 == "7") then
					string2 = string.gsub(string2, "7", "5")
					string3 = string3..string2
				elseif(string2 == "8") then
					string2 = string.gsub(string2, "8", "6")
					string3 = string3..string2
				elseif(string2 == "9") then
					string2 = string.gsub(string2, "9", "7")
					string3 = string3..string2
				elseif(string2 == "0") then
					string2 = string.gsub(string2, "0", "8")
					string3 = string3..string2
				else
					string3 = string3..string2
				end
				count = 2
			elseif(count == 2)then
				if(string2 == "d") then
					string2 = string.gsub(string2, "d", "a")
					string3 = string3..string2
				elseif(string2 == "e") then
					string2 = string.gsub(string2, "e", "b")
					string3 = string3..string2
				elseif(string2 == "f") then
					string2 = string.gsub(string2, "f", "c")
					string3 = string3..string2
				elseif(string2 == "g") then
					string2 = string.gsub(string2, "g", "d")
					string3 = string3..string2
				elseif(string2 == "h") then
					string2 = string.gsub(string2, "h", "e")
					string3 = string3..string2	
				elseif(string2 == "i") then
					string2 = string.gsub(string2, "i", "f")
					string3 = string3..string2
				elseif(string2 == "j") then
					string2 = string.gsub(string2, "j", "g")
					string3 = string3..string2
				elseif(string2 == "k") then
					string2 = string.gsub(string2, "k", "h")
					string3 = string3..string2
				elseif(string2 == "l") then
					string2 = string.gsub(string2, "l", "i")
					string3 = string3..string2
				elseif(string2 == "m") then
					string2 = string.gsub(string2, "m", "j")
					string3 = string3..string2
				elseif(string2 == "n") then
					string2 = string.gsub(string2, "n", "k")
					string3 = string3..string2
				elseif(string2 == "o") then
					string2 = string.gsub(string2, "o", "l")
					string3 = string3..string2
				elseif(string2 == "p") then
					string2 = string.gsub(string2, "p", "m")
					string3 = string3..string2
				elseif(string2 == "q") then
					string2 = string.gsub(string2, "q", "n")
					string3 = string3..string2
				elseif(string2 == "r") then
					string2 = string.gsub(string2, "r", "o")
					string3 = string3..string2
				elseif(string2 == "s") then
					string2 = string.gsub(string2, "s", "p")
					string3 = string3..string2
				elseif(string2 == "t") then
					string2 = string.gsub(string2, "t", "q")
					string3 = string3..string2
				elseif(string2 == "u") then
					string2 = string.gsub(string2, "u", "r")
					string3 = string3..string2
				elseif(string2 == "v") then
					string2 = string.gsub(string2, "v", "s")
					string3 = string3..string2
				elseif(string2 == "w") then
					string2 = string.gsub(string2, "w", "t")
					string3 = string3..string2
				elseif(string2 == "x") then
					string2 = string.gsub(string2, "x", "u")
					string3 = string3..string2
				elseif(string2 == "y") then
					string2 = string.gsub(string2, "y", "v")
					string3 = string3..string2
				elseif(string2 == "z") then
					string2 = string.gsub(string2, "z", "w")
					string3 = string3..string2
				elseif(string2 == "a") then
					string2 = string.gsub(string2, "a", "x")
					string3 = string3..string2
				elseif(string2 == "b") then
					string2 = string.gsub(string2, "b", "y")
					string3 = string3..string2
				elseif(string2 == "c") then
					string2 = string.gsub(string2, "c", "z")
					string3 = string3..string2
				elseif(string2 == "1") then
						string2 = string.gsub(string2, "1", "8")
						string3 = string3..string2
				elseif(string2 == "2") then
						string2 = string.gsub(string2, "2", "9")
						string3 = string3..string2
				elseif(string2 == "3") then
						string2 = string.gsub(string2, "3", "0")
						string3 = string3..string2
				elseif(string2 == "4") then
						string2 = string.gsub(string2, "4", "1")
						string3 = string3..string2
				elseif(string2 == "5") then
						string2 = string.gsub(string2, "5", "2")
						string3 = string3..string2
				elseif(string2 == "6") then
						string2 = string.gsub(string2, "6", "3")
						string3 = string3..string2
				elseif(string2 == "7") then
						string2 = string.gsub(string2, "7", "4")
						string3 = string3..string2
				elseif(string2 == "8") then
						string2 = string.gsub(string2, "8", "5")
						string3 = string3..string2
				elseif(string2 == "9") then
						string2 = string.gsub(string2, "9", "6")
						string3 = string3..string2
				elseif(string2 == "0") then
						string2 = string.gsub(string2, "0", "7")
						string3 = string3..string2
				else
					string3 = string3..string2
				end
				count = 0
			end
		end
		string3 = string.reverse(string3)
	end

	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function homeButton(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("HomeScreen", {time = 300})
	end

	home:addEventListener("tap", homeButton)

	local function onPaste( event )
 
    -- Paste an image
    if ( event.filename ) then
        pastedImage = display.newImageRect( event.filename, event.baseDir, 80, 80 )
        pastedImage.x = display.contentCenterX
        pastedImage.y = 200
    end
 
    -- Paste a string
    if ( event.string ) then
        -- Update the textfield's text
        string1 = event.string
    end
 
    -- Paste a URL
    if ( event.url ) then
        -- Update the textfield's text
        string1 = event.url
    end
end


local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end

	background:addEventListener("tap", keyboardListener)

--android only
	local function timerfunction()
		notes2.text = ""
    	decryptFunction()
    	notes2.text = "Original Message: "..string3
	end
----------------------------------------------------------


	local function decryptButton(event)
		count = 0
		string1 = ""
		string2 = ""
		string3 = ""
		--notes2.text = "" 
		--titleorary fix for android bug
		if ( system.getInfo( "platformName" ) == "Android" ) then
    		--string1 = notes2.text
    		pasteboard.paste(onPaste)
    		notes2.placeholder = "Please wait a moment. Descrambling."
    		timer.performWithDelay(000, timerfunction, 1)
		end
		----------------------------------------------------------
		--solution for android bug
		if ( system.getInfo( "platformName" ) ~= "Android" ) then
    		pasteboard.paste(onPaste)
    		notes2.text = ""
    		decryptFunction()
    		notes2.text = "Original Message: "..string3
		end
		------------------------------------------
	end

	decrypt:addEventListener("tap", decryptButton)

	
end


function scene:show(event)
	
end


function scene:hide(event)
	
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene