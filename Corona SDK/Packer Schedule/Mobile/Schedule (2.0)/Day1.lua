--DAY 1 TEST PAGE

local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()
--local notification = require "plugin.notifications"

	--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
	--TEXT BOXES?
function scene:create (event)
	local clock = os.date("*t")
	local ampm = os.date("%p")
	print(clock.hour..":"..clock.min)

	local dayGroup1 = self.view
	widget.setTheme( "widget_theme_ios7" )
	local height = display.contentHeight/14

	--SET UP BACKRGROUND RECTANGLE SO THAT COLOR CAN BE CHANGED EASILY
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6, 0, 0)
		
	--THE LOCAL TEMP USED TO BE TEMPORARY TEXT- NOW IS TITLE TEXT FOR EACH PAGE
	local temp = display.newText("Day 1", display.contentWidth/2, 0, native.systemFont, 20)
		temp:setFillColor(0,0,0)
	
	local home = widget.newButton
	{
		left = 5,
		top = temp.y -14,
		width = 60,
		height = 20,
		id = "home",
		label = "Home",
		labelColor = {default = {0,0,0}, over = {0,0,0}}
	}

--	local home = display.newText("Home", 35, 0, nil, 18)
--		home:setFillColor(0,0,1)

	--SETTING EACH CELL AND CELL TEXT
	local cell = display.newRect(display.contentWidth/2, height, 150, 30)
		local cellText = display.newText("Notes/Assignments", display.contentWidth/2, cell.y, nil, 16)
		
	local cell1 = display.newRect(display.contentWidth/2, 2*height + 15, 150, 30)
		local aBandText1 = display.newText("A Band", display.contentWidth/2, cell1.y, nil, 16)
		local aBandTime1 = display.newText("8:10 - 8:55", cell1.x - 120, cell1.y, nil, 12)
		if(UserInfo.aBand ~= "")then
			aBandText1.text = UserInfo.aBand
		end
		
	local cell2 = display.newRect(display.contentWidth/2, 3*height + 30, 150, 30)
		local bBandText1 = display.newText("B Band", display.contentWidth/2, cell2.y, nil, 16)
		local bBandTime1 = display.newText("9:00 - 9:45", cell2.x - 120, cell2.y, nil, 12)
		if(UserInfo.bBand ~= "")then
			bBandText1.text = UserInfo.bBand
		end

	local cell3 = display.newRect(display.contentWidth/2, 4*height + 45, 150, 30)
		local advisingText1 = display.newText("Advising", display.contentWidth/2, cell3.y, nil, 16)
		local advisingTime1 = display.newText("9:50 - 10:10", cell3.x - 120, cell3.y, nil, 12)
		if(UserInfo.advising ~= "")then
			advisingText1.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 5*height + 60, 150, 30)
		local breakText1 = display.newText("Break", display.contentWidth/2, cell4.y, nil, 16)
		local breakTime1 = display.newText("10:10 - 10:30", cell4.x - 120, cell4.y, nil, 12)
		if(UserInfo.myBreak ~= "")then
			breakText1.text = UserInfo.myBreak
		end

	local cell5 = display.newRect(display.contentWidth/2, 6*height + 75, 150, 30)
		local cBandText1 = display.newText("C Band", display.contentWidth/2, cell5.y, nil, 16)
		local cBandTime1 = display.newText("10:35 - 11:25", cell5.x - 120, cell5.y, nil, 12)
		if(UserInfo.gBand ~= "")then
			cBandText1.text = UserInfo.cBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 7*height+90, 150, 30)
		local dBandText1 = display.newText("D Band", display.contentWidth/2, cell6.y, nil, 16)
		local dBandTime1 = display.newText("11:30 - 12:20", cell6.x - 120, cell6.y, nil, 12)
		if(UserInfo.cBand ~= "")then
			dBandText1.text = UserInfo.dBand
		end
		
	local cell7 = display.newRect(display.contentWidth/2, 8*height + 105, 150, 30)
		local lunchText1 = display.newText("Lunch", display.contentWidth/2, cell7.y, nil, 16)
		local lunchTime1 = display.newText("12:20 - 1:00", cell7.x - 120, cell7.y, nil, 12)
		if(UserInfo.lunch ~= "")then
			lunchText1.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 9*height + 120, 150, 30)
		local communityText1 = display.newText("Community", display.contentWidth/2, cell8.y, nil, 16)
		local communityTime1 = display.newText("1:05 - 1:45", cell8.x - 120, cell8.y, nil, 12)
		if(UserInfo.community ~= "")then
			communityText1.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 10*height + 135, 150, 30)
		local eBandText1 = display.newText("E Band", display.contentWidth/2, cell9.y, nil, 16)
		local eBandTime1 = display.newText("1:50 - 3:20", cell9.x - 120, cell9.y, nil, 12)
		if(UserInfo.eBand ~= "")then
			eBandText1.text = UserInfo.eBand
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
	bBandText1:setFillColor(.6,0,0)
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
	dBandText1:setFillColor(.6,0,0)
	cell7.strokeWidth = 2
	cell7:setStrokeColor(0,0,0)
	lunchText1:setFillColor(.6,0,0)
	cell8.strokeWidth = 2
	cell8:setStrokeColor(0,0,0)
	communityText1:setFillColor(.6,0,0)
	cell9.strokeWidth = 2
	cell9:setStrokeColor(0,0,0)
	eBandText1:setFillColor(.6,0,0)

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
	dayGroup1:insert(aBandTime1)
	dayGroup1:insert(bBandText1)
	dayGroup1:insert(bBandTime1)
	dayGroup1:insert(breakText1)
	dayGroup1:insert(breakTime1)
	dayGroup1:insert(advisingText1)
	dayGroup1:insert(advisingTime1)
	dayGroup1:insert(cBandText1)
	dayGroup1:insert(cBandTime1)
	dayGroup1:insert(dBandText1)
	dayGroup1:insert(dBandTime1)
	dayGroup1:insert(lunchText1)
	dayGroup1:insert(lunchTime1)
	dayGroup1:insert(communityText1)
	dayGroup1:insert(communityTime1)
	dayGroup1:insert(eBandText1)
	dayGroup1:insert(eBandTime1)

	local function assignmentsTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("allHomeworkDay1", {time = 220})
	end

	local function aBandTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("aBand", {time = 220})
	end
	
	local function bBandTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("bBand", {time = 220})
	end
	
	local function advisingTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("advising", {time = 220})
	end
	
	local function breakTouch(event)
		dayGroup1.alpha = 0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("break", {time = 220})
	end
	
	local function cBandTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("cBand", {time = 220})
	end
	
	local function dBandTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("dBand", {time = 220})
	end
	
	local function lunchTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("lunch", {time = 220})
	end
	
	local function communityTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("community", {time = 220})
	end
	
	local function eBandTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("eBand", {time = 220})
	end

	---------------------------------TIMER SECTION--------------------------------------
	--cell1
	if(clock.hour == 8 and clock.min >= 10)then
			cell1:setFillColor(0,0,0)
		end
		if(clock.hour == 8 and clock.min >=55)then
			cell1:setFillColor(1,1,1)
		end
		
	--cell2
	if(clock.hour == 9 and clock.min >= 0)then
			cell2:setFillColor(0,0,0)
		end
		if(clock.hour == 9 and clock.min >= 45)then
			cell2:setFillColor(1,1,1)
		end
	--cell3
	if((clock.hour == 9 and clock.min >= 45) or (clock.hour == 10 and clock.min >= 0))then
			cell3:setFillColor(0,0,0)
		end
		if(clock.hour == 10 and clock.min >= 10) then
			cell3:setFillColor(1,1,1)
		end
	--cell4
	if(clock.hour == 10 and clock.min >= 10) then
			cell4:setFillColor(0,0,0)
		end
		if(clock.hour == 10 and clock.min >= 30) then
			cell4:setFillColor(1,1,1)
		end
	--cell5
	if((clock.hour == 10 and clock.min >= 35) or (clock.hour == 11 and clock.min >= 0))then
			cell5:setFillColor(0,0,0)
		end
		if(clock.hour == 11 and clock.min >= 25)then
			cell5:setFillColor(1,1,1)
		end
	--cell6
	if((clock.hour == 11 and clock.min >= 30) or (clock.hour == 12 and clock.min >= 0))then
			cell6:setFillColor(0,0,0)
		end
		if(clock.hour == 12 and clock.min >= 20)then
			cell6:setFillColor(1,1,1)
		end
	--cell7
	if (clock.hour == 12 and clock.min >= 20)then
			cell7:setFillColor(0,0,0)
		end
		if (clock.hour == 13 and clock.min >= 0) then
			cell7:setFillColor(1,1,1)
		end
	--cell8
	if (clock.hour == 13 and clock.min >= 0) then
		
		--[[ THIS IS TO ALERT THE USER THAT THE BAND IS COMMUNITY THROUGH A NOTIFICATION ***************************
			event.alert = "Community"
		]]
			cell8:setFillColor(0,0,0)
		end
		if (clock.hour == 13 and clock.min >= 45) then
			cell8:setFillColor(1,1,1)
		end
	--cell9
	if ((clock.hour == 13 and clock.min >= 50) or (clock.hour == 14 and clock.min >= 0) or (clock.hour == 15 and clock.min >= 0)) then
			cell9:setFillColor(0,0,0)
		end
		if(clock.hour == 15 and clock.min >=20) then
			cell9:setFillColor(1,1,1)
		end
	-----------------------------------------------------------------------------------


--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function homeButton(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("HomeScreen", {time = 200})
	end



	home:addEventListener("tap", homeButton)
	cell:addEventListener("tap", assignmentsTouch)
	cell1:addEventListener("tap", aBandTouch)
	cell2:addEventListener("tap", bBandTouch)
	cell3:addEventListener("tap", advisingTouch)
	cell4:addEventListener("tap", breakTouch)
	cell5:addEventListener("tap", cBandTouch)
	cell6:addEventListener("tap", dBandTouch)
	cell7:addEventListener("tap", lunchTouch)
	cell8:addEventListener("tap", communityTouch)
	cell9:addEventListener("tap", eBandTouch)
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