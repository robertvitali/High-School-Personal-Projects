display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
local scene = composer.newScene()
local widget = require "widget"
local pasteboard = require ("plugin.pasteboard")
local ads = require( "ads" )
require("extensions.table")


------------------------------------------------------------------------------------------------------------------------------------

appID = "ca-app-pub-4668108448526393~5444264666"
--[[	if ( system.getInfo( "platformName" ) == "Android" ) then
   		appID = "ca-app-pub-4668108448526393~9114918264"
	end
]]

------------------------------------------------------------------------------------------------------------------------------------


function scene:create (event)
	local height = display.contentHeight/6.65
	local width1 = display.contentWidth

	homeScreenGroup = self.view
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
	--	background:setFillColor(154/255, 17/255, 49/255)
	--	background:setFillColor(25/255, 140/255, 191/255)
	--  background:setFillColor(0,0,0)
	background:setFillColor(89/255,89/255,89/255)

	--Top Bar
	whiteBar = display.newRect(display.contentWidth/2, -28, width1, height-20)
	whiteBar:setFillColor(1,1,1)

	--Notes
	notes = display.newText("Notes", width1/7, whiteBar.y, native.systemFontBold, 40)
	notes:setFillColor(0,0,0)

	--History
	history = display.newText("History", width1/2, whiteBar.y, native.systemFontBold, 40)
	history:setFillColor(0,0,0)

	--Lists

	--[[
	lists = display.newText("More", 6*width1/7, whiteBar.y, native.systemFontBold, 40)
	lists:setFillColor(0,0,0)]]

	--Text Field
	textField1 = native.newTextField(width1/2, whiteBar.y + 130, .9*width1, 70)
	textField1.placeholder = "Enter a chemical formula."
	textField1.inputType = "default"
	textField1.size = 46
	textField1:setReturnKey("done")

	local rectangle1 = display.newRoundedRect(textField1.x, textField1.y, textField1.width + 15, textField1.height + 15, 10)

	--Copy Button
	local copyButton = widget.newButton
	{
		left = display.contentWidth/2-60,
		top = display.viewableContentHeight,
		width = 120,
		height = 40,
		id = "copy",
		label = "Copy Mass",
		labelColor = {default = {1,1,1}, over = {0,0,0}},
		fontSize = 45,
	}
	copyButton.x = textField1.width - copyButton.width/3
	copyButton.y = textField1.y + 70

	local saveButton = widget.newButton
	{
		left = display.contentWidth/2-60,
		top = display.viewableContentHeight,
		width = 120,
		height = 40,
		id = "save",
		label = "Save Mass",
		labelColor = {default = {1,1,1}, over = {0,0,0}},
		fontSize = 45,
	}
	saveButton.x = copyButton.x
	saveButton.y = copyButton.y + 48

	--Clear Button
	local clearButton = widget.newButton
	{
		left = display.contentWidth/2-60,
		top = display.viewableContentHeight,
		width = 120,
		height = 40,
		id = "clear",
		label = "Clear Text",
		labelColor = {default = {1,1,1}, over = {0,0,0}},
		fontSize = 45,
	}
	clearButton.x = display.contentWidth/2 - textField1.width/3
	clearButton.y = textField1.y + 70

	--Variables
	textFieldString = ""
	textFieldSubString = ""
	letter1 = ""
	letter2 = ""
	boolean1 = 0
	molarMassValue = 0
	lastValue = 0
	molarMassValueOut = 0
	numberMultiply = 0
	local multiplier = 1
	local multiplierTemp = 0
	local subscript = 1
	local subscriptTemp = 1

	--Buttons
	numberButton1 = display.newText("1", textField1.width/2 * .2, display.contentHeight/2, native.systemFontBold, 60)
	numberButton2 = display.newText("2", textField1.width/2 * .4, display.contentHeight/2, native.systemFontBold, 60)
	numberButton3 = display.newText("3", textField1.width/2 * .6, display.contentHeight/2, native.systemFontBold, 60)
	numberButton4 = display.newText("4", textField1.width/2 * .8, display.contentHeight/2, native.systemFontBold, 60)
	numberButton5 = display.newText("5", textField1.width/2, display.contentHeight/2, native.systemFontBold, 60)
	numberButton6 = display.newText("6", textField1.width/2 * 1.2, display.contentHeight/2, native.systemFontBold, 60)
	numberButton7 = display.newText("7", textField1.width/2 * 1.4, display.contentHeight/2, native.systemFontBold, 60)
	numberButton8 = display.newText("8", textField1.width/2 * 1.6, display.contentHeight/2, native.systemFontBold, 60)
	numberButton9 = display.newText("9", textField1.width/2 * 1.8, display.contentHeight/2, native.systemFontBold, 60)
	numberButton0 = display.newText("0", textField1.width, display.contentHeight/2, native.systemFontBold, 60)
	numberButton1.alpha = 0
	numberButton2.alpha = 0
	numberButton3.alpha = 0
	numberButton4.alpha = 0
	numberButton5.alpha = 0
	numberButton6.alpha = 0
	numberButton7.alpha = 0
	numberButton8.alpha = 0
	numberButton9.alpha = 0
	numberButton0.alpha = 0

	molarMass = display.newText("", display.contentWidth/2, clearButton.y + 105, native.systemFontBold, 45)
	button2 = display.newText("", 1.6*width1/6, numberButton1.y - 100, native.systemFontBold, 85)
	button1 = display.newText("", 3*width1/6, numberButton1.y - 100, native.systemFontBold, 85)
	button3 = display.newText("", 4.4*width1/6, numberButton1.y - 100, native.systemFontBold, 85)


	timer1 = timer.performWithDelay(1000, timeTracker, 0)


	homeScreenGroup:insert(background)
	homeScreenGroup:insert(whiteBar)
	homeScreenGroup:insert(notes)
	homeScreenGroup:insert(history)
--	homeScreenGroup:insert(lists)
	homeScreenGroup:insert(rectangle1)
	homeScreenGroup:insert(textField1)
	homeScreenGroup:insert(copyButton)
	homeScreenGroup:insert(saveButton)
	homeScreenGroup:insert(clearButton)
	homeScreenGroup:insert(button1)
	homeScreenGroup:insert(button2)
	homeScreenGroup:insert(button3)
	homeScreenGroup:insert(numberButton1)
	homeScreenGroup:insert(numberButton2)
	homeScreenGroup:insert(numberButton3)
	homeScreenGroup:insert(numberButton4)
	homeScreenGroup:insert(numberButton5)
	homeScreenGroup:insert(numberButton6)
	homeScreenGroup:insert(numberButton7)
	homeScreenGroup:insert(numberButton8)
	homeScreenGroup:insert(numberButton9)
	homeScreenGroup:insert(numberButton0)
	homeScreenGroup:insert(molarMass)

	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
		numberButton1.alpha = 0
		numberButton2.alpha = 0
		numberButton3.alpha = 0
		numberButton4.alpha = 0
		numberButton5.alpha = 0
		numberButton6.alpha = 0
		numberButton7.alpha = 0
		numberButton8.alpha = 0
		numberButton9.alpha = 0
		numberButton0.alpha = 0
	end
	--background:addEventListener("tap", keyboardListener)


	local function molarMassCalculate()
		--multiplier = 1
		textFieldSubString = textField1.text
		for i=1, string.len(textField1.text) do
			if(i==1 and ((string.sub(textFieldSubString, i, i) == "0") or (string.sub(textFieldSubString, i, i) == "1") or (string.sub(textFieldSubString, i, i) == "2") or (string.sub(textFieldSubString, i, i) == "3") or (string.sub(textFieldSubString, i, i) == "4") or (string.sub(textFieldSubString, i, i) == "5") or (string.sub(textFieldSubString, i, i) == "6") or (string.sub(textFieldSubString, i, i) == "7") or (string.sub(textFieldSubString, i, i) == "8") or (string.sub(textFieldSubString, i, i) == "9")))then
				if((string.sub(textFieldSubString, i+1, i+1) == "0") or (string.sub(textFieldSubString, i+1, i+1) == "1") or (string.sub(textFieldSubString, i+1, i+1) == "2") or (string.sub(textFieldSubString, i+1, i+1) == "3") or (string.sub(textFieldSubString, i+1, i+1) == "4") or (string.sub(textFieldSubString, i+1, i+1) == "5") or (string.sub(textFieldSubString, i+1, i+1) == "6") or (string.sub(textFieldSubString, i+1, i+1) == "7") or (string.sub(textFieldSubString, i+1, i+1) == "8") or (string.sub(textFieldSubString, i+1, i+1) == "9"))then
					stringtoInt = string.sub(textFieldSubString, i, i+1)
					i = i + 2
					multiplierTemp = tonumber(stringtoInt)
				else
					stringtoInt = string.sub(textFieldSubString, i, i)
					multiplierTemp = tonumber(stringtoInt)
				end
				multiplier = multiplierTemp

			elseif(string.sub(textFieldSubString, i, i) == "(")then
				molarMassValueOut = molarMassValue
				molarMassValue = 0

			elseif((string.sub(textFieldSubString, i - 1, i - 1) == ")") and ((string.sub(textFieldSubString, i, i) == "0") or (string.sub(textFieldSubString, i, i) == "1") or (string.sub(textFieldSubString, i, i) == "2") or (string.sub(textFieldSubString, i, i) == "3") or (string.sub(textFieldSubString, i, i) == "4") or (string.sub(textFieldSubString, i, i) == "5") or (string.sub(textFieldSubString, i, i) == "6") or (string.sub(textFieldSubString, i, i) == "7") or (string.sub(textFieldSubString, i, i) == "8") or (string.sub(textFieldSubString, i, i) == "9")))then
				numberMultiply = tonumber(string.sub(textFieldSubString, i, i))
				molarMassValue = molarMassValue*numberMultiply + molarMassValueOut

			elseif((string.sub(textFieldSubString, i - 2, i - 2) == ")") and ((string.sub(textFieldSubString, i, i) == "0") or (string.sub(textFieldSubString, i, i) == "1") or (string.sub(textFieldSubString, i, i) == "2") or (string.sub(textFieldSubString, i, i) == "3") or (string.sub(textFieldSubString, i, i) == "4") or (string.sub(textFieldSubString, i, i) == "5") or (string.sub(textFieldSubString, i, i) == "6") or (string.sub(textFieldSubString, i, i) == "7") or (string.sub(textFieldSubString, i, i) == "8") or (string.sub(textFieldSubString, i, i) == "9")))then
				if((string.sub(textFieldSubString, i-1, i-1) == "1") or (string.sub(textFieldSubString, i-1, i-1) == "2") or (string.sub(textFieldSubString, i-1, i-1) == "3") or (string.sub(textFieldSubString, i-1, i-1) == "4") or (string.sub(textFieldSubString, i-1, i-1) == "5") or (string.sub(textFieldSubString, i-1, i-1) == "6") or (string.sub(textFieldSubString, i-1, i-1) == "7") or (string.sub(textFieldSubString, i-1, i-1) == "8") or (string.sub(textFieldSubString, i-1, i-1) == "9"))then
					numberMultiply = tonumber(string.sub(textFieldSubString, i-1, i))
					molarMassValue = molarMassValue*numberMultiply + molarMassValueOut
					molarMassValue = molarMassValue/2
				end
	
			elseif(((string.sub(textFieldSubString, i - 1, i - 1) ~= ")") and (string.sub(textFieldSubString, i - 2, i - 2) ~= ")")) and (i > 2) and ((string.sub(textFieldSubString, i, i) == "0") or (string.sub(textFieldSubString, i, i) == "1") or (string.sub(textFieldSubString, i, i) == "2") or (string.sub(textFieldSubString, i, i) == "3") or (string.sub(textFieldSubString, i, i) == "4") or (string.sub(textFieldSubString, i, i) == "5") or (string.sub(textFieldSubString, i, i) == "6") or (string.sub(textFieldSubString, i, i) == "7") or (string.sub(textFieldSubString, i, i) == "8") or (string.sub(textFieldSubString, i, i) == "9")))then
				stringtoInt2 = string.sub(textFieldSubString, i, i)
				subscriptTemp = tonumber(stringtoInt2)
				subscript = subscriptTemp
				molarMassValue = molarMassValue - lastValue
				molarMassValue = molarMassValue + (lastValue * subscript)

			elseif (string.sub(textFieldSubString, i, i) == "A") then
				if(string.sub(textFieldSubString,i+1,i+1) == "l")then
					molarMassValue = molarMassValue + element.Al
					i = i + 1
					lastValue = element.Al
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					molarMassValue = molarMassValue + element.Ar
					i = i + 1
					lastValue = element.Ar
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					molarMassValue = molarMassValue + element.As
					i = i + 1
					lastValue = element.As
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					molarMassValue = molarMassValue + element.Ag
					i = i + 1
					lastValue = element.Ag
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					molarMassValue = molarMassValue + element.Au
					i = i + 1
					lastValue = element.Au
				elseif(string.sub(textFieldSubString,i+1,i+1) == "t")then
					molarMassValue = molarMassValue + element.At
					i = i + 1
					lastValue = element.At
				elseif(string.sub(textFieldSubString,i+1,i+1) == "c")then
					molarMassValue = molarMassValue + element.Ac
					i = i + 1
					lastValue = element.Ac
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					molarMassValue = molarMassValue + element.Am
					i = i + 1
					lastValue = element.Am
				end

			elseif (string.sub(textFieldSubString, i, i) == "B") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					molarMassValue = molarMassValue + element.Ba
					i = i + 1
					lastValue = element.Ba
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					molarMassValue = molarMassValue + element.Be
					i = i + 1
					lastValue = element.Be
				elseif(string.sub(textFieldSubString,i+1,i+1) == "h")then
					molarMassValue = molarMassValue + element.Bh
					i = i + 1
					lastValue = element.Bh
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					molarMassValue = molarMassValue + element.Bi
					i = i + 1
					lastValue = element.Bi
				elseif(string.sub(textFieldSubString,i+1,i+1) == "k")then
					molarMassValue = molarMassValue + element.Bk
					i = i + 1
					lastValue = element.Bk
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					molarMassValue = molarMassValue + element.Br
					i = i + 1
					lastValue = element.Br
				else
					molarMassValue = molarMassValue + element.B
					lastValue = element.Bb
				end

			elseif (string.sub(textFieldSubString, i, i) == "C") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					molarMassValue = molarMassValue + element.Ca
					i = i + 1
					lastValue = element.Ca
				elseif(string.sub(textFieldSubString,i+1,i+1) == "l")then
					molarMassValue = molarMassValue + element.Cl
					i = i + 1
					lastValue = element.Cl
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					molarMassValue = molarMassValue + element.Cr
					i = i + 1
					lastValue = element.Cr
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					molarMassValue = molarMassValue + element.Co
					i = i + 1
					lastValue = element.Co
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					molarMassValue = molarMassValue + element.Cu
					i = i + 1
					lastValue = element.Cu
				elseif(string.sub(textFieldSubString,i+1,i+1) == "d")then
					molarMassValue = molarMassValue + element.Cd
					i = i + 1
					lastValue = element.Cd
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					molarMassValue = molarMassValue + element.Cs
					i = i + 1
					lastValue = element.Cs
				elseif(string.sub(textFieldSubString,i+1,i+1) == "n")then
					molarMassValue = molarMassValue + element.Cn
					i = i + 1
					lastValue = element.Cn
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					molarMassValue = molarMassValue + element.Ce
					i = i + 1
					lastValue = element.Ce
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					molarMassValue = molarMassValue + element.Cm
					i = i + 1
					lastValue = element.Cm
				elseif(string.sub(textFieldSubString,i+1,i+1) == "f")then
					molarMassValue = molarMassValue + element.Cf
					i = i + 1
					lastValue = element.Cf
				else
					molarMassValue = molarMassValue + element.C
					lastValue = element.C
				end

			elseif (string.sub(textFieldSubString, i, i) == "D") then
				if(string.sub(textFieldSubString,i+1,i+1) == "b")then
					molarMassValue = molarMassValue + element.Db
					i = i + 1
					lastValue = element.Db
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					molarMassValue = molarMassValue + element.Ds
					i = i + 1
					lastValue = element.Ds
				elseif(string.sub(textFieldSubString,i+1,i+1) == "y")then
					molarMassValue = molarMassValue + element.Dy
					i = i + 1
					lastValue = element.Dy
				end

			elseif (string.sub(textFieldSubString, i, i) == "E") then
				if(string.sub(textFieldSubString,i+1,i+1) == "r")then
					molarMassValue = molarMassValue + element.Er
					i = i + 1
					lastValue = element.Er
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					molarMassValue = molarMassValue + element.Es
					i = i + 1
					lastValue = element.Es
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					molarMassValue = molarMassValue + element.Eu
					i = i + 1
					lastValue = element.Eu
				end

			elseif(string.sub(textFieldSubString, i, i) == "F")then
				if(string.sub(textFieldSubString, i+1, i+1) == "e")then
					molarMassValue = molarMassValue + element.Fe
					i = i + 1
					lastValue = element.Fe
				elseif(string.sub(textFieldSubString, i+1, i+1) == "r")then
					molarMassValue = molarMassValue + element.Fr
					i = i + 1
					lastValue = element.Fr
				elseif(string.sub(textFieldSubString, i+1, i+1) == "l")then
					molarMassValue = molarMassValue + element.Fl
					i = i + 1
					lastValue = element.Fl
				elseif(string.sub(textFieldSubString, i+1, i+1) == "m")then
					molarMassValue = molarMassValue + element.Fm
					i = i + 1
					lastValue = element.Fm
				else
					molarMassValue = molarMassValue + element.F
					lastValue = element.F
				end

			elseif(string.sub(textFieldSubString, i, i) == "G")then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					molarMassValue = molarMassValue + element.Ga
					i = i + 1
					lastValue = element.Ga
				elseif(string.sub(textFieldSubString,i+1,i+1) == "d")then
					molarMassValue = molarMassValue + element.Gd
					i = i + 1
					lastValue = element.Gd
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					molarMassValue = molarMassValue + element.Ge
					i = i + 1
					lastValue = element.Ge
				end

			elseif (string.sub(textFieldSubString, i, i) == "H") then
				if(string.sub(textFieldSubString,i+1,i+1) == "e")then
					molarMassValue = molarMassValue + element.He
					i = i + 1
					lastValue = element.He
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					molarMassValue = molarMassValue + element.Hg
					i = i + 1
					lastValue = element.Hg
				elseif(string.sub(textFieldSubString,i+1,i+1) == "f")then
					molarMassValue = molarMassValue + element.Hf
					i = i + 1
					lastValue = element.Hf
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					molarMassValue = molarMassValue + element.Ho
					i = i + 1
					lastValue = element.Ho
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					molarMassValue = molarMassValue + element.Hs
					i = i + 1
					lastValue = element.Hs
				else 
					molarMassValue = molarMassValue + element.H
					lastValue = element.H
				end

			elseif (string.sub(textFieldSubString, i, i) == "I") then
				if(string.sub(textFieldSubString,i+1,i+1) == "n")then
					molarMassValue = molarMassValue + element.In
					i = i + 1
					lastValue = element.In
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					molarMassValue = molarMassValue + element.Ir
					i = i + 1
					lastValue = element.Ir
				else
					molarMassValue = molarMassValue + element.I
					lastValue = element.I
				end

			elseif (string.sub(textFieldSubString, i, i) == "K") then
				if(string.sub(textFieldSubString,i+1,i+1) == "r")then
					molarMassValue = molarMassValue + element.Kr
					i = i + 1
					lastValue = element.Kr
				else
					molarMassValue = molarMassValue + element.K
					lastValue = element.K
				end

			elseif (string.sub(textFieldSubString, i, i) == "L") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					molarMassValue = molarMassValue + element.La
					i = i + 1
					lastValue = element.La
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					molarMassValue = molarMassValue + element.Li
					i = i + 1
					lastValue = element.Li
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					molarMassValue = molarMassValue + element.Lr
					i = i + 1
					lastValue = element.Lr
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					molarMassValue = molarMassValue + element.Lu
					i = i + 1
					lastValue = element.Lu
				elseif(string.sub(textFieldSubString,i+1,i+1) == "v")then
					molarMassValue = molarMassValue + element.Lv
					i = i + 1
					lastValue = element.Lv
				end

			elseif (string.sub(textFieldSubString, i, i) == "M") then
				if(string.sub(textFieldSubString,i+1,i+1) == "d")then
					molarMassValue = molarMassValue + element.Md
					i = i + 1
					lastValue = element.Md
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					molarMassValue = molarMassValue + element.Mg
					i = i + 1
					lastValue = element.Mg
				elseif(string.sub(textFieldSubString,i+1,i+1) == "n")then
					molarMassValue = molarMassValue + element.Mn
					i = i + 1
					lastValue = element.Mn
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					molarMassValue = molarMassValue + element.Mo
					i = i + 1
					lastValue = element.Mo
				elseif(string.sub(textFieldSubString,i+1,i+1) == "t")then
					molarMassValue = molarMassValue + element.Mt
					i = i + 1
					lastValue = element.Mt
				end

			elseif (string.sub(textFieldSubString, i, i) == "N") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					molarMassValue = molarMassValue + element.Na
					i = i + 1
					lastValue = element.Na
				elseif(string.sub(textFieldSubString,i+1,i+1) == "b")then
					molarMassValue = molarMassValue + element.Nb
					i = i + 1
					lastValue = element.Nb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "d")then
					molarMassValue = molarMassValue + element.Nd
					i = i + 1
					lastValue = element.Nd
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					molarMassValue = molarMassValue + element.Ne
					i = i + 1
					lastValue = element.Ne
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					molarMassValue = molarMassValue + element.Ni
					i = i + 1
					lastValue = element.Ni
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					molarMassValue = molarMassValue + element.No
					i = i + 1
					lastValue = element.No
				elseif(string.sub(textFieldSubString,i+1,i+1) == "p")then
					molarMassValue = molarMassValue + element.Np
					i = i + 1
					lastValue = element.Np
				else
					molarMassValue = molarMassValue + element.N
					lastValue = element.N
				end

			elseif (string.sub(textFieldSubString, i, i) == "O") then
				if(string.sub(textFieldSubString,i+1,i+1) == "s")then
					molarMassValue = molarMassValue + element.Os
					i = i + 1
					lastValue = element.Os
				else
					molarMassValue = molarMassValue + element.O
					lastValue = element.O
				end

			elseif (string.sub(textFieldSubString, i, i) == "P") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					molarMassValue = molarMassValue + element.Pa
					i = i + 1
					lastValue = element.Pa
				elseif(string.sub(textFieldSubString,i+1,i+1) == "b")then
					molarMassValue = molarMassValue + element.Pb
					i = i + 1
					lastValue = element.Pb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "d")then
					molarMassValue = molarMassValue + element.Pd
					i = i + 1
					lastValue = element.Pd
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					molarMassValue = molarMassValue + element.Pm
					i = i + 1
					lastValue = element.Pm
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					molarMassValue = molarMassValue + element.Po
					i = i + 1
					lastValue = element.Po
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					molarMassValue = molarMassValue + element.Pr
					i = i + 1
					lastValue = element.Pr
				elseif(string.sub(textFieldSubString,i+1,i+1) == "t")then
					molarMassValue = molarMassValue + element.Pt
					i = i + 1
					lastValue = element.Pt
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					molarMassValue = molarMassValue + element.Pu
					i = i + 1
					lastValue = element.Pu
				else
					molarMassValue = molarMassValue + element.P
					lastValue = element.P
				end

			elseif (string.sub(textFieldSubString, i, i) == "R") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					molarMassValue = molarMassValue + element.Ra
					i = i + 1
					lastValue = element.Ra
				elseif(string.sub(textFieldSubString,i+1,i+1) == "b")then
					molarMassValue = molarMassValue + element.Rb
					i = i + 1
					lastValue = element.Rb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					molarMassValue = molarMassValue + element.Re
					i = i + 1
					lastValue = element.Re
				elseif(string.sub(textFieldSubString,i+1,i+1) == "f")then
					molarMassValue = molarMassValue + element.Rf
					i = i + 1
					lastValue = element.Rf
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					molarMassValue = molarMassValue + element.Rg
					i = i + 1
					lastValue = element.Rg
				elseif(string.sub(textFieldSubString,i+1,i+1) == "h")then
					molarMassValue = molarMassValue + element.Rh
					i = i + 1
					lastValue = element.Rh
				elseif(string.sub(textFieldSubString,i+1,i+1) == "n")then
					molarMassValue = molarMassValue + element.Rn
					i = i + 1
					lastValue = element.Rn
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					molarMassValue = molarMassValue + element.Ru
					i = i + 1
					lastValue = element.Ru
				end

			elseif (string.sub(textFieldSubString, i, i) == "S") then
				if(string.sub(textFieldSubString,i+1,i+1) == "b")then
					molarMassValue = molarMassValue + element.Sb
					i = i + 1
					lastValue = element.Sb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "c")then
					molarMassValue = molarMassValue + element.Sc
					i = i + 1
					lastValue = element.Sc
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					molarMassValue = molarMassValue + element.Se
					i = i + 1
					lastValue = element.Se
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					molarMassValue = molarMassValue + element.Sg
					i = i + 1
					lastValue = element.Sg
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					molarMassValue = molarMassValue + element.Si
					i = i + 1
					lastValue = element.Si
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					molarMassValue = molarMassValue + element.Sm
					i = i + 1
					lastValue = element.Sm
				elseif(string.sub(textFieldSubString,i+1,i+1) == "n")then
					molarMassValue = molarMassValue + element.Sn
					i = i + 1
					lastValue = element.Sn
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					molarMassValue = molarMassValue + element.Sr
					i = i + 1
					lastValue = element.Sr
				else
					molarMassValue = molarMassValue + element.S
					lastValue = element.S
				end

			elseif (string.sub(textFieldSubString, i, i) == "T") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					molarMassValue = molarMassValue + element.Ta
					i = i + 1
					lastValue = element.Ta
				elseif(string.sub(textFieldSubString,i+1,i+1) == "b")then
					molarMassValue = molarMassValue + element.Tb
					i = i + 1
					lastValue = element.Tb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "c")then
					molarMassValue = molarMassValue + element.Tc
					i = i + 1
					lastValue = element.Tc
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					molarMassValue = molarMassValue + element.Te
					i = i + 1
					lastValue = element.Te
				elseif(string.sub(textFieldSubString,i+1,i+1) == "h")then
					molarMassValue = molarMassValue + element.Th
					i = i + 1
					lastValue = element.Th
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					molarMassValue = molarMassValue + element.Ti
					i = i + 1
					lastValue = element.Ti
				elseif(string.sub(textFieldSubString,i+1,i+1) == "l")then
					molarMassValue = molarMassValue + element.Tl
					i = i + 1
					lastValue = element.Tl
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					molarMassValue = molarMassValue + element.Tm
					i = i + 1
					lastValue = element.Tm
				end
			elseif (string.sub(textFieldSubString, i, i) == "U") then
				if(string.sub(textFieldSubString,i+1,i+2) == "uo")then
					molarMassValue = molarMassValue + element.Uuo
					i = i + 2
					lastValue = element.Uuo
				elseif(string.sub(textFieldSubString,i+1,i+2) == "up")then
					molarMassValue = molarMassValue + element.Uup
					i = i + 2
					lastValue = element.Uup
				elseif(string.sub(textFieldSubString,i+1,i+2) == "us")then
					molarMassValue = molarMassValue + element.Uus
					i = i + 2
					lastValue = element.Uus
				elseif(string.sub(textFieldSubString,i+1,i+2) == "ut")then
					molarMassValue = molarMassValue + element.Uut
					i = i + 2
					lastValue = element.Uut
				else
					molarMassValue = molarMassValue + element.U
					lastValue = element.U
				end
			elseif (string.sub(textFieldSubString, i, i) == "V") then
				molarMassValue = molarMassValue + element.V
				lastValue = element.V
			elseif (string.sub(textFieldSubString, i, i) == "W") then
				molarMassValue = molarMassValue + element.W
				lastValue = element.W
			elseif (string.sub(textFieldSubString, i, i+1) == "Xe") then
				molarMassValue = molarMassValue + element.Xe
				lastValue = element.Xe
				i = i + 1
			elseif (string.sub(textFieldSubString, i, i) == "Y") then
				if(string.sub(textFieldSubString,i+1,i+2) == "b")then
					molarMassValue = molarMassValue + element.Yb
					i = i + 1
					lastValue = element.Yb
				else
					molarMassValue = molarMassValue + element.Y
					lastValue = element.Y
				end
			end
		end
		if((string.len(textField1.text) > 1))then
			molarMassValue = molarMassValue*multiplier
		end
		molarMass.text = molarMassValue.." g/mol"
	end

	local function textListener( event )
	    if ( event.phase == "editing" ) then
	    	numberButton1.alpha = 1
			numberButton2.alpha = 1
			numberButton3.alpha = 1
			numberButton4.alpha = 1
			numberButton5.alpha = 1
			numberButton6.alpha = 1
			numberButton7.alpha = 1
			numberButton8.alpha = 1
			numberButton9.alpha = 1
			numberButton0.alpha = 1
	    	button1.text = ""
	    	button2.text = ""
	    	button3.text = ""

	    	letterVar = event.newCharacters
	    	--[[
	    	if(letterVar == "a")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "B")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "G")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "L")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "P")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "R")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Ag"
					button2.text = "Al"
					button3.text = "Au"
				end
			elseif(letterVar == "A")then
				button1.text = "Ag"
				button2.text = "Al"
				button3.text = "Au"

			elseif(letterVar == "b")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "D")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "P")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "R")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "Y")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Ba"
					button2.text = "Be"
					button3.text = "Br"
				end
			elseif(letterVar == "B")then
				button1.text = "Ba"
				button2.text = "Be"
				button3.text = "Br"

			elseif(letterVar == "c")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "A")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Cl"
					button2.text = "Ca"
					button3.text = "Cu"
				end
			elseif(letterVar == "C")then
				button1.text = "Cl"
				button2.text = "Ca"
				button3.text = "Cu"

			elseif(letterVar == "d")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "G")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "M")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "P")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Ds"
					button2.text = "Db"
					button3.text = "Dy"
				end
			elseif(letterVar == "D")then
				button1.text = "Ds"
				button2.text = "Db"
				button3.text = "Dy"



	    	elseif(letterVar == "h")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "B")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "H"
					button2.text = "He"
					button3.text = "Hg"
				end
			elseif(letterVar == "H")then
				button1.text = "H"
				button2.text = "He"
				button3.text = "Hg"
	        end
	        ]]
	    elseif(event.phase == "ended" or event.phase == "submitted")then
	    	keyboardListener()
	    end
	    molarMass.text = ""
		molarMassValue = 0
	    molarMassCalculate()
	end
	textField1:addEventListener("userInput", textListener)


	local function replaceText1(event)
		if(button1.text ~= "")then
			textFieldString = textField1.text 
			textFieldLength = string.len(textFieldString)
			textFieldString = string.sub(textFieldString, 0, textFieldLength-1)..button1.text
			textField1.text = textFieldString
			button1.text = ""
			button2.text = ""
			button3.text = ""
			boolean1 = 0
			molarMassValue = 0
			molarMassCalculate()
		end
	end
	button1:addEventListener("tap", replaceText1)

	local function replaceText2(event)
		if(button2.text ~= "")then
			textFieldString = textField1.text 
			textFieldLength = string.len(textFieldString)
			textFieldString = string.sub(textFieldString, 0, textFieldLength-1)..button2.text
			textField1.text = textFieldString
			button1.text = ""
			button2.text = ""
			button3.text = ""
			boolean1 = 0
			molarMassValue = 0
			molarMassCalculate()
		end
	end
	button2:addEventListener("tap", replaceText2)

	local function replaceText3(event)
		if(button3.text ~= "")then
			textFieldString = textField1.text 
			textFieldLength = string.len(textFieldString)
			textFieldString = string.sub(textFieldString, 0, textFieldLength-1)..button3.text
			textField1.text = textFieldString
			button1.text = ""
			button2.text = ""
			button3.text = ""
			boolean1 = 0
			molarMassValue = 0
			molarMassCalculate()
		end
	end
	button3:addEventListener("tap", replaceText3)

	local function addOne(event)
		textField1.text = textField1.text.."1"
		molarMassCalculate()
	end
	numberButton1:addEventListener("tap", addOne)

	local function addTwo(event)
		textField1.text = textField1.text.."2"
		molarMassCalculate()
	end
	numberButton2:addEventListener("tap", addTwo)

	local function addThree(event)
		textField1.text = textField1.text.."3"
		molarMassCalculate()
	end
	numberButton3:addEventListener("tap", addThree)

	local function addFour(event)
		textField1.text = textField1.text.."4"
		molarMassCalculate()
	end
	numberButton4:addEventListener("tap", addFour)

	local function addFive(event)
		textField1.text = textField1.text.."5"
		molarMassCalculate()
	end
	numberButton5:addEventListener("tap", addFive)

	local function addSix(event)
		textField1.text = textField1.text.."6"
		molarMassCalculate()
	end
	numberButton6:addEventListener("tap", addSix)

	local function addSeven(event)
		textField1.text = textField1.text.."7"
		molarMassCalculate()
	end
	numberButton7:addEventListener("tap", addSeven)

	local function addEight(event)
		textField1.text = textField1.text.."8"
		molarMassCalculate()
	end
	numberButton8:addEventListener("tap", addEight)

	local function addNine(event)
		textField1.text = textField1.text.."9"
		molarMassCalculate()
	end
	numberButton9:addEventListener("tap", addNine)

	local function addZero(event)
		textField1.text = textField1.text.."0"
		molarMassCalculate()
	end
	numberButton0:addEventListener("tap", addZero)

	local function clearText(event)
		textField1.text = ""
		button1.text = ""
		button2.text = ""
		button3.text = ""
		molarMassValue = 0
		molarMass.text = ""
	end
	clearButton:addEventListener("tap", clearText)

	local function copyFunction()
		--[[
		if(UserInfo.symbol1 == "")then
			UserInfo.symbol1 = textField1.text 
			UserInfo.mass1 = molarMassValue
		elseif(UserInfo.symbol2 == "")then
			UserInfo.symbol2 = UserInfo.symbol1
			UserInfo.mass2 = UserInfo.mass1
			UserInfo.symbol1 = textField1.text 
			UserInfo.mass1 = molarMassValue
		elseif(UserInfo.symbol3 == "")then
			UserInfo.symbol3 = UserInfo.symbol2
			UserInfo.mass3 = UserInfo.mass2
			UserInfo.symbol2 = UserInfo.symbol1
			UserInfo.mass2 = UserInfo.mass1
			UserInfo.symbol1 = textField1.text 
			UserInfo.mass1 = molarMassValue
		elseif(UserInfo.symbol4 == "")then
			UserInfo.symbol4 = UserInfo.symbol3
			UserInfo.mass4 = UserInfo.mass3
			UserInfo.symbol3 = UserInfo.symbol2
			UserInfo.mass3 = UserInfo.mass2
			UserInfo.symbol2 = UserInfo.symbol1
			UserInfo.mass2 = UserInfo.mass1
			UserInfo.symbol1 = textField1.text 
			UserInfo.mass1 = molarMassValue
		elseif(UserInfo.symbol5 == "")then
			UserInfo.symbol5 = UserInfo.symbol4
			UserInfo.mass5 = UserInfo.mass4
			UserInfo.symbol4 = UserInfo.symbol3
			UserInfo.mass4 = UserInfo.mass3
			UserInfo.symbol3 = UserInfo.symbol2
			UserInfo.mass3 = UserInfo.mass2
			UserInfo.symbol2 = UserInfo.symbol1
			UserInfo.mass2 = UserInfo.mass1
			UserInfo.symbol1 = textField1.text 
			UserInfo.mass1 = molarMassValue
		elseif(UserInfo.symbol6 == "")then
			UserInfo.symbol6 = UserInfo.symbol5
			UserInfo.mass6 = UserInfo.mass5
			UserInfo.symbol5 = UserInfo.symbol4
			UserInfo.mass5 = UserInfo.mass4
			UserInfo.symbol4 = UserInfo.symbol3
			UserInfo.mass4 = UserInfo.mass3
			UserInfo.symbol3 = UserInfo.symbol2
			UserInfo.mass3 = UserInfo.mass2
			UserInfo.symbol2 = UserInfo.symbol1
			UserInfo.mass2 = UserInfo.mass1
			UserInfo.symbol1 = textField1.text 
			UserInfo.mass1 = molarMassValue
		end]]


		UserInfo.symbol6 = UserInfo.symbol5
		UserInfo.mass6 = UserInfo.mass5
		UserInfo.symbol5 = UserInfo.symbol4
		UserInfo.mass5 = UserInfo.mass4
		UserInfo.symbol4 = UserInfo.symbol3
		UserInfo.mass4 = UserInfo.mass3
		UserInfo.symbol3 = UserInfo.symbol2
		UserInfo.mass3 = UserInfo.mass2
		UserInfo.symbol2 = UserInfo.symbol1
		UserInfo.mass2 = UserInfo.mass1
		UserInfo.symbol1 = textField1.text 
		UserInfo.mass1 = molarMassValue
		table.save(UserInfo, "userSavedInfo")
	end

	local function copyText(event)
		molarMassValueString = tostring(molarMassValue)
		pasteboard.copy("string", molarMassValueString)
		--copyFunction()
		keyboardListener()
	end
	copyButton:addEventListener("tap", copyText)

	local function saveText(event)
		UserInfo.symbol6 = UserInfo.symbol5
		UserInfo.mass6 = UserInfo.mass5
		UserInfo.symbol5 = UserInfo.symbol4
		UserInfo.mass5 = UserInfo.mass4
		UserInfo.symbol4 = UserInfo.symbol3
		UserInfo.mass4 = UserInfo.mass3
		UserInfo.symbol3 = UserInfo.symbol2
		UserInfo.mass3 = UserInfo.mass2
		UserInfo.symbol2 = UserInfo.symbol1
		UserInfo.mass2 = UserInfo.mass1
		UserInfo.symbol1 = textField1.text 
		UserInfo.mass1 = molarMassValue
		table.save(UserInfo, "userSavedInfo")
		keyboardListener()
	end
	saveButton:addEventListener("tap", saveText)

	local function notesScene(event)
		composer.gotoScene("notes")
	end
	notes:addEventListener("tap", notesScene)

	local function historyScene(event)
		composer.gotoScene("history")
	end
	history:addEventListener("tap", historyScene)

	local function moreSettings(event)
		composer.gotoScene("moreSettings")
	end
--	lists:addEventListener("tap", moreSettings)
end

function adsFunction()
	ads.init( "admob", appID, adListener )
	ads.show( "interstitial", { x=display.contentWidth/2, y=display.contentHeight/2, appID } )
end

function timeTracker()
	if UserInfo.time then
		UserInfo.time = UserInfo.time + 1
		if UserInfo.time > 600 then
			UserInfo.time = 0
			adsFunction()
		end
	end
	table.save(UserInfo, "userSavedInfo")
end

function scene:show(event)
end

function scene:hide(event)
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene

--MAYBE PUT THE SETTINGS PAGE OVER HERE SO THAT YOU CAN GO STRAIGHT TO THE HOME PAGE INSTEAD OF EACH INDIVIDUAL PAGE