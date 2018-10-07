local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()
local clock = os.date("*t")
local ampm = os.date("%p")

--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
--TEXT BOXES?
function scene:create (event)
	local dayGroup3 = self.view
	
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
		
	local temp = display.newText("Day 3", display.contentWidth/2, 0, native.systemFont, 20)
		temp:setFillColor(0,0,0)
	
	local home = widget.newButton
		{
		left = 5,
		top = temp.y - 14,
		width = 60,
		height = 20,
		id = "home",
		label = "Home",
		labelColor = {default = {0,0,0}, over = {0,0,0}}
		}

	local height = display.contentHeight/14
	
	local cell = display.newRect(display.contentWidth/2, height, 150, 30)
		local cellText = display.newText("Notes/Assignments", display.contentWidth/2, cell.y, nil, 16)
		
	local cell1 = display.newRect(display.contentWidth/2, 2*height + 15, 150, 30)
		local cBandText3 = display.newText("C Band", display.contentWidth/2, cell1.y, nil, 16)
		local cBandTime3 = display.newText("8:10 - 9:00", cell1.x - 120, cell1.y, nil, 12)
		if(UserInfo.cBand ~= "")then
			cBandText3.text = UserInfo.cBand
		end
		
	local cell2 = display.newRect(display.contentWidth/2, 3*height + 30, 150, 30)
		local fBandText3 = display.newText("F Band", display.contentWidth/2, cell2.y, nil, 16)
		local fBandTime3 = display.newText("9:05 - 9:55", cell2.x - 120, cell2.y, nil, 12)
		if(UserInfo.fBand ~= "")then
			fBandText3.text = UserInfo.fBand
		end
		
	local cell3 = display.newRect(display.contentWidth/2, 4*height + 45, 150, 30)
		local advisingText3 = display.newText("Advising", display.contentWidth/2, cell3.y, nil, 16)
		local advisingTime3 = display.newText("9:55 - 10:15", cell3.x - 120, cell3.y, nil, 12)
		if(UserInfo.advising ~= "")then
			advisingText3.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 5*height +60, 150, 30)
		local breakText3 = display.newText("Break", display.contentWidth/2, cell4.y, nil, 16)
		local breakTime3 = display.newText("10:15 - 10:35", cell4.x - 120, cell4.y, nil, 12)
		if(UserInfo.myBreak ~= "")then
			breakText3.text = UserInfo.myBreak
		end
		
	local cell5 = display.newRect(display.contentWidth/2, 6*height + 75, 150, 30)
		local eBandText3 = display.newText("E Band", display.contentWidth/2, cell5.y, nil, 16)
		local eBandTime3 = display.newText("10:35 - 11:25", cell5.x - 120, cell5.y, nil, 12)
		if(UserInfo.eBand ~= "")then
			eBandText3.text = UserInfo.eBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 7*height + 90, 150, 30)
		local bBandText3 = display.newText("B Band", display.contentWidth/2, cell6.y, nil, 16)
		local bBandTime3 = display.newText("11:30 - 12:20", cell6.x - 120, cell6.y, nil, 12)
		if(UserInfo.bBand ~= "")then
			bBandText3.text = UserInfo.bBand
		end
		
	local cell7 = display.newRect(display.contentWidth/2, 8*height +105, 150, 30)
		local lunchText3 = display.newText("Lunch", display.contentWidth/2, cell7.y, nil, 16)
		local lunchTime3 = display.newText("12:20 - 1:00", cell7.x - 120, cell7.y, nil, 12)
		if(UserInfo.lunch ~= "")then
			lunchText3.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 9*height+120, 150, 30)
		local communityText3 = display.newText("Community", display.contentWidth/2, cell8.y, nil, 16)
		local communityTime3 = display.newText("1:00 - 1:45", cell8.x - 120, cell8.y, nil, 12)
		if(UserInfo.community ~= "")then
			communityText3.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 10*height + 135, 150, 30)
		local dBandText3 = display.newText("D Band", display.contentWidth/2, cell9.y, nil, 16)
		local dBandTime3 = display.newText("1:45 - 3:15", cell9.x - 120, cell9.y, nil, 12)
		if(UserInfo.dBand ~= "")then
			dBandText3.text = UserInfo.dBand
		end
	
	cell.strokeWidth = 2
	cell:setStrokeColor(0,0,0)
	cellText:setFillColor(0.6,0,0)
	cell1.strokeWidth = 2
	cell1:setStrokeColor(0,0,0)
	cBandText3:setFillColor(0.6,0,0)
	cell2.strokeWidth = 2
	cell2:setStrokeColor(0,0,0)
	fBandText3:setFillColor(0.6,0,0)
	cell3.strokeWidth = 2
	cell3:setStrokeColor(0,0,0)
	advisingText3:setFillColor(0.6,0,0)
	cell4.strokeWidth = 2
	cell4:setStrokeColor(0,0,0)
	breakText3:setFillColor(0.6,0,0)
	cell5.strokeWidth = 2
	cell5:setStrokeColor(0,0,0)
	bBandText3:setFillColor(0.6,0,0)
	cell6.strokeWidth = 2
	cell6:setStrokeColor(0,0,0)
	eBandText3:setFillColor(0.6,0,0)
	cell7.strokeWidth = 2
	cell7:setStrokeColor(0,0,0)
	lunchText3:setFillColor(0.6,0,0)
	cell8.strokeWidth = 2
	cell8:setStrokeColor(0,0,0)
	communityText3:setFillColor(0.6,0,0)
	cell9.strokeWidth = 2
	cell9:setStrokeColor(0,0,0)
	dBandText3:setFillColor(0.6,0,0)
	
	dayGroup3:insert(background)
	dayGroup3:insert(temp)
	dayGroup3:insert(home)
	dayGroup3:insert(cell)
	dayGroup3:insert(cell1)
	dayGroup3:insert(cell2)
	dayGroup3:insert(cell3)
	dayGroup3:insert(cell4)
	dayGroup3:insert(cell5)
	dayGroup3:insert(cell6)
	dayGroup3:insert(cell7)
	dayGroup3:insert(cell8)
	dayGroup3:insert(cell9)
	dayGroup3:insert(cellText)
	dayGroup3:insert(cBandText3)
	dayGroup3:insert(cBandTime3)
	dayGroup3:insert(fBandText3)
	dayGroup3:insert(fBandTime3)
	dayGroup3:insert(advisingText3)
	dayGroup3:insert(advisingTime3)
	dayGroup3:insert(breakText3)
	dayGroup3:insert(breakTime3)
	dayGroup3:insert(bBandText3)
	dayGroup3:insert(bBandTime3)
	dayGroup3:insert(eBandText3)
	dayGroup3:insert(eBandTime3)
	dayGroup3:insert(lunchText3)
	dayGroup3:insert(lunchTime3)
	dayGroup3:insert(communityText3)
	dayGroup3:insert(communityTime3)
	dayGroup3:insert(dBandText3)
	dayGroup3:insert(dBandTime3)

	--cell1
	if(clock.hour == 8 and clock.min >= 10)then
			cell1:setFillColor(0,0,0)
		end
		if(clock.hour == 9 and clock.min >=0)then
			cell1:setFillColor(1,1,1)
		end
		
	--cell2
	if(clock.hour == 9 and clock.min >= 5)then
			cell2:setFillColor(0,0,0)
		end
		if(clock.hour == 9 and clock.min >= 55)then
			cell2:setFillColor(1,1,1)
		end
	--cell3
	if((clock.hour == 9 and clock.min >= 55) or (clock.hour == 10 and clock.min >= 0))then
			cell3:setFillColor(0,0,0)
		end
		if(clock.hour == 10 and clock.min >= 15) then
			cell3:setFillColor(1,1,1)
		end
	--cell4
	if(clock.hour == 10 and clock.min >= 15) then
			cell4:setFillColor(0,0,0)
		end
		if(clock.hour == 10 and clock.min >= 35) then
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
	if ((clock.hour == 13 and clock.min >= 45) or (clock.hour == 14 and clock.min >= 0) or (clock.hour == 15 and clock.min >= 0)) then
			cell9:setFillColor(0,0,0)
		end
		if(clock.hour == 15 and clock.min >=15) then
			cell9:setFillColor(1,1,1)
		end
	-----------------------------------------------------------------------------------
	
	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	function homeButton(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("HomeScreen", {time = 200})
	end

	local function assignmentsTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("allHomeworkDay3", {time = 220})
	end
	
	local function cBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("cBand", {time = 220})
	end
	
	local function fBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("fBand", {time = 220})
	end
	
	local function advisingTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("advising", {time = 220})
	end
	
	local function breakTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("break", {time = 220})
	end
	
	local function bBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("bBand", {time = 220})
	end
	
	local function eBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("eBand", {time = 220})
	end
	
	local function lunchTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("lunch", {time = 220})
	end
	
	local function communityTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("community", {time = 220})
	end
	
	local function dBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("dBand", {time = 220})
	end
	
	home:addEventListener("tap", homeButton)
	cell:addEventListener("tap", assignmentsTouch)
	cell1:addEventListener("tap", cBandTouch)
	cell2:addEventListener("tap", fBandTouch)
	cell3:addEventListener("tap", advisingTouch)
	cell4:addEventListener("tap", breakTouch)
	cell5:addEventListener("tap", eBandTouch)
	cell6:addEventListener("tap", bBandTouch)
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