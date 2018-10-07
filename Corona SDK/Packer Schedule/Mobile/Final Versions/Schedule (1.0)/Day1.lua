--DAY 1 TEST PAGE

local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()

	--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
	--TEXT BOXES?
function scene:create (event)
	local dayGroup1 = self.view

	--SET UP BACKRGROUND RECTANGLE SO THAT COLOR CAN BE CHANGED EASILY
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6, 0, 0)
		
	--THE LOCAL TEMP USED TO BE TEMPORARY TEXT- NOW IS TITLE TEXT FOR EACH PAGE
	local temp = display.newText("Day 1", display.contentWidth/2, 0, native.systemFont, 20)
		temp:setFillColor(0,0,0)
	
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

--	local home = display.newText("Home", 35, 0, nil, 18)
--		home:setFillColor(0,0,1)

	--SETTING EACH CELL AND CELL TEXT
	local cell = display.newRect(display.contentWidth/2, 30, 150, 30)
		local cellText = display.newText("PO", display.contentWidth/2, 30, nil, 16)
		
	local cell1 = display.newRect(display.contentWidth/2, 80, 150, 30)
		local aBandText1 = display.newText("A Band", display.contentWidth/2, 80, nil, 16)
		if(UserInfo.aBand ~= "")then
			aBandText1.text = UserInfo.aBand
		end
		
	local cell2 = display.newRect(display.contentWidth/2, 130, 150, 30)
		local dBandText1 = display.newText("D Band", display.contentWidth/2, 130, nil, 16)
		if(UserInfo.dBand ~= "")then
			dBandText1.text = UserInfo.dBand
		end

	local cell3 = display.newRect(display.contentWidth/2, 180, 150, 30)
		local advisingText1 = display.newText("Advising", display.contentWidth/2, 180, nil, 16)
		if(UserInfo.advising ~= "")then
			advisingText1.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 230, 150, 30)
		local breakText1 = display.newText("Break", display.contentWidth/2, 230, nil, 16)
		if(UserInfo.myBreak ~= "")then
			breakText1.text = UserInfo.myBreak
		end

	local cell5 = display.newRect(display.contentWidth/2, 280, 150, 30)
		local gBandText1 = display.newText("G Band", display.contentWidth/2, 280, nil, 16)
		if(UserInfo.gBand ~= "")then
			gBandText1.text = UserInfo.gBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 330, 150, 30)
		local cBandText1 = display.newText("C Band", display.contentWidth/2, 330, nil, 16)
		if(UserInfo.cBand ~= "")then
			cBandText1.text = UserInfo.cBand
		end
		
	local cell7 = display.newRect(display.contentWidth/2, 380, 150, 30)
		local lunchText1 = display.newText("Lunch", display.contentWidth/2, 380, nil, 16)
		if(UserInfo.lunch ~= "")then
			lunchText1.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 430, 150, 30)
		local communityText1 = display.newText("Community", display.contentWidth/2, 430, nil, 16)
		if(UserInfo.community ~= "")then
			communityText1.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 480, 150, 30)
		local bBandText1 = display.newText("B Band", display.contentWidth/2, 480, nil, 16)
		if(UserInfo.bBand ~= "")then
			bBandText1.text = UserInfo.bBand
		end
		

	--SETTING THE STROKE COLOR AND STROKE WIDTH OF EACH CELL AND CELL TEXT SO THAT THEY SHOW UP
	cell.strokeWidth = 2
	cell:setStrokeColor(0,0,0)
	cellText:setFillColor(.6,0,0)
	cell1.strokeWidth = 2
	cell1:setStrokeColor(0,0,0)
	aBandText1:setFillColor(.6,0,0)
	cell2.strokeWidth = 2
	cell2:setStrokeColor(0,0,0)
	dBandText1:setFillColor(.6,0,0)
	cell3.strokeWidth = 2
	cell3:setStrokeColor(0,0,0)
	breakText1:setFillColor(.6,0,0)
	cell4.strokeWidth = 2
	cell4:setStrokeColor(0,0,0)
	advisingText1:setFillColor(.6,0,0)
	cell5.strokeWidth = 2
	cell5:setStrokeColor(0,0,0)
	cBandText1:setFillColor(.6,0,0)
	cell6.strokeWidth = 2
	cell6:setStrokeColor(0,0,0)
	gBandText1:setFillColor(.6,0,0)
	cell7.strokeWidth = 2
	cell7:setStrokeColor(0,0,0)
	lunchText1:setFillColor(.6,0,0)
	cell8.strokeWidth = 2
	cell8:setStrokeColor(0,0,0)
	communityText1:setFillColor(.6,0,0)
	cell9.strokeWidth = 2
	cell9:setStrokeColor(0,0,0)
	bBandText1:setFillColor(.6,0,0)

	--INSERTING EACH ELEMENT OF THE PAGE INTO THE GROUP TO MAKE REMOVAL EASIER
	dayGroup1:insert(background)
	dayGroup1:insert(temp)
	dayGroup1:insert(home)
	dayGroup1:insert(cell)
	dayGroup1:insert(cell1)
	dayGroup1:insert(cell2)
	dayGroup1:insert(cell3)
	dayGroup1:insert(cell4)
	dayGroup1:insert(cell5)
	dayGroup1:insert(cell6)
	dayGroup1:insert(cell7)
	dayGroup1:insert(cell8)
	dayGroup1:insert(cell9)
	dayGroup1:insert(cellText)
	dayGroup1:insert(aBandText1)
	dayGroup1:insert(dBandText1)
	dayGroup1:insert(breakText1)
	dayGroup1:insert(advisingText1)
	dayGroup1:insert(cBandText1)
	dayGroup1:insert(gBandText1)
	dayGroup1:insert(lunchText1)
	dayGroup1:insert(communityText1)
	dayGroup1:insert(bBandText1)

	local function aBandTouch (event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("aBand", {effect = "slideLeft", time = 300})
	end
	
	local function dBandTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("dBand", {effect = "slideLeft", time = 300})
	end
	
	local function advisingTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("advising", {effect = "slideLeft", time = 300})
	end
	
	local function breakTouch(event)
		dayGroup1.alpha = 0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("break", {effect = "slideLeft", time = 300})
	end
	
	local function cBandTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("cBand", {effect = "slideLeft", time = 300})
	end
	
	local function gBandTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("gBand", {effect = "slideLeft", time = 300})
	end
	
	local function lunchTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("lunch", {effect = "slideLeft", time = 300})
	end
	
	local function communityTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("community", {effect = "slideLeft", time = 300})
	end
	
	local function bBandTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("bBand", {effect = "slideLeft", time = 300})
	end

--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function homeButton(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("HomeScreen", {effect = "slideRight", time = 250})
	end

	home:addEventListener("tap", homeButton)
	cell1:addEventListener("tap", aBandTouch)
	cell2:addEventListener("tap", dBandTouch)
	cell3:addEventListener("tap", advisingTouch)
	cell4:addEventListener("tap", breakTouch)
	cell5:addEventListener("tap", gBandTouch)
	cell6:addEventListener("tap", cBandTouch)
	cell7:addEventListener("tap", lunchTouch)
	cell8:addEventListener("tap", communityTouch)
	cell9:addEventListener("tap", bBandTouch)
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