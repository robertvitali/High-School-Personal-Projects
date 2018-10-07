display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
local scene = composer.newScene()
local widget = require "widget"
local pasteboard = require ("plugin.pasteboard")
local ads = require( "ads" )
local firebaseAnalytics = require("plugin.firebaseAnalytics")
require("extensions.table")


------------------------------------------------------------------------------------------------------------------------------------

appID = "ca-app-pub-4668108448526393/6920997868"
	if ( system.getInfo( "platformName" ) == "Android" ) then
   		appID = "ca-app-pub-4668108448526393/9787160669"
	end


------------------------------------------------------------------------------------------------------------------------------------


function scene:create (event)

	homeScreenGroup = self.view

	--fixes issues with buttons showing weird on android version
	widget.setTheme( "widget_theme_ios7" )

	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(89/255,89/255,89/255)

	--Top Bar
	whiteBar = display.newRect(display.contentWidth/2, display.contentHeight/7, display.contentWidth, display.contentHeight/8)
		whiteBar.y = whiteBar.height/2
		whiteBar:setFillColor(1,1,1)

	--Notes
	notes = display.newText("Notes", display.contentWidth/7, whiteBar.y, native.systemFontBold, display.contentHeight/25)
		notes.x = display.contentWidth/4 - notes.width/3
		notes:setFillColor(0,0,0)
		notes.nextscene = "notes"

	--History
	history = display.newText("History", display.contentWidth/2, whiteBar.y, native.systemFontBold, display.contentHeight/25)
		history:setFillColor(0,0,0)
		history.nextscene = "history"

	--convertText
	convertText = display.newText("Convert", 6*display.contentWidth/7, whiteBar.y, native.systemFontBold, display.contentHeight/25)
		convertText.x = 3*display.contentWidth/4 + convertText.width/3
		convertText:setFillColor(0,0,0)
		convertText.nextscene = "convert"

	--Text Field
	textField1 = native.newTextField(display.contentWidth/2, whiteBar.y + whiteBar.height, .9*display.contentWidth, display.contentHeight/13)
	textField1.placeholder = "Chemical Formula"
	textField1.inputType = "default"
	textField1.size = display.contentHeight/20
	textField1:setReturnKey("done")

	local rectangle1 = display.newRect(0,0,textField1.width, textField1.height)
		rectangle1.x = textField1.x
		rectangle1.y = textField1.y
		rectangle1:setStrokeColor(200/255,200/255,200/255)
		rectangle1.strokeWidth = display.contentWidth/50


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
		fontSize = display.contentHeight/23,
	}
	copyButton.x = rectangle1.x + rectangle1.width/2 - copyButton.width/2
	copyButton.y = textField1.y + textField1.height
	copyButton.alpha = 0

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
		fontSize = display.contentHeight/23,
	}
	clearButton.x = rectangle1.x - rectangle1.width/2 + clearButton.width/2
	clearButton.y = textField1.y + textField1.height
	clearButton.alpha = 0

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
	previousFormula = ""


	molarMass = display.newText("", display.contentWidth/2, 1.25*clearButton.y, native.systemFontBold, display.contentHeight/20)
	button2 = display.newText("", 1.25*display.contentWidth/6, 1.3*molarMass.y, native.systemFontBold, display.contentHeight/15)
	button1 = display.newText("", 3*display.contentWidth/6, 1.3*molarMass.y, native.systemFontBold, display.contentHeight/15)
	button3 = display.newText("", 4.75*display.contentWidth/6, 1.3*molarMass.y, native.systemFontBold, display.contentHeight/15)



	homeScreenGroup:insert(background)
	homeScreenGroup:insert(whiteBar)
	homeScreenGroup:insert(notes)
	homeScreenGroup:insert(history)
	homeScreenGroup:insert(convertText)
	homeScreenGroup:insert(textField1)
	homeScreenGroup:insert(rectangle1)
	homeScreenGroup:insert(copyButton)
	homeScreenGroup:insert(clearButton)
	homeScreenGroup:insert(button1)
	homeScreenGroup:insert(button2)
	homeScreenGroup:insert(button3)
	homeScreenGroup:insert(molarMass)

	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end


	local function molarMassCalculate()
		multiplier = 1
		textFieldSubString = textField1.text
		molarMassValue = 0
		for i=1, string.len(textField1.text) do
			if((string.sub(textFieldSubString, i, i) == "0") or (string.sub(textFieldSubString, i, i) == "1") or (string.sub(textFieldSubString, i, i) == "2") or (string.sub(textFieldSubString, i, i) == "3") or (string.sub(textFieldSubString, i, i) == "4") or (string.sub(textFieldSubString, i, i) == "5") or (string.sub(textFieldSubString, i, i) == "6") or (string.sub(textFieldSubString, i, i) == "7") or (string.sub(textFieldSubString, i, i) == "8") or (string.sub(textFieldSubString, i, i) == "9"))then
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

			elseif((string.sub(textFieldSubString, i, i) == ")") and ((string.sub(textFieldSubString, i + 1, i + 1) == "0") or (string.sub(textFieldSubString, i + 1, i + 1) == "1") or (string.sub(textFieldSubString, i + 1, i + 1) == "2") or (string.sub(textFieldSubString, i + 1, i + 1) == "3") or (string.sub(textFieldSubString, i + 1, i + 1) == "4") or (string.sub(textFieldSubString, i + 1, i + 1) == "5") or (string.sub(textFieldSubString, i + 1, i + 1) == "6") or (string.sub(textFieldSubString, i + 1, i + 1) == "7") or (string.sub(textFieldSubString, i + 1, i + 1) == "8") or (string.sub(textFieldSubString, i + 1, i + 1) == "9")) and ((string.sub(textFieldSubString, i + 2, i + 2) == "0") or (string.sub(textFieldSubString, i + 2, i + 2) == "1") or (string.sub(textFieldSubString, i + 2, i + 2) == "2") or (string.sub(textFieldSubString, i + 2, i + 2) == "3") or (string.sub(textFieldSubString, i + 2, i + 2) == "4") or (string.sub(textFieldSubString, i + 2, i + 2) == "5") or (string.sub(textFieldSubString, i + 2, i + 2) == "6") or (string.sub(textFieldSubString, i + 2, i + 2) == "7") or (string.sub(textFieldSubString, i + 2, i + 2) == "8") or (string.sub(textFieldSubString, i + 2, i + 2) == "9")))then
				numberMultiply = tonumber(string.sub(textFieldSubString, i+1, i+2))
				molarMassValue = molarMassValue*numberMultiply + molarMassValueOut
				i = i + 2

			elseif((string.sub(textFieldSubString, i, i) == ")") and ((string.sub(textFieldSubString, i + 1, i + 1) == "0") or (string.sub(textFieldSubString, i + 1, i + 1) == "1") or (string.sub(textFieldSubString, i + 1, i + 1) == "2") or (string.sub(textFieldSubString, i + 1, i + 1) == "3") or (string.sub(textFieldSubString, i + 1, i + 1) == "4") or (string.sub(textFieldSubString, i + 1, i + 1) == "5") or (string.sub(textFieldSubString, i + 1, i + 1) == "6") or (string.sub(textFieldSubString, i + 1, i + 1) == "7") or (string.sub(textFieldSubString, i + 1, i + 1) == "8") or (string.sub(textFieldSubString, i + 1, i + 1) == "9")))then
				numberMultiply = tonumber(string.sub(textFieldSubString, i + 1, i + 1))
				molarMassValue = molarMassValue*numberMultiply + molarMassValueOut
				i = i + 1

			elseif (string.sub(textFieldSubString, i, i) == "A") then
				if(string.sub(textFieldSubString,i+1,i+1) == "l")then
					--molarMassValue = molarMassValue + element.Al
					i = i + 1
					lastValue = element.Al
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Ar
					i = i + 1
					lastValue = element.Ar
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					--molarMassValue = molarMassValue + element.As
					i = i + 1
					lastValue = element.As
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					--molarMassValue = molarMassValue + element.Ag
					i = i + 1
					lastValue = element.Ag
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					--molarMassValue = molarMassValue + element.Au
					i = i + 1
					lastValue = element.Au
				elseif(string.sub(textFieldSubString,i+1,i+1) == "t")then
					--molarMassValue = molarMassValue + element.At
					i = i + 1
					lastValue = element.At
				elseif(string.sub(textFieldSubString,i+1,i+1) == "c")then
					--molarMassValue = molarMassValue + element.Ac
					i = i + 1
					lastValue = element.Ac
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					--molarMassValue = molarMassValue + element.Am
					i = i + 1
					lastValue = element.Am
				end

			elseif (string.sub(textFieldSubString, i, i) == "B") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					--molarMassValue = molarMassValue + element.Ba
					i = i + 1
					lastValue = element.Ba
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					--molarMassValue = molarMassValue + element.Be
					i = i + 1
					lastValue = element.Be
				elseif(string.sub(textFieldSubString,i+1,i+1) == "h")then
					--molarMassValue = molarMassValue + element.Bh
					i = i + 1
					lastValue = element.Bh
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					--molarMassValue = molarMassValue + element.Bi
					i = i + 1
					lastValue = element.Bi
				elseif(string.sub(textFieldSubString,i+1,i+1) == "k")then
					--molarMassValue = molarMassValue + element.Bk
					i = i + 1
					lastValue = element.Bk
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Br
					i = i + 1
					lastValue = element.Br
				else
					--molarMassValue = molarMassValue + element.B
					lastValue = element.B
				end

			elseif (string.sub(textFieldSubString, i, i) == "C") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					--molarMassValue = molarMassValue + element.Ca
					i = i + 1
					lastValue = element.Ca
				elseif(string.sub(textFieldSubString,i+1,i+1) == "l")then
					--molarMassValue = molarMassValue + element.Cl
					i = i + 1
					lastValue = element.Cl
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Cr
					i = i + 1
					lastValue = element.Cr
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					--molarMassValue = molarMassValue + element.Co
					i = i + 1
					lastValue = element.Co
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					--molarMassValue = molarMassValue + element.Cu
					i = i + 1
					lastValue = element.Cu
				elseif(string.sub(textFieldSubString,i+1,i+1) == "d")then
					--molarMassValue = molarMassValue + element.Cd
					i = i + 1
					lastValue = element.Cd
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					--molarMassValue = molarMassValue + element.Cs
					i = i + 1
					lastValue = element.Cs
				elseif(string.sub(textFieldSubString,i+1,i+1) == "n")then
					--molarMassValue = molarMassValue + element.Cn
					i = i + 1
					lastValue = element.Cn
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					--molarMassValue = molarMassValue + element.Ce
					i = i + 1
					lastValue = element.Ce
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					--molarMassValue = molarMassValue + element.Cm
					i = i + 1
					lastValue = element.Cm
				elseif(string.sub(textFieldSubString,i+1,i+1) == "f")then
					--molarMassValue = molarMassValue + element.Cf
					i = i + 1
					lastValue = element.Cf
				else
					--molarMassValue = molarMassValue + element.C
					lastValue = element.C
				end

			elseif (string.sub(textFieldSubString, i, i) == "D") then
				if(string.sub(textFieldSubString,i+1,i+1) == "b")then
					--molarMassValue = molarMassValue + element.Db
					i = i + 1
					lastValue = element.Db
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					--molarMassValue = molarMassValue + element.Ds
					i = i + 1
					lastValue = element.Ds
				elseif(string.sub(textFieldSubString,i+1,i+1) == "y")then
					--molarMassValue = molarMassValue + element.Dy
					i = i + 1
					lastValue = element.Dy
				end

			elseif (string.sub(textFieldSubString, i, i) == "E") then
				if(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Er
					i = i + 1
					lastValue = element.Er
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					--molarMassValue = molarMassValue + element.Es
					i = i + 1
					lastValue = element.Es
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					--molarMassValue = molarMassValue + element.Eu
					i = i + 1
					lastValue = element.Eu
				end

			elseif(string.sub(textFieldSubString, i, i) == "F")then
				if(string.sub(textFieldSubString, i+1, i+1) == "e")then
					--molarMassValue = molarMassValue + element.Fe
					i = i + 1
					lastValue = element.Fe
				elseif(string.sub(textFieldSubString, i+1, i+1) == "r")then
					--molarMassValue = molarMassValue + element.Fr
					i = i + 1
					lastValue = element.Fr
				elseif(string.sub(textFieldSubString, i+1, i+1) == "l")then
					--molarMassValue = molarMassValue + element.Fl
					i = i + 1
					lastValue = element.Fl
				elseif(string.sub(textFieldSubString, i+1, i+1) == "m")then
					--molarMassValue = molarMassValue + element.Fm
					i = i + 1
					lastValue = element.Fm
				else
					--molarMassValue = molarMassValue + element.F
					lastValue = element.F
				end

			elseif(string.sub(textFieldSubString, i, i) == "G")then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					--molarMassValue = molarMassValue + element.Ga
					i = i + 1
					lastValue = element.Ga
				elseif(string.sub(textFieldSubString,i+1,i+1) == "d")then
					--molarMassValue = molarMassValue + element.Gd
					i = i + 1
					lastValue = element.Gd
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					--molarMassValue = molarMassValue + element.Ge
					i = i + 1
					lastValue = element.Ge
				end

			elseif (string.sub(textFieldSubString, i, i) == "H") then
				if(string.sub(textFieldSubString,i+1,i+1) == "e")then
					--molarMassValue = molarMassValue + element.He
					i = i + 1
					lastValue = element.He
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					--molarMassValue = molarMassValue + element.Hg
					i = i + 1
					lastValue = element.Hg
				elseif(string.sub(textFieldSubString,i+1,i+1) == "f")then
					--molarMassValue = molarMassValue + element.Hf
					i = i + 1
					lastValue = element.Hf
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					--molarMassValue = molarMassValue + element.Ho
					i = i + 1
					lastValue = element.Ho
				elseif(string.sub(textFieldSubString,i+1,i+1) == "s")then
					--molarMassValue = molarMassValue + element.Hs
					i = i + 1
					lastValue = element.Hs
				else 
					--molarMassValue = molarMassValue + element.H
					lastValue = element.H
				end

			elseif (string.sub(textFieldSubString, i, i) == "I") then
				if(string.sub(textFieldSubString,i+1,i+1) == "n")then
					--molarMassValue = molarMassValue + element.In
					i = i + 1
					lastValue = element.In
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Ir
					i = i + 1
					lastValue = element.Ir
				else
					--molarMassValue = molarMassValue + element.I
					lastValue = element.I
				end

			elseif (string.sub(textFieldSubString, i, i) == "K") then
				if(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Kr
					i = i + 1
					lastValue = element.Kr
				else
					--molarMassValue = molarMassValue + element.K
					lastValue = element.K
				end

			elseif (string.sub(textFieldSubString, i, i) == "L") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					--molarMassValue = molarMassValue + element.La
					i = i + 1
					lastValue = element.La
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					--molarMassValue = molarMassValue + element.Li
					i = i + 1
					lastValue = element.Li
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Lr
					i = i + 1
					lastValue = element.Lr
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					--molarMassValue = molarMassValue + element.Lu
					i = i + 1
					lastValue = element.Lu
				elseif(string.sub(textFieldSubString,i+1,i+1) == "v")then
					--molarMassValue = molarMassValue + element.Lv
					i = i + 1
					lastValue = element.Lv
				end

			elseif (string.sub(textFieldSubString, i, i) == "M") then
				if(string.sub(textFieldSubString,i+1,i+1) == "d")then
					--molarMassValue = molarMassValue + element.Md
					i = i + 1
					lastValue = element.Md
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					--molarMassValue = molarMassValue + element.Mg
					i = i + 1
					lastValue = element.Mg
				elseif(string.sub(textFieldSubString,i+1,i+1) == "n")then
					--molarMassValue = molarMassValue + element.Mn
					i = i + 1
					lastValue = element.Mn
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					--molarMassValue = molarMassValue + element.Mo
					i = i + 1
					lastValue = element.Mo
				elseif(string.sub(textFieldSubString,i+1,i+1) == "t")then
					--molarMassValue = molarMassValue + element.Mt
					i = i + 1
					lastValue = element.Mt
				end

			elseif (string.sub(textFieldSubString, i, i) == "N") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					--molarMassValue = molarMassValue + element.Na
					i = i + 1
					lastValue = element.Na
				elseif(string.sub(textFieldSubString,i+1,i+1) == "b")then
					--molarMassValue = molarMassValue + element.Nb
					i = i + 1
					lastValue = element.Nb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "d")then
					--molarMassValue = molarMassValue + element.Nd
					i = i + 1
					lastValue = element.Nd
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					--molarMassValue = molarMassValue + element.Ne
					i = i + 1
					lastValue = element.Ne
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					--molarMassValue = molarMassValue + element.Ni
					i = i + 1
					lastValue = element.Ni
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					--molarMassValue = molarMassValue + element.No
					i = i + 1
					lastValue = element.No
				elseif(string.sub(textFieldSubString,i+1,i+1) == "p")then
					--molarMassValue = molarMassValue + element.Np
					i = i + 1
					lastValue = element.Np
				else
					--molarMassValue = molarMassValue + element.N
					lastValue = element.N
				end

			elseif (string.sub(textFieldSubString, i, i) == "O") then
				if(string.sub(textFieldSubString,i+1,i+1) == "s")then
					--molarMassValue = molarMassValue + element.Os
					i = i + 1
					lastValue = element.Os
				else
					--molarMassValue = molarMassValue + element.O
					lastValue = element.O
				end

			elseif (string.sub(textFieldSubString, i, i) == "P") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					--molarMassValue = molarMassValue + element.Pa
					i = i + 1
					lastValue = element.Pa
				elseif(string.sub(textFieldSubString,i+1,i+1) == "b")then
					--molarMassValue = molarMassValue + element.Pb
					i = i + 1
					lastValue = element.Pb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "d")then
					--molarMassValue = molarMassValue + element.Pd
					i = i + 1
					lastValue = element.Pd
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					--molarMassValue = molarMassValue + element.Pm
					i = i + 1
					lastValue = element.Pm
				elseif(string.sub(textFieldSubString,i+1,i+1) == "o")then
					--molarMassValue = molarMassValue + element.Po
					i = i + 1
					lastValue = element.Po
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Pr
					i = i + 1
					lastValue = element.Pr
				elseif(string.sub(textFieldSubString,i+1,i+1) == "t")then
					--molarMassValue = molarMassValue + element.Pt
					i = i + 1
					lastValue = element.Pt
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					--molarMassValue = molarMassValue + element.Pu
					i = i + 1
					lastValue = element.Pu
				else
					--molarMassValue = molarMassValue + element.P
					lastValue = element.P
				end

			elseif (string.sub(textFieldSubString, i, i) == "R") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					--molarMassValue = molarMassValue + element.Ra
					i = i + 1
					lastValue = element.Ra
				elseif(string.sub(textFieldSubString,i+1,i+1) == "b")then
					--molarMassValue = molarMassValue + element.Rb
					i = i + 1
					lastValue = element.Rb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					--molarMassValue = molarMassValue + element.Re
					i = i + 1
					lastValue = element.Re
				elseif(string.sub(textFieldSubString,i+1,i+1) == "f")then
					--molarMassValue = molarMassValue + element.Rf
					i = i + 1
					lastValue = element.Rf
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					--molarMassValue = molarMassValue + element.Rg
					i = i + 1
					lastValue = element.Rg
				elseif(string.sub(textFieldSubString,i+1,i+1) == "h")then
					--molarMassValue = molarMassValue + element.Rh
					i = i + 1
					lastValue = element.Rh
				elseif(string.sub(textFieldSubString,i+1,i+1) == "n")then
					--molarMassValue = molarMassValue + element.Rn
					i = i + 1
					lastValue = element.Rn
				elseif(string.sub(textFieldSubString,i+1,i+1) == "u")then
					--molarMassValue = molarMassValue + element.Ru
					i = i + 1
					lastValue = element.Ru
				end

			elseif (string.sub(textFieldSubString, i, i) == "S") then
				if(string.sub(textFieldSubString,i+1,i+1) == "b")then
					--molarMassValue = molarMassValue + element.Sb
					i = i + 1
					lastValue = element.Sb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "c")then
					--molarMassValue = molarMassValue + element.Sc
					i = i + 1
					lastValue = element.Sc
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					--molarMassValue = molarMassValue + element.Se
					i = i + 1
					lastValue = element.Se
				elseif(string.sub(textFieldSubString,i+1,i+1) == "g")then
					--molarMassValue = molarMassValue + element.Sg
					i = i + 1
					lastValue = element.Sg
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					--molarMassValue = molarMassValue + element.Si
					i = i + 1
					lastValue = element.Si
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					--molarMassValue = molarMassValue + element.Sm
					i = i + 1
					lastValue = element.Sm
				elseif(string.sub(textFieldSubString,i+1,i+1) == "n")then
					--molarMassValue = molarMassValue + element.Sn
					i = i + 1
					lastValue = element.Sn
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Sr
					i = i + 1
					lastValue = element.Sr
				else
					--molarMassValue = molarMassValue + element.S
					lastValue = element.S
				end

			elseif (string.sub(textFieldSubString, i, i) == "T") then
				if(string.sub(textFieldSubString,i+1,i+1) == "a")then
					--molarMassValue = molarMassValue + element.Ta
					i = i + 1
					lastValue = element.Ta
				elseif(string.sub(textFieldSubString,i+1,i+1) == "b")then
					--molarMassValue = molarMassValue + element.Tb
					i = i + 1
					lastValue = element.Tb
				elseif(string.sub(textFieldSubString,i+1,i+1) == "c")then
					--molarMassValue = molarMassValue + element.Tc
					i = i + 1
					lastValue = element.Tc
				elseif(string.sub(textFieldSubString,i+1,i+1) == "e")then
					--molarMassValue = molarMassValue + element.Te
					i = i + 1
					lastValue = element.Te
				elseif(string.sub(textFieldSubString,i+1,i+1) == "h")then
					--molarMassValue = molarMassValue + element.Th
					i = i + 1
					lastValue = element.Th
				elseif(string.sub(textFieldSubString,i+1,i+1) == "i")then
					--molarMassValue = molarMassValue + element.Ti
					i = i + 1
					lastValue = element.Ti
				elseif(string.sub(textFieldSubString,i+1,i+1) == "l")then
					--molarMassValue = molarMassValue + element.Tl
					i = i + 1
					lastValue = element.Tl
				elseif(string.sub(textFieldSubString,i+1,i+1) == "m")then
					--molarMassValue = molarMassValue + element.Tm
					i = i + 1
					lastValue = element.Tm
				end
			elseif (string.sub(textFieldSubString, i, i) == "U") then
				if(string.sub(textFieldSubString,i+1,i+2) == "uo")then
					--molarMassValue = molarMassValue + element.Uuo
					i = i + 2
					lastValue = element.Uuo
				elseif(string.sub(textFieldSubString,i+1,i+2) == "up")then
					--molarMassValue = molarMassValue + element.Uup
					i = i + 2
					lastValue = element.Uup
				elseif(string.sub(textFieldSubString,i+1,i+2) == "us")then
					--molarMassValue = molarMassValue + element.Uus
					i = i + 2
					lastValue = element.Uus
				elseif(string.sub(textFieldSubString,i+1,i+2) == "ut")then
					--molarMassValue = molarMassValue + element.Uut
					i = i + 2
					lastValue = element.Uut
				else
					--molarMassValue = molarMassValue + element.U
					lastValue = element.U
				end
			elseif (string.sub(textFieldSubString, i, i) == "V") then
				--molarMassValue = molarMassValue + element.V
				lastValue = element.V
			elseif (string.sub(textFieldSubString, i, i) == "W") then
				--molarMassValue = molarMassValue + element.W
				lastValue = element.W
			elseif (string.sub(textFieldSubString, i, i+1) == "Xe") then
				--molarMassValue = molarMassValue + element.Xe
				lastValue = element.Xe
				i = i + 1
			elseif (string.sub(textFieldSubString, i, i) == "Y") then
				if(string.sub(textFieldSubString,i+1,i+1) == "b")then
					--molarMassValue = molarMassValue + element.Yb
					i = i + 1
					lastValue = element.Yb
				else
					--molarMassValue = molarMassValue + element.Y
					lastValue = element.Y
				end
			elseif (string.sub(textFieldSubString, i, i) == "Z") then
				if(string.sub(textFieldSubString,i+1,i+1) == "n")then
					--molarMassValue = molarMassValue + element.Yb
					i = i + 1
					lastValue = element.Zn
				elseif(string.sub(textFieldSubString,i+1,i+1) == "r")then
					--molarMassValue = molarMassValue + element.Y
					lastValue = element.Zr
				end
			end

			if(multiplier > 1)then
				--molarMassValue = molarMassValue - lastValue
				molarMassValue = molarMassValue + lastValue*multiplier
			else
				molarMassValue = molarMassValue + lastValue
				--lastValue = 0
			end

			if((string.sub(textFieldSubString, i+1, i+1) == "0") or (string.sub(textFieldSubString, i+1, i+1) == "1") or (string.sub(textFieldSubString, i+1, i+1) == "2") or (string.sub(textFieldSubString, i+1, i+1) == "3") or (string.sub(textFieldSubString, i+1, i+1) == "4") or (string.sub(textFieldSubString, i+1, i+1) == "5") or (string.sub(textFieldSubString, i+1, i+1) == "6") or (string.sub(textFieldSubString, i+1, i+1) == "7") or (string.sub(textFieldSubString, i+1, i+1) == "8") or (string.sub(textFieldSubString, i+1, i+1) == "9")) then
				molarMassValue = molarMassValue - lastValue
			else
				lastValue = 0
			end

			multiplier = 1
		end
		molarMass.text = molarMassValue.." g/mol"
	end

	local function textListener( event )
		if(textField1.text ~= "")then
			clearButton.alpha = 1
			copyButton.alpha = 1
		elseif(textField1.text == "")then
			clearButton.alpha = 0
			copyButton.alpha = 0
		end
	    if ( event.phase == "editing" ) then
	    	button1.text = ""
	    	button2.text = ""
	    	button3.text = ""


	    	letterVar = event.newCharacters
	    	
	    	if(letterVar == "a")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "B" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "b")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "c")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "G" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "g")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "L" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "l")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "n")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "P" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "p")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "R" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "r")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "t")then
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
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "D" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "d")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "n")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "P" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "p")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "R" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "r")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "s")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "t")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "Y" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "y")then
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
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "A" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "a")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "s")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "t")then
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
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "c")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "G" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "g")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "M" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "m")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "n")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "P" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "p")then
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

			elseif(letterVar == "e")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "B" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "b")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "c")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "F" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "f")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "G" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "g")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "H" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "h")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "n")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "R" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "r")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "s")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "t")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "X" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "x")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Er"
					button2.text = "Es"
					button3.text = "Eu"
				end
			elseif(letterVar == "E")then
				button1.text = "Er"
				button2.text = "Es"
				button3.text = "Eu"

			elseif(letterVar == "f")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "c")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "H" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "h")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "R" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "r")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "F"
					button2.text = "Fe"
					button3.text = "Fr"
				end
			elseif(letterVar == "F")then
				button1.text = "F"
				button2.text = "Fe"
				button3.text = "Fr"
	        

	        elseif(letterVar == "g")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "A" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "a")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "H" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "h")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "M" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "m")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "R" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "r")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "s")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "h") or (string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "H")then
					button1.text = "Hg2"
				else
		        	button1.text = "Gd"
					button2.text = "Ga"
					button3.text = "Ge"
				end
			elseif(letterVar == "G")then
				button1.text = "Gd"
				button2.text = "Ga"
				button3.text = "Ge"
	        

	    	elseif(letterVar == "h")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "B" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "b")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "B" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N")then
					button1.text = "NH4"
				else
		        	button1.text = "H"
					button2.text = "He"
					button3.text = "Hg"
				end
			elseif(letterVar == "H")then
				if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "B" or string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N")then
					button1.text = "NH4"
				else
					button1.text = "H"
					button2.text = "He"
					button3.text = "Hg"
				end

	        elseif(letterVar == "i")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "B")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "L")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "I"
					button2.text = "In"
					button3.text = "Ir"
				end
			elseif(letterVar == "I")then
				button1.text = "I"
				button2.text = "In"
				button3.text = "Ir"
	        

			elseif(letterVar == "K" or letterVat == "k")then
				button1.text = "K"
				button3.text = "Kr"

			elseif(letterVar == "l")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "A")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C")then
					button2.text = "ClO2"
					button3.text = "ClO3"
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "F")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Li"
					button2.text = "Lu"
					button3.text = "Lv"
				end
			elseif(letterVar == "L")then
				button1.text = "Li"
				button2.text = "Lu"
				button3.text = "Lv"
	        

	        elseif(letterVar == "m")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "A")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "F")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "P")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "T")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Mg"
					button2.text = "Mn"
					button3.text = "Mo"
				end
			elseif(letterVar == "M")then
				button1.text = "Mg"
				button2.text = "Mn"
				button3.text = "Mo"
	        

	        elseif(letterVar == "n")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "I")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "M")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "R")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "Z")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N") or (string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "n")then
					button1.text = "NO3"
					button2.text = "NO2"
					button3.text = "NO4"
				else
		        	button1.text = "N"
					button2.text = "Na"
					button3.text = "Ni"
				end
			elseif(letterVar == "N")then
				button1.text = "N"
				button2.text = "Na"
				button3.text = "Ni"
	        
	        elseif(letterVar == "o")then
	        	if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S") or (string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "s")then
	        		button1.text = "SO3"
	        		button2.text = "SO2"
	        		button3.text = "SO4"
	        	elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S") or (string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "s") and (string.sub(textField1.text, string.len(textField1.text)-2, string.len(textField1.text)-2) == "H") or (string.sub(textField1.text, string.len(textField1.text)-2, string.len(textField1.text)-2) == "h")then
	        		button1.text = "HSO3"
	        		button2.text = "HSO2"
	        		button3.text = "HSO4"
	        	elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "P") or (string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "p")then
	        		button1.text = "PO3"
	        		button2.text = "PO2"
	        		button3.text = "PO4"
	        	else
		    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C")then
						button2.text = string.upper(letterVar)
						button3.text = string.lower(letterVar)
					elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "H")then
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
					elseif(string.sub(textField1.text, string.len(textField1.text)-2, string.len(textField1.text)-1) == "Uu")then
						button2.text = string.upper(letterVar)
						button3.text = string.lower(letterVar)
					else
			        	button1.text = "O"
						button2.text = "Os"
						button3.text = "OH"
					end
				end
			elseif(letterVar == "O")then
				if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "S") or (string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "s")then
	        		button1.text = "SO3"
	        		button2.text = "SO2"
	        		button3.text = "SO4"
	        	else
					button1.text = "O"
					button2.text = "Os"
					button3.text = "OH"
				end
	        
	        elseif(letterVar == "p")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "N")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "P"
					button2.text = "Pb"
					button3.text = "Pt"
				end
			elseif(letterVar == "P")then
				button1.text = "P"
				button2.text = "Pb"
				button3.text = "Pt"

	        elseif(letterVar == "r")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "A")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "B")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "F")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "I")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "L")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "P")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "Z")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Ra"
					button2.text = "Rb"
					button3.text = "Ru"
				end
			elseif(letterVar == "R")then
				button1.text = "Ra"
				button2.text = "Rb"
				button3.text = "Ru"
				
			elseif(letterVar == "s")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "A")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "D")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "H")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "O")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "S"
					button2.text = "Si"
					button3.text = "Sn"
				end
			elseif(letterVar == "S")then
				button1.text = "S"
				button2.text = "Si"
				button3.text = "Sn"

			elseif(letterVar == "t")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "A")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "M")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "Ps")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "Uu")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Ta"
					button2.text = "Te"
					button3.text = "Tl"
				end
			elseif(letterVar == "T")then
				button1.text = "Ta"
				button2.text = "Te"
				button3.text = "Tl"


			elseif(letterVar == "u")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "A")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "C")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				elseif(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "L")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "U"
					button2.text = "Au"
					button3.text = "Cu"
				end
			elseif(letterVar == "U")then
				button1.text = "U"
				button2.text = "Au"
				button3.text = "Cu"


			elseif(letterVar == "v")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "L")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "V"
					button2.text = ""
					button3.text = "Lv"
				end
			elseif(letterVar == "V")then
				button1.text = "V"
				button2.text = ""
				button3.text = "Lv"

			elseif(letterVar == "w" or letterVar == "W")then
		        button1.text = "W"
		        button2.text = ""
		        button3.text = ""

			elseif(letterVar == "x" or letterVar == "X")then
		        button1.text = "Xe"
		        button2.text = ""
		        button3.text = ""
		
			elseif(letterVar == "y")then
	    		if(string.sub(textField1.text, string.len(textField1.text)-1, string.len(textField1.text)-1) == "D")then
					button2.text = string.upper(letterVar)
					button3.text = string.lower(letterVar)
				else
		        	button1.text = "Y"
		        	button2.text = ""
					button3.text = "Yb"
				end
			elseif(letterVar == "Y")then
				button1.text = "Y"
		        button2.text = ""
				button3.text = "Yb"

			elseif(letterVar == "z" or letterVar == "Z")then
		        button1.text = "Zn"
				button2.text = ""
				button3.text = "Zr"
	        end
	        
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
			if((string.len(button1.text) == 2) or (string.len(button1.text) == 1)) then
				textFieldString = string.sub(textFieldString, 1, string.len(textFieldString) - 1)..button1.text
			elseif(string.len(button1.text) == 3)then
				textFieldString = string.sub(textFieldString, 1, string.len(textFieldString) - 2)..button1.text
			elseif(string.len(button1.text) == 4)then
				textFieldString = string.sub(textFieldString, 1, string.len(textFieldString) - 3)..button1.text
			end

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
			if((string.len(button2.text) == 2) or (string.len(button2.text) == 1)) then
				textFieldString = string.sub(textFieldString, 1, string.len(textFieldString) - 1)..button2.text
			elseif(string.len(button2.text) == 3)then
				textFieldString = string.sub(textFieldString, 1, string.len(textFieldString) - 2)..button2.text
			elseif(string.len(button2.text) == 4)then
				textFieldString = string.sub(textFieldString, 1, string.len(textFieldString) - 3)..button2.text
			end

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
			if((string.len(button3.text) == 2) or (string.len(button3.text) == 1)) then
				textFieldString = string.sub(textFieldString, 1, string.len(textFieldString) - 1)..button3.text
			elseif(string.len(button3.text) == 3)then
				textFieldString = string.sub(textFieldString, 1, string.len(textFieldString) - 2)..button3.text
			elseif(string.len(button3.text) == 4)then
				textFieldString = string.sub(textFieldString, 1, string.len(textFieldString) - 3)..button3.text
			end

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

	local function clearText(event)
		textField1.text = ""
		button1.text = ""
		button2.text = ""
		button3.text = ""
		molarMassValue = 0
		molarMass.text = ""
		multiplier = 1
	end
	clearButton:addEventListener("tap", clearText)


	local function copyFunction()
		localData.symbol6 = localData.symbol5
		localData.mass6 = localData.mass5
		localData.symbol5 = localData.symbol4
		localData.mass5 = localData.mass4
		localData.symbol4 = localData.symbol3
		localData.mass4 = localData.mass3
		localData.symbol3 = localData.symbol2
		localData.mass3 = localData.mass2
		localData.symbol2 = localData.symbol1
		localData.mass2 = localData.mass1
		localData.symbol1 = textField1.text 
		localData.mass1 = molarMassValue
		table.save(localData, "localDataSaved")
	end

	local function copyText(event)
		molarMassValueString = tostring(molarMassValue)
		pasteboard.copy("string", molarMassValueString)
		copyFunction()
		keyboardListener()
	end
	copyButton:addEventListener("tap", copyText)

	local function gotoScene(event)
		if (event.target.nextscene == "convert")then
			if(textField1.text ~= "")then
				previousFormula = textField1.text
			else
				previousFormula = ""
			end
		end
		composer.gotoScene("convert")
		composer.gotoScene(event.target.nextscene)
		firebaseAnalytics.logEvent("select_content", {content_type = event.target.nextscene})
	end
	convertText:addEventListener("tap", gotoScene)
	history:addEventListener("tap", gotoScene)
	notes:addEventListener("tap", gotoScene)

	local function adsFunction()
		localData.time = localData.time + 1
		if localData.time > 200 then
			localData.time = 0
			ads.init( "admob", appID, adListener )
			ads.show( "interstitial", { x=display.contentWidth/2, y=display.contentHeight/2, appID } )
		end
		table.save(localData, "localDataSaved")
	end

	timer1 = timer.performWithDelay(1000, adsFunction, 0)
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