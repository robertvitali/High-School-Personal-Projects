local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()
local clock = os.date("*t")
local ampm = os.date("%p")

--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
function scene:create (event)
	local dayGroup5 = self.view
	widget.setTheme( "widget_theme_ios7" )
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
	local temp = display.newText("Day 5", display.contentWidth/2, 0, native.systemFont, 20)
	temp:setFillColor(0,0,0)
	
	local home = widget.newButton
	{
		left = 5,
		top = temp.y-14,
		width = 60,
		height = 20,
		id = "home",
		label = "Home",
		labelColor = {default = {0,0,0}, over = {0,0,0}}
	}

	
	local height = display.contentHeight/14
	
	local cell = display.newRect(display.contentWidth/2, height, 150, 30)
		local cellText = display.newText("Notes/Assignments", display.contentWidth/2, cell.y, nil, 16)
		
	local cell1 = display.newRect(display.contentWidth/2, 2*height+15, 150, 30)
		local gBandText5 = display.newText("G Band", display.contentWidth/2, cell1.y, nil, 16)
		local gBandTime5 = display.newText("8:10 - 8:55", cell1.x - 120, cell1.y, nil, 10)
		if(UserInfo.gBand ~= "")then
			gBandText5.text = UserInfo.gBand
		end
		
	local cell2 = display.newRect(display.contentWidth/2, 3*height +30, 150, 30)
		local aBandText5 = display.newText("A Band", display.contentWidth/2, cell2.y, nil, 16)
		local aBandTime5 = display.newText("9:00 - 9:45", cell2.x - 120, cell2.y, nil, 10)
		if(UserInfo.aBand ~= "")then
			aBandText5.text = UserInfo.aBand
		end
		
	local cell3 = display.newRect(display.contentWidth/2, 4*height+45, 150, 30)
		local advisingText5 = display.newText("Advising", display.contentWidth/2, cell3.y, nil, 16)
		local advisingTime5 = display.newText("9:50 - 10:10", cell3.x - 120, cell3.y, nil, 10)
		if(UserInfo.advising ~= "")then
			advisingText5.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 5*height+60, 150, 30)
		local breakText5 = display.newText("Break", display.contentWidth/2, cell4.y, nil, 16)
		local breakTime5 = display.newText("10:10 - 10:30", cell4.x - 120, cell4.y, nil, 10)
		if(UserInfo.myBreak ~= "")then
			breakText5.text = UserInfo.myBreak
		end
		
	local cell5 = display.newRect(display.contentWidth/2, 6*height+75, 150, 30)
		local bBandText5 = display.newText("B Band", display.contentWidth/2, cell5.y, nil, 16)
		local bBandTime5 = display.newText("10:35 - 11:25", cell5.x - 120, cell5.y, nil, 10)
		if(UserInfo.dBand ~= "")then
			bBandText5.text = UserInfo.bBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 7*height+90, 150, 30)
		local cBandText5 = display.newText("C Band", display.contentWidth/2, cell6.y, nil, 16)
		local cBandTime5 = display.newText("11:30 - 12:20", cell6.x - 120, cell6.y, nil, 10)
		if(UserInfo.aBand ~= "")then
			cBandText5.text = UserInfo.cBand
		end
		
	local cell7 = display.newRect(display.contentWidth/2, 8*height+105, 150, 30)
		local lunchText5 = display.newText("Lunch", display.contentWidth/2, cell7.y, nil, 16)
		local lunchTime5 = display.newText("12:20 - 1:00", cell7.x - 120, cell7.y, nil, 10)
		if(UserInfo.lunch ~= "")then
			lunchText5.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 9*height+120, 150, 30)
		local communityText5 = display.newText("Community", display.contentWidth/2, cell8.y, nil, 16)
		local communityTime5 = display.newText("1:05 - 1:45", cell8.x - 120, cell8.y, nil, 10)
		if(UserInfo.community ~= "")then
			communityText5.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 10*height+135, 150, 30)
		local dBandText5 = display.newText("D Band", display.contentWidth/2, cell9.y, nil, 16)
		local dBandTime5 = display.newText("1:50 - 3:20", cell9.x - 120, cell9.y, nil, 10)
		if(UserInfo.fBand ~= "")then
			dBandText5.text = UserInfo.dBand
		end
	
	cell.strokeWidth = 2
	cell:setStrokeColor(0,0,0)
	cellText:setFillColor(0.6,0,0)
	cell1.strokeWidth = 2
	cell1:setStrokeColor(0,0,0)
	gBandText5:setFillColor(0.6,0,0)
	cell2.strokeWidth = 2
	cell2:setStrokeColor(0,0,0)
	aBandText5:setFillColor(0.6,0,0)
	cell3.strokeWidth = 2
	cell3:setStrokeColor(0,0,0)
	advisingText5:setFillColor(0.6,0,0)
	cell4.strokeWidth = 2
	cell4:setStrokeColor(0,0,0)
	breakText5:setFillColor(0.6,0,0)
	cell5.strokeWidth = 2
	cell5:setStrokeColor(0,0,0)
	bBandText5:setFillColor(0.6,0,0)
	cell6.strokeWidth = 2
	cell6:setStrokeColor(0,0,0)
	cBandText5:setFillColor(0.6,0,0)
	cell7.strokeWidth = 2
	cell7:setStrokeColor(0,0,0)
	lunchText5:setFillColor(0.6,0,0)
	cell8.strokeWidth = 2
	cell8:setStrokeColor(0,0,0)
	communityText5:setFillColor(0.6,0,0)
	cell9.strokeWidth = 2
	cell9:setStrokeColor(0,0,0)
	dBandText5:setFillColor(0.6,0,0)
	
	dayGroup5:insert(background)
	dayGroup5:insert(temp)
	dayGroup5:insert(home)
	dayGroup5:insert(cell)
	dayGroup5:insert(cell1)
	dayGroup5:insert(cell2)
	dayGroup5:insert(cell3)
	dayGroup5:insert(cell4)
	dayGroup5:insert(cell5)
	dayGroup5:insert(cell6)
	dayGroup5:insert(cell7)
	dayGroup5:insert(cell8)
	dayGroup5:insert(cell9)
	dayGroup5:insert(cellText)
	dayGroup5:insert(gBandText5)
	dayGroup5:insert(gBandTime5)
	dayGroup5:insert(aBandText5)
	dayGroup5:insert(aBandTime5)
	dayGroup5:insert(advisingText5)
	dayGroup5:insert(advisingTime5)
	dayGroup5:insert(breakText5)
	dayGroup5:insert(breakTime5)
	dayGroup5:insert(bBandText5)
	dayGroup5:insert(bBandTime5)
	dayGroup5:insert(cBandText5)
	dayGroup5:insert(cBandTime5)
	dayGroup5:insert(lunchText5)
	dayGroup5:insert(lunchTime5)
	dayGroup5:insert(communityText5)
	dayGroup5:insert(communityTime5)
	dayGroup5:insert(dBandText5)
	dayGroup5:insert(dBandTime5)

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
	if((clock.hour == 9 and clock.min >= 50) or (clock.hour == 10 and clock.min >= 0))then
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
	function homeButton(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("HomeScreen", {time = 200})
	end

	local function assignmentsTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("allHomeworkDay5", {time = 220})
	end
	
	local function gBandTouch (event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("gBand", {time = 220})
	end
	
	local function aBandTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("aBand", {time = 220})
	end
	
	local function advisingTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("advising", {time = 220})
	end
	
	local function breakTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("break", {time = 220})
	end
	
	local function bBandTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("bBand", {time = 220})
	end
	
	local function cBandTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("cBand", {time = 220})
	end
	
	local function lunchTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("lunch", {time = 220})
	end
	
	local function communityTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("community", {time = 220})
	end
	
	local function dBandTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("dBand", {time = 220})
	end

	home:addEventListener("tap", homeButton)
	cell:addEventListener("tap", assignmentsTouch)
	cell1:addEventListener("tap", gBandTouch)
	cell2:addEventListener("tap", aBandTouch)
	cell3:addEventListener("tap", advisingTouch)
	cell4:addEventListener("tap", breakTouch)
	cell5:addEventListener("tap", bBandTouch)
	cell6:addEventListener("tap", cBandTouch)
	cell7:addEventListener("tap", lunchTouch)
	cell8:addEventListener("tap", communityTouch)
	cell9:addEventListener("tap", dBandTouch)

end


function scene:hide (event)

end

function scene:show (event)

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene