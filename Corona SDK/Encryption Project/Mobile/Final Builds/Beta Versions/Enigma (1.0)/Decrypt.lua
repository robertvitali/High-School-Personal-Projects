-----------------------------------------------------------------------------------------
--
-- Home Screen
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.DarkStatusBar)
local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()
local pasteboard = require ("plugin.pasteboard")



function scene:create (event)
	local dayGroup2 = self.view

	--SET UP BACKRGROUND RECTANGLE SO THAT COLOR CAN BE CHANGED EASILY
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(0, 0.6, 0)
		
	--THE LOCAL TEMP USED TO BE TEMPORARY TEXT- NOW IS TITLE TEXT FOR EACH PAGE
	local temp = display.newText("Decryption:", display.contentWidth/2, display.contentHeight/9, native.systemFont, 30)
		temp:setFillColor(0,0,0)

	local string1 = ""
	local string2 = ""
	local string3 = ""
	
	
	local home = widget.newButton
	{
		left = 5,
		top = -15,
		width = 60,
		height = 20,
		id = "home",
		label = "Home",
		labelColor = {default = {0,0,0}, over = {0,0,0}}
	}
	home.y = display.viewableContentHeight - (display.viewableContentHeight - 5)

	local decrypt = widget.newButton
	{
	left = display.contentWidth/2 - 30,
	top = display.contentHeight - 60,
	width = 60,
	height = 40,
	id = "Decrypt",
	label = " Decrypt",
	fontSize = 25,
	labelColor = {default = {0,0,0}, over = {0,0,0}}
	}
	decrypt.x = display.contentWidth/2
	decrypt.y = display.contentHeight/2 + 1.5*display.contentHeight/5

	local clear = widget.newButton
	{
	left = display.contentWidth/2-35,
	top = display.contentHeight - 60,
	width = 60,
	height = 40,
	id = "clear",
	label = "Clear Text",
	fontSize = 25,
	labelColor = {default = {0,0,0}, over = {0,0,0}}
	}
	clear.x = display.contentWidth/2
	clear.y = decrypt.y + 60


	notes2 = native.newTextBox(display.contentWidth/2, display.contentHeight/2-5, 310, 225)
	notes2.size=20
	notes2:setTextColor(0,0,0)
	notes2.placeholder = "Click Decrypt to get the original message. Note: make sure the encrypted message is copied and in your clipboard."
	notes2.isEditable = false
	notes2:setTextColor(0,0,0)

	dayGroup2:insert(background)
	dayGroup2:insert(temp)
	dayGroup2:insert(home)
	dayGroup2:insert(decrypt)
	dayGroup2:insert(clear)
	dayGroup2:insert(notes2)

	local function decryptFunction()
		string1 = string.reverse(string1)
		string1 = string.lower(string1)
		for i=1,string.len(string1) do
			string2 = string.sub(string1,i,i)
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
			elseif(string2 == "0") then
				string2 = string.gsub(string2, "0", "z")
				string3 = string3..string2
			else
				string3 = string3..string2
			end
		end
	end

	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function homeButton(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("HomeScreen")
	end

	home:addEventListener("tap", homeButton)

	local function onPaste( event )
    print( "event name:", event.name )
    print( "event type:", event.type )
    print( "Pasting a/an ", pasteboard.getType() )
 
    -- Paste an image
    if ( event.filename ) then
        pastedImage = display.newImageRect( event.filename, event.baseDir, 80, 80 )
        pastedImage.x = display.contentCenterX
        pastedImage.y = 200
    end
 
    -- Paste a string
    if ( event.string ) then
        -- Update the textfield's text
        notes2.text = event.string
    end
 
    -- Paste a URL
    if ( event.url ) then
        -- Update the textfield's text
        notes2.text = event.url
    end
end

	local function decryptButton(event)
		pasteboard.paste(onPaste)
		string1 = notes2.text
		decryptFunction()
		notes2.text = "Original Message Was: "..string3
	end

	decrypt:addEventListener("tap", decryptButton)

	local function clearText(event)
		notes2.text = "Click Decrypt to get the original message. Note: make sure the encrypted message is copied and in your clipboard."
	end

	clear:addEventListener("tap", clearText)

	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end
	background:addEventListener("tap", keyboardListener)
	
end


function scene:show(event)
	
end


function scene:hide(event)
	
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene