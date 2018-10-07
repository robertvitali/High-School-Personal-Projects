--SETTINGS PAGE 1 TEST

--display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"

--TO MAKE SURE THAT THE INFO WAS SAVED
local function saveButtonEvent (event)
	local phase = event.phase
	
	if "ended" == phase then
		print ("Information saved")
	end
end

--local save = widget.newButton
--{
--	left = 265,
--	top = -15,
--	width = 60,
--	height = 20,
----	defaultFile = "default.png"
----	overFile = "over.png"
--	id = "save",
--	label = "Save",
--	onEvent = saveButtonEvent,
--}

--local back = widget.newButton
--{
--	left = 0,
--	top = -15,
--	width = 60,
--	height = 20,
----	defaultFile = "default.png"
----	overFile = "over.png"
--	id = "back",
--	label = "< Back",
--	onEvent = backButtonEvent,
--}

local back = display.newText("< Back", display.viewableContentWidth - 290, display.viewableContentHeight - 480, native.systemFont, 16)
	back:setFillColor(0,0,0)
	
local save = display.newText(" Save", display.viewableContentWidth - 25, display.viewableContentHeight - 480, native.systemFont, 16)
	save:setFillColor(0,0,0)


--TO MAKE SURE THAT THE BACK BUTTON WAS PRESSED AND WORKS
local function backButtonEvent (event)
	local phase = event.phase
	
	if "ended" == phase then
		print ("Returned to Day 1 page")
	end
end

--CREATING SCENE HERE
function scene:create (event)
	local settingsGroup = self.view
	
	background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, 670)
		background:setFillColor(.6,0,0)

	local temp = display.newText("Settings", display.contentWidth/2, 0, native.systemFont, 20)
		temp:setFillColor(0,0,0)
		
	local underline = display.newLine(display.viewableContentWidth - 200, display.viewableContentHeight - 470, display.viewableContentWidth - 120, display.viewableContentHeight - 470)
		underline.strokeWidth = 2
		underline:setStrokeColor (0,0,0) 
	aText = display.newText("A Band: ", 72, 35, native.systemFont, 14)
		aText:setFillColor(0,0,0)
	aBandField = native.newTextField(200, 35, 200, 22)
	local period2Border = display.newRect(200, 35, 201, 23)
		period2Border.strokeWidth = 3
		period2Border:setStrokeColor(0,0,0)
		aBandField.inputType = "default"
		
	bText = display.newText("B Band: ", 72, 75, native.systemFont, 14)
		bText:setFillColor(0,0,0)
	bBandField = native.newTextField(200, 75, 200, 22)
	local period3Border = display.newRect(200, 75, 201, 23)
		period3Border.strokeWidth = 3
		period3Border:setStrokeColor(0,0,0)
	bBandField.inputType = "default"

	cText = display.newText("C Band: ", 72, 115, native.systemFont, 14)
		cText:setFillColor(0,0,0)
	cBandField = native.newTextField(200, 115, 200, 22)
	local period4Border = display.newRect(200, 115, 201, 23)
		period4Border.strokeWidth = 3
		period4Border:setStrokeColor(0,0,0)
		cBandField.inputType = "default"

	breakText = display.newText("Break: ", 76, 155, native.systemFont, 14)
		breakText:setFillColor(0,0,0)
	breakField = native.newTextField(200, 155, 200, 22)
	local period5Border = display.newRect(200, 155, 201, 23)
		period5Border.strokeWidth = 3
		period5Border:setStrokeColor(0,0,0)
		breakField.inputType = "default"

	advisingText = display.newText("Advising: ", 70, 195, native.systemFont, 14)
		advisingText:setFillColor(0,0,0)
	advisingField = native.newTextField(200, 195, 200, 22)
	local period6Border = display.newRect(200, 195, 201, 23)
		period6Border.strokeWidth = 3
		period6Border:setStrokeColor(0,0,0)
	advisingField.inputType = "default"

	lunchText = display.newText("Lunch: ", 75, 230, native.systemFont, 14)
		lunchText:setFillColor(0,0,0)
	lunchField = native.newTextField(200, 235, 200, 22)
	local period7Border = display.newRect(200, 235, 201, 23)
		period7Border.strokeWidth = 3
		period7Border:setStrokeColor(0,0,0)
		lunchField.inputType = "default"

	dText = display.newText("D Band: ", 72, 275, native.systemFont, 14)
		dText:setFillColor(0,0,0)		
	dBandField = native.newTextField(200, 275, 200, 22)
	local period8Border = display.newRect(200, 275, 201, 23)
		period8Border.strokeWidth = 3
		period8Border:setStrokeColor(0,0,0)
	dBandField.inputType = "default"
	
	eText = display.newText("E Band: ", 72, 315, native.systemFont, 14)
		eText:setFillColor(0,0,0)		
	eBandField = native.newTextField(200, 315, 200, 22)
	local period9Border = display.newRect(200, 315, 201, 23)
		period9Border.strokeWidth = 3
		period9Border:setStrokeColor(0,0,0)
	eBandField.inputType = "default"

	fText = display.newText("F Band: ", 72, 355, native.systemFont, 14)
		fText:setFillColor(0,0,0)
	fBandField = native.newTextField(200, 355, 200, 22)
	local period10Border = display.newRect(200, 355, 201, 23)
		period10Border.strokeWidth = 3
		period10Border:setStrokeColor(0,0,0)
		fBandField.inputType = "default"

	gText = display.newText("G Band: ", 72, 395, native.systemFont, 14)
		gText:setFillColor(0,0,0)
	gBandField = native.newTextField(200, 395, 200, 22)
	local period11Border = display.newRect(200, 395, 201, 23)
		period11Border.strokeWidth = 3
		period11Border:setStrokeColor(0,0,0)
	gBandField.inputType = "default"
	
	communityText = display.newText("Community: ", 55, 435, native.systemFont, 14)
		communityText:setFillColor(0,0,0)
	communityField = native.newTextField(200, 435, 200, 22)
	local period12Border = display.newRect(200, 435, 201, 23)
		period12Border.strokeWidth = 3
		period12Border:setStrokeColor(0,0,0)
	communityField.inputType = "default"
	
	settingsGroup:insert(background)
	settingsGroup:insert(temp)
	settingsGroup:insert(underline)
	settingsGroup:insert(back)
	settingsGroup:insert(save)
	settingsGroup:insert(aText)
	settingsGroup:insert(bText)
	settingsGroup:insert(advisingText)
	settingsGroup:insert(breakText)
	settingsGroup:insert(cText)
	settingsGroup:insert(dText)
	settingsGroup:insert(eText)
	settingsGroup:insert(lunchText)
	settingsGroup:insert(fText)
	settingsGroup:insert(gText)
	settingsGroup:insert(communityText)
	settingsGroup:insert(aBandField)
	settingsGroup:insert(period2Border)
	settingsGroup:insert(bBandField)
	settingsGroup:insert(period3Border)
	settingsGroup:insert(cBandField)
	settingsGroup:insert(period4Border)
	settingsGroup:insert(breakField)
	settingsGroup:insert(period5Border)
	settingsGroup:insert(advisingField)
	settingsGroup:insert(period6Border)
	settingsGroup:insert(lunchField)
	settingsGroup:insert(period7Border)
	settingsGroup:insert(dBandField)
	settingsGroup:insert(eBandField)
	settingsGroup:insert(period8Border)
	settingsGroup:insert(fBandField)
	settingsGroup:insert(period9Border)
	settingsGroup:insert(gBandField)
	settingsGroup:insert(period10Border)
	settingsGroup:insert(communityField)
	settingsGroup:insert(period11Border)
	settingsGroup:insert(period12Border)
	
	
	
	function saveButton(event)--PERIOD 1 IS REMOVED BECAUSE YOU DID NOT INCLUDE PO IN THE SETTINGS PAGE

		--THE ISVISIBLE IS SET TO FALSE SO THAT ALL FUNCTIONALITY OF THE TEXT FIELDS DISAPPEAR
		aBandField.isVisible = false
		bBandField.isVisible = false
		cBandField.isVisible = false
		breakField.isVisible = false
		advisingField.isVisible = false
		lunchField.isVisible = false
		dBandField.isVisible = false
		eBandField.isVisible = false
		fBandField.isVisible = false
		gBandField.isVisible = false
		communityField.isVisible = false	
			--SAVES THE INPUT INTO A FILE
		local data = {
			["A Band"] = aBandFieldHolder,
			["B Band"] = bBandFieldHolder,
			["C Band"] = cBandFieldHolder,
			["Advising"] = advisingFieldHolder,
			["Break"] = breakFieldHolder,
			["Lunch"] = lunchFieldHolder,
			["D Band"] = bBandFieldHolder,
			["E Band"] = eBandFieldHolder,
			["F Band"] = fBandFieldHolder,
			["Community"] = communityFieldHolder,
			}
			local jsonBlob = json.encode (data)
		print (jsonBlob)
	
		-- set the path to the documents directory
		pathDest = system.pathForFile( "Day1Settings", system.DocumentsDirectory )
		-- open/create the file
		local myFile = io.open( pathDest, "w" )
		myFile:write(jsonBlob)
		myFile:flush()
		io.close(myFile)
		-- check that the file was created
		myFile = io.open( pathDest, "r" )
		if myFile then
			-- the file exists, read the data
			local contents = myFile:read( "*a" )
			io.close(myFile)
		end --ENDS FILE WRITING FUNCTION

		--THE IF-THEN STATEMENT MAKES SURE THAT IF THERE IS NO INPUT IN THE TEXT FIELD THAT IT DOESN'T UPDATE
		if (aBandField.text ~= "") then

			aBandText1.text = aBandField.text
			aBandText4.text = aBandField.text
			aBandText5.text = aBandField.text
			aBandText6.text = aBandField.text	
			aBandText7.text = aBandField.text
			print("1".. aBandText1.text)
	--[[		
	--		aBandText1.alpha = 0
	--		aBandText1 = display.newText(aBandField.text, aBandText1.x, aBandText1.y, nil, 16)
	--		aBandText1:setFillColor(0,0,0)
	--
	--		--aBandText2.alpha = 0
	--		--aBandText2 = display.newText(aBandField.text, aBandText2.x, aBandText2.y, nil, 16)
	--		--aBandText2:setFillColor(0,0,0)
	--		
	--		--aBandText3.alpha = 0
	--		--aBandText3 = display.newText(aBandField.text, aBandText3.x, aBandText3.y, nil, 16)
	--		--aBandText3:setFillColor(0,0,0)
	--		
	--		aBandText4.alpha = 0
	--		aBandText4 = display.newText(aBandField.text, aBandText4.x, aBandText4.y, nil, 16)
	--		aBandText4:setFillColor(0,0,0)
	--		
	--		aBandText5.alpha = 0
	--		aBandText5 = display.newText(aBandField.text, aBandText5.x, aBandText5.y, nil, 16)
	--		aBandText5:setFillColor(0,0,0)
	--		
	--		aBandText6.alpha = 0
	--		aBandText6 = display.newText(aBandField.text, aBandText6.x, aBandText6.y, nil, 16)
	--		aBandText6:setFillColor(0,0,0)
	--		
	--		aBandText7.alpha = 0
	--		aBandText7 = display.newText(aBandField.text, aBandText7.x, aBandText7.y, nil, 16)
	--		aBandText7:setFillColor(0,0,0)
	]]
		end

		if (bBandField.text ~= "") then
		
			bBandText1.text = bBandField.text
			bBandText2.text = bBandField.text
			bBandText3.text = bBandField.text
			bBandText5.text = bBandField.text
			bBandText7.text = bBandField.text
	--[[
	--		bBandText1.alpha = 0
	--		bBandText1 = display.newText(bBandField.text, bBandText1.x, bBandText1.y, nil, 16)
	--		bBandText1:setFillColor(0,0,0)
	--
	--		bBandText2.alpha = 0
	--		bBandText2 = display.newText(bBandField.text, bBandText2.x, bBandText2.y, nil, 16)
	--		bBandText2:setFillColor(0,0,0)
	--		
	--		bBandText3.alpha = 0
	--		bBandText3 = display.newText(bBandField.text, bBandText3.x, bBandText3.y, nil, 16)
	--		bBandText3:setFillColor(0,0,0)
	--		
	--		--bBandText4.alpha = 0
	--		--bBandText4 = display.newText(bBandField.text, bBandText4.x, bBandText4.y, nil, 16)
	--		--bBandText4:setFillColor(0,0,0)
	--		
	--		bBandText5.alpha = 0
	--		bBandText5 = display.newText(bBandField.text, bBandText5.x, bBandText5.y, nil, 16)
	--		bBandText5:setFillColor(0,0,0)
	--		
	--		--bBandText6.alpha = 0
	--		--bBandText6 = display.newText(bBandField.text, bBandText6.x, bBandText6.y, nil, 16)
	--		--bBandText6:setFillColor(0,0,0)
	--		
	--		bBandText7.alpha = 0
	--		bBandText7 = display.newText(bBandField.text, bBandText7.x, bBandText7.y, nil, 16)
	--		bBandText7:setFillColor(0,0,0)
	]]
		end

		if (cBandField.text ~= "") then
			
			cBandText1.text = cBandField.text
			cBandText2.text = cBandField.text
			cBandText3.text = cBandField.text
			cBandText4.text = cBandField.text
			cBandText6.text = cBandField.text

	--[[		
	--		cBandText1.alpha = 0
	--		cBandText1 = display.newText(cBandField.text, cBandText1.x, cBandText1.y, nil, 16)
	--		cBandText1:setFillColor(0,0,0)
	--
	--		cBandText2.alpha = 0
	--		cBandText2 = display.newText(cBandField.text, cBandText2.x, cBandText2.y, nil, 16)
	--		cBandText2:setFillColor(0,0,0)
	--		
	--		cBandText3.alpha = 0
	--		cBandText3 = display.newText(cBandField.text, cBandText3.x, cBandText3.y, nil, 16)
	--		cBandText3:setFillColor(0,0,0)
	--		
	--		cBandText4.alpha = 0
	--		cBandText4 = display.newText(cBandField.text, cBandText4.x, cBandText4.y, nil, 16)
	--		cBandText4:setFillColor(0,0,0)
	--		
	--		--cBandText5.alpha = 0
	--		--cBandText5 = display.newText(cBandField.text, cBandText5.x, cBandText5.y, nil, 16)
	--		--cBandText5:setFillColor(0,0,0)
	--		
	--		cBandText6.alpha = 0
	--		cBandText6 = display.newText(cBandField.text, cBandText6.x, cBandText6.y, nil, 16)
	--		cBandText6:setFillColor(0,0,0)
	--		
	--		--cBandText7.alpha = 0
	--		--cBandText7 = display.newText(cBandField.text, cBandText7.x, cBandText7.y, nil, 16)
	--		--cBandText7:setFillColor(0,0,0)
	]]
		end
	
		if(dBandField.text ~= "") then
	
			dBandText1.text = dBandField.text
			dBandText3.text = dBandField.text
			dBandText4.text = dBandField.text
			dBandText5.text = dBandField.text
			dBandText6.text = dBandField.text

	--[[
	--		dBandText1.alpha = 0
	--		dBandText1 = display.newText(dBandField.text, dBandText1.x, dBandText1.y, nil, 16)
	--		dBandText1:setFillColor(0,0,0)
	--
	--		--dBandText2.alpha = 0
	--		--dBandText2 = display.newText(dBandField.text, dBandText2.x, dBandText2.y, nil, 16)
	--		--dBandText2:setFillColor(0,0,0)
	--		
	--		dBandText3.alpha = 0
	--		dBandText3 = display.newText(dBandField.text, dBandText3.x, dBandText3.y, nil, 16)
	--		dBandText3:setFillColor(0,0,0)
	--
	--		dBandText4.alpha = 0
	--		dBandText4 = display.newText(dBandField.text, dBandText4.x, dBandText4.y, nil, 16)
	--		dBandText4:setFillColor(0,0,0)
	--
	--		dBandText5.alpha = 0
	--		dBandText5 = display.newText(dBandField.text, dBandText5.x, dBandText5.y, nil, 16)
	--		dBandText5:setFillColor(0,0,0)
	--
	--		dBandText6.alpha = 0
	--		dBandText6 = display.newText(dBandField.text, dBandText6.x, dBandText6.y, nil, 16)
	--		dBandText6:setFillColor(0,0,0)
	--
	--		--dBandText7.alpha = 0
	--		--dBandText7 = display.newText(dBandField.text, dBandText7.x, dBandText7.y, nil, 16)
	--		--dBandText7:setFillColor(0,0,0)
	]]
		end
	
		if(eBandField.text ~= "") then
	
			eBandText2.text = eBandField.text
			eBandText3.text = eBandField.text
			eBandText4.text = eBandField.text
			eBandText5.text = eBandField.text
			eBandText7.text = eBandField.text

	--[[
	--		--eBandText1.alpha = 0
	--		--eBandText1 = display.newText(eBandField.text, eBandText1.x, eBandText1.y, nil, 16)
	--		--eBandText1:setFillColor(0,0,0)
	--	
	--		eBandText2.alpha = 0
	--		eBandText2 = display.newText(eBandField.text, eBandText2.x, eBandText2.y, nil, 16)
	--		eBandText2:setFillColor(0,0,0)
	--
	--		eBandText3.alpha = 0
	--		eBandText3 = display.newText(eBandField.text, eBandText3.x, eBandText3.y, nil, 16)
	--		eBandText3:setFillColor(0,0,0)
	--
	--		eBandText4.alpha = 0
	--		eBandText4 = display.newText(eBandField.text, eBandText4.x, eBandText4.y, nil, 16)
	--		eBandText4:setFillColor(0,0,0)
	--
	--		eBandText5.alpha = 0
	--		eBandText5 = display.newText(eBandField.text, eBandText5.x, eBandText5.y, nil, 16)
	--		eBandText5:setFillColor(0,0,0)
	--
	--		--eBandText6.alpha = 0
	--		--eBandText6 = display.newText(eBandField.text, eBandText6.x, eBandText6.y, nil, 16)
	--		--eBandText6:setFillColor(0,0,0)
	--		
	--		eBandText7.alpha = 0
	--		eBandText7 = display.newText(eBandField.text, eBandText7.x, eBandText7.y, nil, 16)
	--		eBandText7:setFillColor(0,0,0)
	]]
		end
	
		if(fBandField.text ~= "") then
	
			fBandText2.text = fBandField.text
			fBandText3.text = fBandField.text
			fBandText5.text = fBandField.text
			fBandText6.text = fBandField.text
			fBandText7.text = fBandField.text
		
	--[[
	--		--fBandText1.alpha = 0
	--		--fBandText1 = display.newText(fBandField.text, fBandText2.x, fBandText2.y, nil, 16)
	--		--fBandText1:setFillColor(0,0,0)
	--		
	--		fBandText2.alpha = 0
	--		fBandText2 = display.newText(fBandField.text, fBandText2.x, fBandText2.y, nil, 16)
	--		fBandText2:setFillColor(0,0,0)
	--		
	--		fBandText3.alpha = 0
	--		fBandText3 = display.newText(fBandField.text, fBandText3.x, fBandText3.y, nil, 16)
	--		fBandText3:setFillColor(0,0,0)
	--		
	--		--fBandText4.alpha = 0
	--		--fBandText4 = display.newText(fBandField.text, fBandText4.x, fBandText4.y, nil, 16)
	--		--fBandText4:setFillColor(0,0,0)
	--		
	--		fBandText5.alpha = 0
	--		fBandText5 = display.newText(fBandField.text, fBandText5.x, fBandText5.y, nil, 16)
	--		fBandText5:setFillColor(0,0,0)
	--		
	--		fBandText6.alpha = 0
	--		fBandText6 = display.newText(fBandField.text, fBandText6.x, fBandText6.y, nil, 16)
	--		fBandText6:setFillColor(0,0,0)
	--		
	--		fBandText7.alpha = 0
	--		fBandText7 = display.newText(fBandField.text, fBandText7.x, fBandText7.y, nil, 16)
	--		fBandText7:setFillColor(0,0,0)
	]]
		end
	
		if(gBandField.text ~= "") then

			gBandText1.text = gBandField.text
			gBandText2.text = gBandField.text
			gBandText4.text = gBandField.text
			gBandText6.text = gBandField.text
			gBandText7.text = gBandField.text

	--[[
	--		gBandText1.alpha = 0
	--		gBandText1 = display.newText(gBandField.text, gBandText1.x, gBandText1.y, nil, 16)
	--		gBandText1:setFillColor(0,0,0)
	--	
	--		gBandText2.alpha = 0
	--		gBandText2 = display.newText(gBandField.text, gBandText2.x, gBandText2.y, nil, 16)
	--		gBandText2:setFillColor(0,0,0)
	--		
	--		--gBandText3.alpha = 0
	--		--gBandText3 = display.newText(gBandField.text, gBandText3.x, gBandText3.y, nil, 16)
	--		--gBandText3:setFillColor(0,0,0)
	--		
	--		gBandText4.alpha = 0
	--		gBandText4 = display.newText(gBandField.text, gBandText4.x, gBandText4.y, nil, 16)
	--		gBandText4:setFillColor(0,0,0)
	--		
	--		--gBandText5.alpha = 0
	--		--gBandText5 = display.newText(gBandField.text, gBandText5.x, gBandText5.y, nil, 16)
	--		--gBandText5:setFillColor(0,0,0)
	--		
	--		gBandText6.alpha = 0
	--		gBandText6 = display.newText(gBandField.text, gBandText6.x, gBandText6.y, nil, 16)
	--		gBandText6:setFillColor(0,0,0)
	--				
	--		gBandText7.alpha = 0
	--		gBandText7 = display.newText(gBandField.text, gBandText7.x, gBandText7.y, nil, 16)
	--		gBandText7:setFillColor(0,0,0)
	]]
		end

		if (breakField.text ~= "") then
			
			breakText1.text = breakField.text
			breakText2.text = breakField.text
			breakText3.text = breakField.text
			breakText4.text = breakField.text
			breakText5.text = breakField.text
			breakText6.text = breakField.text
			breakText7.text = breakField.text
		
	--[[
	--		breakText1.alpha = 0
	--		breakText1 = display.newText(breakField.text, breakText1.x, breakText1.y, nil, 16)
	--		breakText1:setFillColor(0,0,0)
	--		
	--		breakText2.alpha = 0
	--		breakText2 = display.newText(breakField.text, breakText2.x, breakText2.y, nil, 16)
	--		breakText2:setFillColor(0,0,0)
	--		
	--		breakText3.alpha = 0
	--		breakText3 = display.newText(breakField.text, breakText3.x, breakText3.y, nil, 16)
	--		breakText3:setFillColor(0,0,0)
	--		
	--		breakText4.alpha = 0
	--		breakText4 = display.newText(breakField.text, breakText4.x, breakText4.y, nil, 16)
	--		breakText4:setFillColor(0,0,0)
	--
	--		breakText5.alpha = 0
	--		breakText5 = display.newText(breakField.text, breakText5.x, breakText5.y, nil, 16)
	--		breakText5:setFillColor(0,0,0)
	--
	--		breakText6.alpha = 0
	--		breakText6 = display.newText(breakField.text, breakText6.x, breakText6.y, nil, 16)
	--		breakText6:setFillColor(0,0,0)
	--
	--		breakText7.alpha = 0
	--		breakText7 = display.newText(breakField.text, breakText7.x, breakText7.y, nil, 16)
	--		breakText7:setFillColor(0,0,0)
	]]
		end

		if (advisingField.text ~= "") then
			
			advisingText1.text = advisingField.text
			advisingText2.text = advisingField.text
			advisingText3.text = advisingField.text
			advisingText4.text = advisingField.text
			advisingText5.text = advisingField.text
			advisingText6.text = advisingField.text
			advisingText7.text = advisingField.text

	--[[
	--		advisingText1.alpha = 0
	--		advisingText1 = display.newText(advisingField.text, advisingText1.x, advisingText1.y, nil, 16)
	--		advisingText1:setFillColor(0,0,0)
	--		
	--		advisingText2.alpha = 0
	--		advisingText2 = display.newText(advisingField.text, advisingText2.x, advisingText2.y, nil, 16)
	--		advisingText2:setFillColor(0,0,0)
	--
	--		advisingText3.alpha = 0
	--		advisingText3 = display.newText(advisingField.text, advisingText3.x, advisingText3.y, nil, 16)
	--		advisingText3:setFillColor(0,0,0)
	--
	--		advisingText4.alpha = 0
	--		advisingText4 = display.newText(advisingField.text, advisingText4.x, advisingText4.y, nil, 16)
	--		advisingText4:setFillColor(0,0,0)
	--
	--		advisingText5.alpha = 0
	--		advisingText5 = display.newText(advisingField.text, advisingText5.x, advisingText5.y, nil, 16)
	--		advisingText5:setFillColor(0,0,0)
	--
	--		advisingText6.alpha = 0
	--		advisingText6 = display.newText(advisingField.text, advisingText6.x, advisingText6.y, nil, 16)
	--		advisingText6:setFillColor(0,0,0)
	--
	--		advisingText7.alpha = 0
	--		advisingText7 = display.newText(advisingField.text, advisingText7.x, advisingText7.y, nil, 16)
	--		advisingText7:setFillColor(0,0,0)
	]]
		end

		if(lunchField.text ~= "") then
	
			lunchText1.text = lunchField.text
			lunchText2.text = lunchField.text
			lunchText3.text = lunchField.text
			lunchText4.text = lunchField.text
			lunchText5.text = lunchField.text
			lunchText6.text = lunchField.text
			lunchText7.text = lunchField.text

	--[[
	--		lunchText1.alpha = 0
	--		lunchText1 = display.newText(lunchField.text, lunchText1.x, lunchText1.y, nil, 16)
	--		lunchText1:setFillColor(0,0,0)
	--		
	--		lunchText2.alpha = 0
	--		lunchText2 = display.newText(lunchField.text, lunchText2.x, lunchText2.y, nil, 16)
	--		lunchText2:setFillColor(0,0,0)
	--		
	--		lunchText3.alpha = 0
	--		lunchText3 = display.newText(lunchField.text, lunchText3.x, lunchText3.y, nil, 16)
	--		lunchText3:setFillColor(0,0,0)
	--		
	--		lunchText4.alpha = 0
	--		lunchText4 = display.newText(lunchField.text, lunchText4.x, lunchText4.y, nil, 16)
	--		lunchText4:setFillColor(0,0,0)
	--		
	--		lunchText5.alpha = 0
	--		lunchText5 = display.newText(lunchField.text, lunchText5.x, lunchText5.y, nil, 16)
	--		lunchText5:setFillColor(0,0,0)
	--		
	--		lunchText6.alpha = 0
	--		lunchText6 = display.newText(lunchField.text, lunchText6.x, lunchText6.y, nil, 16)
	--		lunchText6:setFillColor(0,0,0)
	--
	--		lunchText7.alpha = 0
	--		lunchText7 = display.newText(lunchField.text, lunchText7.x, lunchText7.y, nil, 16)
	--		lunchText7:setFillColor(0,0,0)
	]]
		end
	
		if(communityField.text ~= "") then
			
			communityText1.text = communityField.text
			communityText2.text = communityField.text
			communityText3.text = communityField.text
			communityText4.text = communityField.text
			communityText5.text = communityField.text
			communityText6.text = communityField.text
			communityText7.text = communityField.text
		
	--[[
	--		communityText1.alpha = 0
	--		communityText1 = display.newText(communityField.text, communityText1.x, communityText1.y, nil, 16)
	--		communityText1:setFillColor(0,0,0)
	--		
	--		communityText2.alpha = 0
	--		communityText2 = display.newText(communityField.text, communityText2.x, communityText2.y, nil, 16)
	--		communityText2:setFillColor(0,0,0)
	--
	--		communityText3.alpha = 0
	--		communityText3 = display.newText(communityField.text, communityText3.x, communityText3.y, nil, 16)
	--		communityText3:setFillColor(0,0,0)
	--		
	--		communityText4.alpha = 0
	--		communityText4 = display.newText(communityField.text, communityText4.x, communityText4.y, nil, 16)
	--		communityText4:setFillColor(0,0,0)
	--		
	--		communityText5.alpha = 0
	--		communityText5 = display.newText(communityField.text, communityText5.x, communityText5.y, nil, 16)
	--		communityText5:setFillColor(0,0,0)
	--		
	--		communityText6.alpha = 0
	--		communityText6 = display.newText(communityField.text, communityText6.x, communityText6.y, nil, 16)
	--		communityText6:setFillColor(0,0,0)
	--
	--		communityText7.alpha = 0
	--		communityText7 = display.newText(communityField.text, communityText7.x, communityText7.y, nil, 16)
	--		communityText7:setFillColor(0,0,0)
	]]
		end

	--[[
	--INSERT INTO THE DAY 1 GROUP
	--	dayGroup1:insert(aBandText1)
	--	dayGroup1:insert(bBandText1)
	--	dayGroup1:insert(cBandText1)
	--	dayGroup1:insert(breakText1)
	--	dayGroup1:insert(advisingText1)
	--	dayGroup1:insert(lunchText1)
	--	dayGroup1:insert(dBandText1)
	--	dayGroup1:insert(gBandText1)
	--	dayGroup1:insert(communityText1)
	--
	--INSERT INTO THE DAY 2 GROUP
	--	dayGroup2:insert(bBandText2)
	--	dayGroup2:insert(eBandText2)
	--	dayGroup2:insert(advisingText2)
	--	dayGroup2:insert(breakText2)
	--	dayGroup2:insert(fBandText2)
	--	dayGroup2:insert(gBandText2)
	--	dayGroup2:insert(lunchText2)
	--	dayGroup2:insert(communityText2)
	--	dayGroup2:insert(cBandText2)
	--	
	--INSERT INTO THE DAY 3 GROUP
	--	dayGroup3:insert(cBandText3)
	--	dayGroup3:insert(fBandText3)
	--	dayGroup3:insert(bBandText3)
	--	dayGroup3:insert(eBandText3)
	--	dayGroup3:insert(dBandText3)
	--	dayGroup3:insert(breakText3)
	--	dayGroup3:insert(advisingText3)
	--	dayGroup3:insert(lunchText3)
	--	dayGroup3:insert(communityText3)
	--	
	--INSERT INTO THE DAY 4 GROUP
	--	dayGroup4:insert(dBandText4)
	--	dayGroup4:insert(aBandText4)
	--	dayGroup4:insert(cBandText4)
	--	dayGroup4:insert(gBandText4)
	--	dayGroup4:insert(eBandText4)
	--	dayGroup4:insert(breakText4)
	--	dayGroup4:insert(advisingText4)
	--	dayGroup4:insert(lunchText4)
	--	dayGroup4:insert(communityText4)
	--	
	--INSERT INTO THE DAY 5 GROUP
	--	dayGroup5:insert(eBandText5)
	--	dayGroup5:insert(bBandText5)
	--	dayGroup5:insert(aBandText5)
	--	dayGroup5:insert(dBandText5)
	--	dayGroup5:insert(fBandText5)
	--	dayGroup5:insert(breakText5)
	--	dayGroup5:insert(advisingText5)
	--	dayGroup5:insert(lunchText5)
	--	dayGroup5:insert(communityText5)
	--	
	--INSERT INTO THE DAY 6 GROUP
	--	dayGroup6:insert(fBandText6)
	--	dayGroup6:insert(cBandText6)
	--	dayGroup6:insert(aBandText6)
	--	dayGroup6:insert(dBandText6)
	--	dayGroup6:insert(gBandText6)
	--	dayGroup6:insert(breakText6)
	--	dayGroup6:insert(advisingText6)
	--	dayGroup6:insert(lunchText6)
	--	dayGroup6:insert(communityText6)
	--	
	--INSERT INTO THE DAY 7 GROUP
	--	dayGroup7:insert(gBandText7)
	--	dayGroup7:insert(fBandText7)
	--	dayGroup7:insert(bBandText7)
	--	dayGroup7:insert(eBandText7)
	--	dayGroup7:insert(aBandText7)
	--	dayGroup7:insert(breakText7)
	--	dayGroup7:insert(advisingText7)
	--	dayGroup7:insert(lunchText7)
	--	dayGroup7:insert(communityText7)
	--	
	--CREATE HOLDER VARIABLES SO THAT YOU CAN RESET EACH FIELD BUT STILL SAVE THE TEXT THAT IS IN SAVED FILE
	--	aBandFieldHolder = aBandField.text
	--	bBandFieldHolder = bBandField.text
	--	cBandFieldHolder = cBandField.text
	--	breakFieldHolder = breakField.text
	--	advisingFieldHolder = advisingField.text
	--	lunchFieldHolder = lunchField.text
	--	dBandFieldHolder = dBandField.text
	--	eBandFieldHolder = eBandField.text
	--	fBandFieldHolder = fBandField.text
	--	gBandFieldHolder = gBandField.text
	--	communityFieldHolder = communityField.text
	]]
		composer.gotoScene("HomeScreen", {effect = "fade", time = 300})
	
	--[[THIS IS TO MAKE SURE THAT THE PREVIOUSLY WRITTEN TEXT DOESN'T REMAIN IN THE TEXT FIELDS
	--	period2Field.text = ""
	--	period3Field.text = ""
	--	period4Field.text = ""
	--	period5Field.text = ""
	--	period6Field.text = ""
	--	period7Field.text = ""
	--	period8Field.text = ""
	--	period9Field.text = ""
	--	period10Field.text = ""
	]]
	end --ENDS SAVE BUTTON FUNCTION

	function backButton(event)

		if (aBandField.text ~= "") then
				print("2".. aBandText1.text)

		aBandField.text = ""
		end

		if (bBandField.text ~= "") then
		bBandField.text = ""
		end

		if (cBandField.text ~= "") then
		cBandField.text = ""
		end

		if (breakField.text ~= "") then
		breakField.text = ""
		end

		if (advisingField.text ~= "") then
		advisingField.text = ""
		end

		if(lunchField.text ~= "") then
		lunchField.text = ""
		end

		if(dBandField.text ~= "") then
		dBandField.text = ""
		end
	
		if(eBandField.text ~= "") then
		eBandField.text = ""
		end

		if(fBandField.text ~= "") then
		fBandField.text = ""
		end

		if(gBandField.text ~= "") then
		gBandField.text = ""
		end
	
		if(communityField.text ~= "") then
		communityField.text = ""
		end
	
		aBandField.isVisible = false
		bBandField.isVisible = false
		cBandField.isVisible = false
		breakField.isVisible = false
		advisingField.isVisible = false
		lunchField.isVisible = false
		dBandField.isVisible = false
		eBandField.isVisible = false
		fBandField.isVisible = false
		gBandField.isVisible = false
		communityField.isVisible = false
	
		native.setKeyboardFocus(nil)
		composer.gotoScene("HomeScreen", {effect = "fade", time = 200})
	end

	local function reset(event)
		userInfo.aBand = ""
	end

end --ENDS THE CREATE SCENE FUNCTION

--[[
--function saveButton(event)--PERIOD 1 IS REMOVED BECAUSE YOU DID NOT INCLUDE PO IN THE SETTINGS PAGE
--
--	--THE ISVISIBLE IS SET TO FALSE SO THAT ALL FUNCTIONALITY OF THE TEXT FIELDS DISAPPEAR
--	aBandField.isVisible = false
--	bBandField.isVisible = false
--	cBandField.isVisible = false
--	breakField.isVisible = false
--	advisingField.isVisible = false
--	lunchField.isVisible = false
--	dBandField.isVisible = false
--	eBandField.isVisible = false
--	fBandField.isVisible = false
--	gBandField.isVisible = false
--	communityField.isVisible = false	
--		--SAVES THE INPUT INTO A FILE
--	local data = {
--		["A Band"] = aBandFieldHolder,
--		["B Band"] = bBandFieldHolder,
--		["C Band"] = cBandFieldHolder,
--		["Advising"] = advisingFieldHolder,
--		["Break"] = breakFieldHolder,
--		["Lunch"] = lunchFieldHolder,
--		["D Band"] = bBandFieldHolder,
--		["E Band"] = eBandFieldHolder,
--		["F Band"] = fBandFieldHolder,
--		["Community"] = communityFieldHolder,
--		}
--		local jsonBlob = json.encode (data)
--	print (jsonBlob)
--	
--	-- set the path to the documents directory
--	pathDest = system.pathForFile( "Day1Settings", system.DocumentsDirectory )
--	-- open/create the file
--	local myFile = io.open( pathDest, "w" )
--	myFile:write(jsonBlob)
--	myFile:flush()
--	io.close(myFile)
--	-- check that the file was created
--	myFile = io.open( pathDest, "r" )
--	if myFile then
--		-- the file exists, read the data
--		local contents = myFile:read( "*a" )
--		io.close(myFile)
--	end --ENDS FILE WRITING FUNCTION
--
--	--THE IF-THEN STATEMENT MAKES SURE THAT IF THERE IS NO INPUT IN THE TEXT FIELD THAT IT DOESN'T UPDATE
--	if (aBandField.text ~= "") then
--
--		aBandText1.text = aBandField.text
--		aBandText4.text = aBandField.text
--		aBandText5.text = aBandField.text
--		aBandText6.text = aBandField.text	
--		aBandText7.text = aBandField.text
--		print("1".. aBandText1.text)
--		
----		aBandText1.alpha = 0
----		aBandText1 = display.newText(aBandField.text, aBandText1.x, aBandText1.y, nil, 16)
----		aBandText1:setFillColor(0,0,0)
----
----		--aBandText2.alpha = 0
----		--aBandText2 = display.newText(aBandField.text, aBandText2.x, aBandText2.y, nil, 16)
----		--aBandText2:setFillColor(0,0,0)
----		
----		--aBandText3.alpha = 0
----		--aBandText3 = display.newText(aBandField.text, aBandText3.x, aBandText3.y, nil, 16)
----		--aBandText3:setFillColor(0,0,0)
----		
----		aBandText4.alpha = 0
----		aBandText4 = display.newText(aBandField.text, aBandText4.x, aBandText4.y, nil, 16)
----		aBandText4:setFillColor(0,0,0)
----		
----		aBandText5.alpha = 0
----		aBandText5 = display.newText(aBandField.text, aBandText5.x, aBandText5.y, nil, 16)
----		aBandText5:setFillColor(0,0,0)
----		
----		aBandText6.alpha = 0
----		aBandText6 = display.newText(aBandField.text, aBandText6.x, aBandText6.y, nil, 16)
----		aBandText6:setFillColor(0,0,0)
----		
----		aBandText7.alpha = 0
----		aBandText7 = display.newText(aBandField.text, aBandText7.x, aBandText7.y, nil, 16)
----		aBandText7:setFillColor(0,0,0)
--	end
--
--	if (bBandField.text ~= "") then
--		
--		bBandText1.text = bBandField.text
--		bBandText2.text = bBandField.text
--		bBandText3.text = bBandField.text
--		bBandText5.text = bBandField.text
--		bBandText7.text = bBandField.text
--
----		bBandText1.alpha = 0
----		bBandText1 = display.newText(bBandField.text, bBandText1.x, bBandText1.y, nil, 16)
----		bBandText1:setFillColor(0,0,0)
----
----		bBandText2.alpha = 0
----		bBandText2 = display.newText(bBandField.text, bBandText2.x, bBandText2.y, nil, 16)
----		bBandText2:setFillColor(0,0,0)
----		
----		bBandText3.alpha = 0
----		bBandText3 = display.newText(bBandField.text, bBandText3.x, bBandText3.y, nil, 16)
----		bBandText3:setFillColor(0,0,0)
----		
----		--bBandText4.alpha = 0
----		--bBandText4 = display.newText(bBandField.text, bBandText4.x, bBandText4.y, nil, 16)
----		--bBandText4:setFillColor(0,0,0)
----		
----		bBandText5.alpha = 0
----		bBandText5 = display.newText(bBandField.text, bBandText5.x, bBandText5.y, nil, 16)
----		bBandText5:setFillColor(0,0,0)
----		
----		--bBandText6.alpha = 0
----		--bBandText6 = display.newText(bBandField.text, bBandText6.x, bBandText6.y, nil, 16)
----		--bBandText6:setFillColor(0,0,0)
----		
----		bBandText7.alpha = 0
----		bBandText7 = display.newText(bBandField.text, bBandText7.x, bBandText7.y, nil, 16)
----		bBandText7:setFillColor(0,0,0)
--	end
--
--	if (cBandField.text ~= "") then
--			
--		cBandText1.text = cBandField.text
--		cBandText2.text = cBandField.text
--		cBandText3.text = cBandField.text
--		cBandText4.text = cBandField.text
--		cBandText6.text = cBandField.text
--		
----		cBandText1.alpha = 0
----		cBandText1 = display.newText(cBandField.text, cBandText1.x, cBandText1.y, nil, 16)
----		cBandText1:setFillColor(0,0,0)
----
----		cBandText2.alpha = 0
----		cBandText2 = display.newText(cBandField.text, cBandText2.x, cBandText2.y, nil, 16)
----		cBandText2:setFillColor(0,0,0)
----		
----		cBandText3.alpha = 0
----		cBandText3 = display.newText(cBandField.text, cBandText3.x, cBandText3.y, nil, 16)
----		cBandText3:setFillColor(0,0,0)
----		
----		cBandText4.alpha = 0
----		cBandText4 = display.newText(cBandField.text, cBandText4.x, cBandText4.y, nil, 16)
----		cBandText4:setFillColor(0,0,0)
----		
----		--cBandText5.alpha = 0
----		--cBandText5 = display.newText(cBandField.text, cBandText5.x, cBandText5.y, nil, 16)
----		--cBandText5:setFillColor(0,0,0)
----		
----		cBandText6.alpha = 0
----		cBandText6 = display.newText(cBandField.text, cBandText6.x, cBandText6.y, nil, 16)
----		cBandText6:setFillColor(0,0,0)
----		
----		--cBandText7.alpha = 0
----		--cBandText7 = display.newText(cBandField.text, cBandText7.x, cBandText7.y, nil, 16)
----		--cBandText7:setFillColor(0,0,0)
--	end
--	
--	if(dBandField.text ~= "") then
--	
--		dBandText1.text = dBandField.text
--		dBandText3.text = dBandField.text
--		dBandText4.text = dBandField.text
--		dBandText5.text = dBandField.text
--		dBandText6.text = dBandField.text
--	
----		dBandText1.alpha = 0
----		dBandText1 = display.newText(dBandField.text, dBandText1.x, dBandText1.y, nil, 16)
----		dBandText1:setFillColor(0,0,0)
----
----		--dBandText2.alpha = 0
----		--dBandText2 = display.newText(dBandField.text, dBandText2.x, dBandText2.y, nil, 16)
----		--dBandText2:setFillColor(0,0,0)
----		
----		dBandText3.alpha = 0
----		dBandText3 = display.newText(dBandField.text, dBandText3.x, dBandText3.y, nil, 16)
----		dBandText3:setFillColor(0,0,0)
----
----		dBandText4.alpha = 0
----		dBandText4 = display.newText(dBandField.text, dBandText4.x, dBandText4.y, nil, 16)
----		dBandText4:setFillColor(0,0,0)
----
----		dBandText5.alpha = 0
----		dBandText5 = display.newText(dBandField.text, dBandText5.x, dBandText5.y, nil, 16)
----		dBandText5:setFillColor(0,0,0)
----
----		dBandText6.alpha = 0
----		dBandText6 = display.newText(dBandField.text, dBandText6.x, dBandText6.y, nil, 16)
----		dBandText6:setFillColor(0,0,0)
----
----		--dBandText7.alpha = 0
----		--dBandText7 = display.newText(dBandField.text, dBandText7.x, dBandText7.y, nil, 16)
----		--dBandText7:setFillColor(0,0,0)
--	end
--	
--	if(eBandField.text ~= "") then
--	
--		eBandText2.text = eBandField.text
--		eBandText3.text = eBandField.text
--		eBandText4.text = eBandField.text
--		eBandText5.text = eBandField.text
--		eBandText7.text = eBandField.text
--		
----		--eBandText1.alpha = 0
----		--eBandText1 = display.newText(eBandField.text, eBandText1.x, eBandText1.y, nil, 16)
----		--eBandText1:setFillColor(0,0,0)
----	
----		eBandText2.alpha = 0
----		eBandText2 = display.newText(eBandField.text, eBandText2.x, eBandText2.y, nil, 16)
----		eBandText2:setFillColor(0,0,0)
----
----		eBandText3.alpha = 0
----		eBandText3 = display.newText(eBandField.text, eBandText3.x, eBandText3.y, nil, 16)
----		eBandText3:setFillColor(0,0,0)
----
----		eBandText4.alpha = 0
----		eBandText4 = display.newText(eBandField.text, eBandText4.x, eBandText4.y, nil, 16)
----		eBandText4:setFillColor(0,0,0)
----
----		eBandText5.alpha = 0
----		eBandText5 = display.newText(eBandField.text, eBandText5.x, eBandText5.y, nil, 16)
----		eBandText5:setFillColor(0,0,0)
----
----		--eBandText6.alpha = 0
----		--eBandText6 = display.newText(eBandField.text, eBandText6.x, eBandText6.y, nil, 16)
----		--eBandText6:setFillColor(0,0,0)
----		
----		eBandText7.alpha = 0
----		eBandText7 = display.newText(eBandField.text, eBandText7.x, eBandText7.y, nil, 16)
----		eBandText7:setFillColor(0,0,0)
--	end
--	
--	if(fBandField.text ~= "") then
--	
--		fBandText2.text = fBandField.text
--		fBandText3.text = fBandField.text
--		fBandText5.text = fBandField.text
--		fBandText6.text = fBandField.text
--		fBandText7.text = fBandField.text
--	
----		--fBandText1.alpha = 0
----		--fBandText1 = display.newText(fBandField.text, fBandText2.x, fBandText2.y, nil, 16)
----		--fBandText1:setFillColor(0,0,0)
----		
----		fBandText2.alpha = 0
----		fBandText2 = display.newText(fBandField.text, fBandText2.x, fBandText2.y, nil, 16)
----		fBandText2:setFillColor(0,0,0)
----		
----		fBandText3.alpha = 0
----		fBandText3 = display.newText(fBandField.text, fBandText3.x, fBandText3.y, nil, 16)
----		fBandText3:setFillColor(0,0,0)
----		
----		--fBandText4.alpha = 0
----		--fBandText4 = display.newText(fBandField.text, fBandText4.x, fBandText4.y, nil, 16)
----		--fBandText4:setFillColor(0,0,0)
----		
----		fBandText5.alpha = 0
----		fBandText5 = display.newText(fBandField.text, fBandText5.x, fBandText5.y, nil, 16)
----		fBandText5:setFillColor(0,0,0)
----		
----		fBandText6.alpha = 0
----		fBandText6 = display.newText(fBandField.text, fBandText6.x, fBandText6.y, nil, 16)
----		fBandText6:setFillColor(0,0,0)
----		
----		fBandText7.alpha = 0
----		fBandText7 = display.newText(fBandField.text, fBandText7.x, fBandText7.y, nil, 16)
----		fBandText7:setFillColor(0,0,0)
--	end
--	
--	if(gBandField.text ~= "") then
--
--		gBandText1.text = gBandField.text
--		gBandText2.text = gBandField.text
--		gBandText4.text = gBandField.text
--		gBandText6.text = gBandField.text
--		gBandText7.text = gBandField.text
--
----		gBandText1.alpha = 0
----		gBandText1 = display.newText(gBandField.text, gBandText1.x, gBandText1.y, nil, 16)
----		gBandText1:setFillColor(0,0,0)
----	
----		gBandText2.alpha = 0
----		gBandText2 = display.newText(gBandField.text, gBandText2.x, gBandText2.y, nil, 16)
----		gBandText2:setFillColor(0,0,0)
----		
----		--gBandText3.alpha = 0
----		--gBandText3 = display.newText(gBandField.text, gBandText3.x, gBandText3.y, nil, 16)
----		--gBandText3:setFillColor(0,0,0)
----		
----		gBandText4.alpha = 0
----		gBandText4 = display.newText(gBandField.text, gBandText4.x, gBandText4.y, nil, 16)
----		gBandText4:setFillColor(0,0,0)
----		
----		--gBandText5.alpha = 0
----		--gBandText5 = display.newText(gBandField.text, gBandText5.x, gBandText5.y, nil, 16)
----		--gBandText5:setFillColor(0,0,0)
----		
----		gBandText6.alpha = 0
----		gBandText6 = display.newText(gBandField.text, gBandText6.x, gBandText6.y, nil, 16)
----		gBandText6:setFillColor(0,0,0)
----				
----		gBandText7.alpha = 0
----		gBandText7 = display.newText(gBandField.text, gBandText7.x, gBandText7.y, nil, 16)
----		gBandText7:setFillColor(0,0,0)
--	end
--
--	if (breakField.text ~= "") then
--			
--		breakText1.text = breakField.text
--		breakText2.text = breakField.text
--		breakText3.text = breakField.text
--		breakText4.text = breakField.text
--		breakText5.text = breakField.text
--		breakText6.text = breakField.text
--		breakText7.text = breakField.text
--		
----		breakText1.alpha = 0
----		breakText1 = display.newText(breakField.text, breakText1.x, breakText1.y, nil, 16)
----		breakText1:setFillColor(0,0,0)
----		
----		breakText2.alpha = 0
----		breakText2 = display.newText(breakField.text, breakText2.x, breakText2.y, nil, 16)
----		breakText2:setFillColor(0,0,0)
----		
----		breakText3.alpha = 0
----		breakText3 = display.newText(breakField.text, breakText3.x, breakText3.y, nil, 16)
----		breakText3:setFillColor(0,0,0)
----		
----		breakText4.alpha = 0
----		breakText4 = display.newText(breakField.text, breakText4.x, breakText4.y, nil, 16)
----		breakText4:setFillColor(0,0,0)
----
----		breakText5.alpha = 0
----		breakText5 = display.newText(breakField.text, breakText5.x, breakText5.y, nil, 16)
----		breakText5:setFillColor(0,0,0)
----
----		breakText6.alpha = 0
----		breakText6 = display.newText(breakField.text, breakText6.x, breakText6.y, nil, 16)
----		breakText6:setFillColor(0,0,0)
----
----		breakText7.alpha = 0
----		breakText7 = display.newText(breakField.text, breakText7.x, breakText7.y, nil, 16)
----		breakText7:setFillColor(0,0,0)
--	end
--
--	if (advisingField.text ~= "") then
--			
--		advisingText1.text = advisingField.text
--		advisingText2.text = advisingField.text
--		advisingText3.text = advisingField.text
--		advisingText4.text = advisingField.text
--		advisingText5.text = advisingField.text
--		advisingText6.text = advisingField.text
--		advisingText7.text = advisingField.text
--		
----		advisingText1.alpha = 0
----		advisingText1 = display.newText(advisingField.text, advisingText1.x, advisingText1.y, nil, 16)
----		advisingText1:setFillColor(0,0,0)
----		
----		advisingText2.alpha = 0
----		advisingText2 = display.newText(advisingField.text, advisingText2.x, advisingText2.y, nil, 16)
----		advisingText2:setFillColor(0,0,0)
----
----		advisingText3.alpha = 0
----		advisingText3 = display.newText(advisingField.text, advisingText3.x, advisingText3.y, nil, 16)
----		advisingText3:setFillColor(0,0,0)
----
----		advisingText4.alpha = 0
----		advisingText4 = display.newText(advisingField.text, advisingText4.x, advisingText4.y, nil, 16)
----		advisingText4:setFillColor(0,0,0)
----
----		advisingText5.alpha = 0
----		advisingText5 = display.newText(advisingField.text, advisingText5.x, advisingText5.y, nil, 16)
----		advisingText5:setFillColor(0,0,0)
----
----		advisingText6.alpha = 0
----		advisingText6 = display.newText(advisingField.text, advisingText6.x, advisingText6.y, nil, 16)
----		advisingText6:setFillColor(0,0,0)
----
----		advisingText7.alpha = 0
----		advisingText7 = display.newText(advisingField.text, advisingText7.x, advisingText7.y, nil, 16)
----		advisingText7:setFillColor(0,0,0)
--	end
--
--	if(lunchField.text ~= "") then
--	
--		lunchText1.text = lunchField.text
--		lunchText2.text = lunchField.text
--		lunchText3.text = lunchField.text
--		lunchText4.text = lunchField.text
--		lunchText5.text = lunchField.text
--		lunchText6.text = lunchField.text
--		lunchText7.text = lunchField.text
--		
----		lunchText1.alpha = 0
----		lunchText1 = display.newText(lunchField.text, lunchText1.x, lunchText1.y, nil, 16)
----		lunchText1:setFillColor(0,0,0)
----		
----		lunchText2.alpha = 0
----		lunchText2 = display.newText(lunchField.text, lunchText2.x, lunchText2.y, nil, 16)
----		lunchText2:setFillColor(0,0,0)
----		
----		lunchText3.alpha = 0
----		lunchText3 = display.newText(lunchField.text, lunchText3.x, lunchText3.y, nil, 16)
----		lunchText3:setFillColor(0,0,0)
----		
----		lunchText4.alpha = 0
----		lunchText4 = display.newText(lunchField.text, lunchText4.x, lunchText4.y, nil, 16)
----		lunchText4:setFillColor(0,0,0)
----		
----		lunchText5.alpha = 0
----		lunchText5 = display.newText(lunchField.text, lunchText5.x, lunchText5.y, nil, 16)
----		lunchText5:setFillColor(0,0,0)
----		
----		lunchText6.alpha = 0
----		lunchText6 = display.newText(lunchField.text, lunchText6.x, lunchText6.y, nil, 16)
----		lunchText6:setFillColor(0,0,0)
----
----		lunchText7.alpha = 0
----		lunchText7 = display.newText(lunchField.text, lunchText7.x, lunchText7.y, nil, 16)
----		lunchText7:setFillColor(0,0,0)
--	end
--	
--	if(communityField.text ~= "") then
--			
--		communityText1.text = communityField.text
--		communityText2.text = communityField.text
--		communityText3.text = communityField.text
--		communityText4.text = communityField.text
--		communityText5.text = communityField.text
--		communityText6.text = communityField.text
--		communityText7.text = communityField.text
--		
----		communityText1.alpha = 0
----		communityText1 = display.newText(communityField.text, communityText1.x, communityText1.y, nil, 16)
----		communityText1:setFillColor(0,0,0)
----		
----		communityText2.alpha = 0
----		communityText2 = display.newText(communityField.text, communityText2.x, communityText2.y, nil, 16)
----		communityText2:setFillColor(0,0,0)
----
----		communityText3.alpha = 0
----		communityText3 = display.newText(communityField.text, communityText3.x, communityText3.y, nil, 16)
----		communityText3:setFillColor(0,0,0)
----		
----		communityText4.alpha = 0
----		communityText4 = display.newText(communityField.text, communityText4.x, communityText4.y, nil, 16)
----		communityText4:setFillColor(0,0,0)
----		
----		communityText5.alpha = 0
----		communityText5 = display.newText(communityField.text, communityText5.x, communityText5.y, nil, 16)
----		communityText5:setFillColor(0,0,0)
----		
----		communityText6.alpha = 0
----		communityText6 = display.newText(communityField.text, communityText6.x, communityText6.y, nil, 16)
----		communityText6:setFillColor(0,0,0)
----
----		communityText7.alpha = 0
----		communityText7 = display.newText(communityField.text, communityText7.x, communityText7.y, nil, 16)
----		communityText7:setFillColor(0,0,0)
--	end
--	
----INSERT INTO THE DAY 1 GROUP
----	dayGroup1:insert(aBandText1)
----	dayGroup1:insert(bBandText1)
----	dayGroup1:insert(cBandText1)
----	dayGroup1:insert(breakText1)
----	dayGroup1:insert(advisingText1)
----	dayGroup1:insert(lunchText1)
----	dayGroup1:insert(dBandText1)
----	dayGroup1:insert(gBandText1)
----	dayGroup1:insert(communityText1)
----
----INSERT INTO THE DAY 2 GROUP
----	dayGroup2:insert(bBandText2)
----	dayGroup2:insert(eBandText2)
----	dayGroup2:insert(advisingText2)
----	dayGroup2:insert(breakText2)
----	dayGroup2:insert(fBandText2)
----	dayGroup2:insert(gBandText2)
----	dayGroup2:insert(lunchText2)
----	dayGroup2:insert(communityText2)
----	dayGroup2:insert(cBandText2)
----	
----INSERT INTO THE DAY 3 GROUP
----	dayGroup3:insert(cBandText3)
----	dayGroup3:insert(fBandText3)
----	dayGroup3:insert(bBandText3)
----	dayGroup3:insert(eBandText3)
----	dayGroup3:insert(dBandText3)
----	dayGroup3:insert(breakText3)
----	dayGroup3:insert(advisingText3)
----	dayGroup3:insert(lunchText3)
----	dayGroup3:insert(communityText3)
----	
----INSERT INTO THE DAY 4 GROUP
----	dayGroup4:insert(dBandText4)
----	dayGroup4:insert(aBandText4)
----	dayGroup4:insert(cBandText4)
----	dayGroup4:insert(gBandText4)
----	dayGroup4:insert(eBandText4)
----	dayGroup4:insert(breakText4)
----	dayGroup4:insert(advisingText4)
----	dayGroup4:insert(lunchText4)
----	dayGroup4:insert(communityText4)
----	
----INSERT INTO THE DAY 5 GROUP
----	dayGroup5:insert(eBandText5)
----	dayGroup5:insert(bBandText5)
----	dayGroup5:insert(aBandText5)
----	dayGroup5:insert(dBandText5)
----	dayGroup5:insert(fBandText5)
----	dayGroup5:insert(breakText5)
----	dayGroup5:insert(advisingText5)
----	dayGroup5:insert(lunchText5)
----	dayGroup5:insert(communityText5)
----	
----INSERT INTO THE DAY 6 GROUP
----	dayGroup6:insert(fBandText6)
----	dayGroup6:insert(cBandText6)
----	dayGroup6:insert(aBandText6)
----	dayGroup6:insert(dBandText6)
----	dayGroup6:insert(gBandText6)
----	dayGroup6:insert(breakText6)
----	dayGroup6:insert(advisingText6)
----	dayGroup6:insert(lunchText6)
----	dayGroup6:insert(communityText6)
----	
----INSERT INTO THE DAY 7 GROUP
----	dayGroup7:insert(gBandText7)
----	dayGroup7:insert(fBandText7)
----	dayGroup7:insert(bBandText7)
----	dayGroup7:insert(eBandText7)
----	dayGroup7:insert(aBandText7)
----	dayGroup7:insert(breakText7)
----	dayGroup7:insert(advisingText7)
----	dayGroup7:insert(lunchText7)
----	dayGroup7:insert(communityText7)
----	
----CREATE HOLDER VARIABLES SO THAT YOU CAN RESET EACH FIELD BUT STILL SAVE THE TEXT THAT IS IN SAVED FILE
----	aBandFieldHolder = aBandField.text
----	bBandFieldHolder = bBandField.text
----	cBandFieldHolder = cBandField.text
----	breakFieldHolder = breakField.text
----	advisingFieldHolder = advisingField.text
----	lunchFieldHolder = lunchField.text
----	dBandFieldHolder = dBandField.text
----	eBandFieldHolder = eBandField.text
----	fBandFieldHolder = fBandField.text
----	gBandFieldHolder = gBandField.text
----	communityFieldHolder = communityField.text
--	
--	composer.gotoScene("HomeScreen", {effect = "fade", time = 300})
--	
----THIS IS TO MAKE SURE THAT THE PREVIOUSLY WRITTEN TEXT DOESN'T REMAIN IN THE TEXT FIELDS
----	period2Field.text = ""
----	period3Field.text = ""
----	period4Field.text = ""
----	period5Field.text = ""
----	period6Field.text = ""
----	period7Field.text = ""
----	period8Field.text = ""
----	period9Field.text = ""
----	period10Field.text = ""

--end --ENDS SAVE BUTTON FUNCTION
--
--function backButton(event)
--
--	if (aBandField.text ~= "") then
--			print("2".. aBandText1.text)
--
--	aBandField.text = ""
--	end
--
--	if (bBandField.text ~= "") then
--	bBandField.text = ""
--	end
--
--	if (cBandField.text ~= "") then
--	cBandField.text = ""
--	end
--
--	if (breakField.text ~= "") then
--	breakField.text = ""
--	end
--
--	if (advisingField.text ~= "") then
--	advisingField.text = ""
--	end
--
--	if(lunchField.text ~= "") then
--	lunchField.text = ""
--	end
--
--	if(dBandField.text ~= "") then
--	dBandField.text = ""
--	end
--	
--	if(eBandField.text ~= "") then
--	eBandField.text = ""
--	end
--
--	if(fBandField.text ~= "") then
--	fBandField.text = ""
--	end
--
--	if(gBandField.text ~= "") then
--	gBandField.text = ""
--	end
--	
--	if(communityField.text ~= "") then
--	communityField.text = ""
--	end
--	
--	aBandField.isVisible = false
--	bBandField.isVisible = false
--	cBandField.isVisible = false
--	breakField.isVisible = false
--	advisingField.isVisible = false
--	lunchField.isVisible = false
--	dBandField.isVisible = false
--	eBandField.isVisible = false
--	fBandField.isVisible = false
--	gBandField.isVisible = false
--	communityField.isVisible = false
--	
--	native.setKeyboardFocus(nil)
--	composer.gotoScene("HomeScreen", {effect = "fade", time = 200})
--end
]]

function keyboardListener(event)
	native.setKeyboardFocus(nil)
end

function scene:hide (event)

end

function scene:show (event)

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene

--[[NOTES
1) WHEN THE SAVE BUTTON IS CLICKED THE TEXTS ARE NOT UPDATED FOR SOME REASON
2) NEED TO FIND A BETTER COLOR FOR THE TEXTS?
]]