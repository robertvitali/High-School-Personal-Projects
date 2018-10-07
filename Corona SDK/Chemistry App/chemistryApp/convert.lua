local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"
require("extensions.table")



function scene:create (event)
	convertGroup = self.view

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
	
	--TITLE ABOVE TEXT BOX
	local notesText = display.newText("Convert", display.contentWidth/2, whiteBar2.y, native.systemFontBold, display.contentHeight/25)
		notesText:setFillColor(0,0,0)

	--Text Field 
	local textField1 = native.newTextField(display.contentWidth/2, whiteBar2.y + display.contentHeight/18 + whiteBar2.height/2, .9*display.contentWidth, display.contentHeight/18)
		textField1.placeholder = "Enter a chemical formula."
		textField1.inputType = "default"
		textField1:setReturnKey("done")
		textField1.textField = "1"
		if (previousFormula ~= "")then
			textField1.text = previousFormula
		end

	local rectangle1 = display.newRect(0,0,textField1.width, textField1.height)
			rectangle1.x = textField1.x
			rectangle1.y = textField1.y
			rectangle1:setStrokeColor(200/255,200/255,200/255)
			rectangle1.strokeWidth = display.contentWidth/50	

	--Text Field
	local textField2 = native.newTextField(display.contentWidth/2, textField1.y + 1.45*textField1.height, .9*display.contentWidth, display.contentHeight/18)
		textField2.placeholder = "Enter gram/mole amount."
		textField2.inputType = "number"
		textField2.textField = "2"
		textField2:setReturnKey("done")

	local rectangle2 = display.newRect(0,0,textField2.width, textField2.height)
			rectangle2.x = textField2.x
			rectangle2.y = textField2.y
			rectangle2:setStrokeColor(200/255,200/255,200/255)
			rectangle2.strokeWidth = display.contentWidth/50

	--Moles button
	local molesButton = display.newText("Convert To Moles", display.contentWidth/2, textField2.y + 100, native.systemFontBold, display.contentHeight/35)
			molesButton.x = rectangle2.x + rectangle2.width/2 - molesButton.width/2
			molesButton.y = textField2.y + 1/1*textField2.height

	--Grams button
	local gramsButton = display.newText("Convert To Grams", display.contentWidth/2, molesButton.y + 100, native.systemFontBold, display.contentHeight/35)
		gramsButton.x = rectangle2.x - rectangle2.width/2 + gramsButton.width/2
		gramsButton.y = textField2.y + 1/1*textField2.height

	--button for decimal
	local decimalButton = display.newText(".", display.contentWidth/2, 0, native.systemFontBold, display.contentHeight/10)
		--decimalButton.y = gramsButton.y + decimalButton.height/3
		decimalButton.y = 1.1*gramsButton.y
		decimalButton.alpha = 0

	--Value Text
	local textOptions = {
			text = "",     
		    x = display.contentWidth/2,
		    y = decimalButton.y*1.1,
		    width = display.contentWidth/1.5,
		    font = native.systemFontBold,   
		    fontSize = display.contentHeight/25,
		    align = "center"  -- Alignment parameter
		}
	local valueText = display.newText(textOptions)

	--Value Text
	local textOptions2 = {
		text = "<- Click this button to add decimal values",     
		x = 3*display.contentWidth/4,
		y = decimalButton.y,
		width = display.contentWidth/4,
		font = native.systemFontBold,   
		fontSize = display.contentHeight/30,
		align = "center"  -- Alignment parameter
		}
	local textInfo = display.newText(textOptions2)
		textInfo.y = textInfo.y + textInfo.height/2
		textInfo.alpha = 0


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
	local convertValue = 0

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
	end

	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end

	local function textListener( event )
		if(event.target.textField == "2")then
			decimalButton.alpha = 1
			if(localData.firstTime <= 100 or localData.firstTime == nil)then
				textInfo.alpha = 1
				if(localData.firstTime == nil)then
					localData.firstTime = 0
				else
					localData.firstTime = localData.firstTime + 1
				end
				table.save(localData, "localDataSaved")
			end
		elseif(event.target.textField == "1")then
			textInfo.alpha = 0
		end
		if(event.phase == "ended" or event.phase == "submitted")then
			keyboardListener()
			--decimalButton.alpha = 0
			textInfo.alpha = 0
	    end
	end
	textField1:addEventListener("userInput", textListener)
	textField2:addEventListener("userInput", textListener)

	local function convertToGrams(event)
		if (textField1.text ~= "" and textField2.text ~= "") then
			molarMassCalculate()
			convertValue = molarMassValue * textField2.text
			valueText.text = molarMassValue.."g/mol "..textField1.text.." * "..textField2.text.." mol = "..convertValue.."g of "..textField1.text
			valueText.y = decimalButton.y + valueText.height/1.4
			decimalButton.alpha = 0
			textInfo.alpha = 0
		end
	end
	gramsButton:addEventListener("tap", convertToGrams)

	local function convertToMoles(event)
		if (textField1.text ~= "" and textField2.text ~= "") then
			molarMassCalculate()
			convertValue = (1/molarMassValue) * textField2.text
			valueText.text = molarMassValue.."g/mol "..textField1.text.." * 1/"..textField2.text.." g = "..convertValue.."mol of "..textField1.text
			valueText.y = decimalButton.y + valueText.height/1.4
			decimalButton.alpha = 0
			textInfo.alpha = 0
		end
	end
	molesButton:addEventListener("tap", convertToMoles)

	local function addDecimal(event)
		textField2.text = textField2.text.."."
		native.setKeyboardFocus( textField2 )
	end
	decimalButton:addEventListener("tap", addDecimal)


	--INSERTING EACH ELEMENT OF THE PAGE INTO THE GROUP TO MAKE REMOVAL EASIER
	convertGroup:insert(background)
	convertGroup:insert(whiteBar2)
	convertGroup:insert(back)
	convertGroup:insert(notesText)
	convertGroup:insert(textField1)
	convertGroup:insert(textField2)
	convertGroup:insert(rectangle1)
	convertGroup:insert(rectangle2)
	convertGroup:insert(molesButton)
	convertGroup:insert(gramsButton)
	convertGroup:insert(valueText)
	convertGroup:insert(decimalButton)
	convertGroup:insert(textInfo)

	

	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function backButton(event)
		convertGroup:removeSelf()
		composer.gotoScene("HomeScreen")
		timer.pause(timer1)
	end
	back:addEventListener("tap", backButton)
	--background:addEventListener("tap", keyboardListener)

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
