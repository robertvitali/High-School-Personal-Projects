-----------------------------------------------------------------------------------------
--
-- Home Screen
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
local widget = require "widget"
local json = require "json"
local scene = composer.newScene()

local scrollView = widget.newScrollView
	{
		backgroundColor = {0, 0.6, 0},
		left = 0,
		top = (0),
		width = display.contentWidth,
		height = display.viewableContentHeight + 200,
		topPadding = 30,
		bottomPadding = 0,
		horizontalScrollDisabled = true,
		verticalScrollDisabled = true,
		scrollHeight = 10
	}
	scrollView.x = display.contentWidth/2
	scrollView.y = display.contentHeight/2

	--for ipad
	if ( string.sub( system.getInfo("model"), 1, 4 ) == "iPad" ) then
		scrollView.width = display.contentWidth + 100
	end
	--for ipad

function scene:create (event)
	local dayGroup1 = self.view

	--SET UP BACKRGROUND RECTANGLE SO THAT COLOR CAN BE CHANGED EASILY
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(0.215, 0.67, 0.270)
		
	--THE LOCAL TEMP USED TO BE TEMPORARY TEXT- NOW IS TITLE TEXT FOR EACH PAGE
	local temp = display.newText("Encryption", display.contentWidth/2, display.contentHeight/5.2, native.systemFont, 60)
		temp:setFillColor(0,0,0)


	local string1 = ""
	local string2 = ""
	local string3 = ""
	local count = 0
	
	local home = widget.newButton
	{
		left = 5,
		top = -15,
		width = 60,
		height = 20,
		id = "home",
		label = "Home",
		labelColor = {default = {0,0,0}, over = {0,0,0}},
		fontSize = 40
	}
	home.y = 105
	home.x = home.width/2 + 10

	if ( string.sub( system.getInfo("model"), 1, 4 ) == "iPad" ) then
		home.y = 150
	end
	print(home.y)

	local encrypt = widget.newButton
	{
	left = display.contentWidth/2 - 30,
	top = display.contentHeight - 60,
	width = 60,
	height = 40,
	id = "Encrypt",
	label = " Encrypt",
	labelColor = {default = {0,0,0}, over = {0,0,0}},
	fontSize = 50
	}

	encrypt.y = display.contentHeight/2 + 1.9*display.contentHeight/5
	encrypt.x = display.viewableContentWidth/2

	local clear = widget.newButton
	{
	left = display.contentWidth/2-35,
	top = display.contentHeight - 60,
	width = 60,
	height = 40,
	id = "clear",
	label = "Clear Text",
	fontSize = 50,
	labelColor = {default = {0,0,0}, over = {0,0,0}}
	}
	clear.x = display.contentWidth/2
	clear.y = encrypt.y + 110


	
	notes1 = native.newTextBox(display.contentWidth/2, display.contentHeight/2 + 60, display.contentWidth*.9, display.contentHeight*.47)
	notes1.size=40
	notes1:setTextColor(0,0,0)
	notes1.placeholder = "Write your message here and click 'Encrypt' to get the encrypted version copied to your clipboard."
	notes1.isEditable = true
	notes1:setTextColor(0,0,0)
	local notesText = display.newText("Message: ", 0, display.contentHeight/2 - 140, nil, 46)
		notesText:setFillColor(0,0,0)
		notesText.x = notesText.width/2 + 5
		notesText.y = notes1.y - notes1.height/2 - notesText.width/5



	scrollView:insert(background)
	scrollView:insert(temp)
	scrollView:insert(home)
	scrollView:insert(encrypt)
	scrollView:insert(notesText)
	scrollView:insert(notes1)
	scrollView:insert(clear)
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

	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function homeButton(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("HomeScreen")
	end

	local function encryptButton(event)
		count = 0
		if(notes1.text == "") then
		else
		string1 = ""
		string1 = notes1.text
		string2 = ""
		string3 = ""
		notes1.text = ""
		encryptFunction()
		notes1.text = "Your encrypted message is: "..string3
		native.setKeyboardFocus(nil)
		temp.alpha = 1
		notesText.alpha = 1
	end
	end

	home:addEventListener("tap", homeButton)
	encrypt:addEventListener("tap", encryptButton)

	local function clearText(event)
		notes1.text = ""
		string1 = ""
		string2 = ""
		string3 = ""
	end

	clear:addEventListener("tap", clearText)

	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end

	background:addEventListener("tap", keyboardListener)

	
end
	

function scene:show(event)
	--set scroll view height
	scrollView:setScrollHeight(display.contentHeight + 200)
end


function scene:hide(event)
	
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene