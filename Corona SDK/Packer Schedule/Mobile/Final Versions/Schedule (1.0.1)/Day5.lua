local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()

--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
function scene:create (event)
	local dayGroup5 = self.view
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
	local temp = display.newText("Day 5", display.contentWidth/2, 0, native.systemFont, 20)
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
--	home:setFillColor(0,0,1)
	
	local cell = display.newRect(display.contentWidth/2, 30, 150, 30)
		local cellText = display.newText("All Homework", display.contentWidth/2, 30, nil, 16)
		
	local cell1 = display.newRect(display.contentWidth/2, 80, 150, 30)
		local eBandText5 = display.newText("E Band", display.contentWidth/2, 80, nil, 16)
		local eBandTime5 = display.newText("8:10 - 9:00", 40, cell1.y, nil, 10)
		if(UserInfo.eBand ~= "")then
			eBandText5.text = UserInfo.eBand
		end
		
	local cell2 = display.newRect(display.contentWidth/2, 130, 150, 30)
		local bBandText5 = display.newText("B Band", display.contentWidth/2, 130, nil, 16)
		local bBandTime5 = display.newText("9:05 - 9:55", 40, cell2.y, nil, 10)
		if(UserInfo.bBand ~= "")then
			bBandText5.text = UserInfo.bBand
		end
		
	local cell3 = display.newRect(display.contentWidth/2, 180, 150, 30)
		local advisingText5 = display.newText("Advising", display.contentWidth/2, 180, nil, 16)
		local advisingTime5 = display.newText("9:55 - 10:15", 40, cell3.y, nil, 10)
		if(UserInfo.advising ~= "")then
			advisingText5.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 230, 150, 30)
		local breakText5 = display.newText("Break", display.contentWidth/2, 230, nil, 16)
		local breakTime5 = display.newText("10:15 - 10:35", 40, cell4.y, nil, 10)
		if(UserInfo.myBreak ~= "")then
			breakText5.text = UserInfo.myBreak
		end
		
	local cell5 = display.newRect(display.contentWidth/2, 280, 150, 30)
		local dBandText5 = display.newText("D Band", display.contentWidth/2, 280, nil, 16)
		local dBandTime5 = display.newText("10:35 - 11:25", 40, cell5.y, nil, 10)
		if(UserInfo.dBand ~= "")then
			dBandText5.text = UserInfo.dBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 330, 150, 30)
		local aBandText5 = display.newText("A Band", display.contentWidth/2, 330, nil, 16)
		local aBandTime5 = display.newText("11:30 - 12:20", 40, cell6.y, nil, 10)
		if(UserInfo.aBand ~= "")then
			aBandText5.text = UserInfo.aBand
		end
		
	local cell7 = display.newRect(display.contentWidth/2, 380, 150, 30)
		local lunchText5 = display.newText("Lunch", display.contentWidth/2, 380, nil, 16)
		local lunchTime5 = display.newText("12:20 - 1:00", 40, cell7.y, nil, 10)
		if(UserInfo.lunch ~= "")then
			lunchText5.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 430, 150, 30)
		local communityText5 = display.newText("Community", display.contentWidth/2, 430, nil, 16)
		local communityTime5 = display.newText("1:00 - 1:45", 40, cell8.y, nil, 10)
		if(UserInfo.community ~= "")then
			communityText5.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 480, 150, 30)
		local fBandText5 = display.newText("F Band", display.contentWidth/2, 480, nil, 16)
		local fBandTime5 = display.newText("1:45 - 3:15", 40, cell9.y, nil, 10)
		if(UserInfo.fBand ~= "")then
			fBandText5.text = UserInfo.fBand
		end
	
	cell.strokeWidth = 2
	cell:setStrokeColor(0,0,0)
	cellText:setFillColor(0.6,0,0)
	cell1.strokeWidth = 2
	cell1:setStrokeColor(0,0,0)
	eBandText5:setFillColor(0.6,0,0)
	cell2.strokeWidth = 2
	cell2:setStrokeColor(0,0,0)
	bBandText5:setFillColor(0.6,0,0)
	cell3.strokeWidth = 2
	cell3:setStrokeColor(0,0,0)
	advisingText5:setFillColor(0.6,0,0)
	cell4.strokeWidth = 2
	cell4:setStrokeColor(0,0,0)
	breakText5:setFillColor(0.6,0,0)
	cell5.strokeWidth = 2
	cell5:setStrokeColor(0,0,0)
	aBandText5:setFillColor(0.6,0,0)
	cell6.strokeWidth = 2
	cell6:setStrokeColor(0,0,0)
	dBandText5:setFillColor(0.6,0,0)
	cell7.strokeWidth = 2
	cell7:setStrokeColor(0,0,0)
	lunchText5:setFillColor(0.6,0,0)
	cell8.strokeWidth = 2
	cell8:setStrokeColor(0,0,0)
	communityText5:setFillColor(0.6,0,0)
	cell9.strokeWidth = 2
	cell9:setStrokeColor(0,0,0)
	fBandText5:setFillColor(0.6,0,0)
	
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
	dayGroup5:insert(eBandText5)
	dayGroup5:insert(eBandTime5)
	dayGroup5:insert(bBandText5)
	dayGroup5:insert(bBandTime5)
	dayGroup5:insert(advisingText5)
	dayGroup5:insert(advisingTime5)
	dayGroup5:insert(breakText5)
	dayGroup5:insert(breakTime5)
	dayGroup5:insert(aBandText5)
	dayGroup5:insert(aBandTime5)
	dayGroup5:insert(dBandText5)
	dayGroup5:insert(dBandTime5)
	dayGroup5:insert(lunchText5)
	dayGroup5:insert(lunchTime5)
	dayGroup5:insert(communityText5)
	dayGroup5:insert(communityTime5)
	dayGroup5:insert(fBandText5)
	dayGroup5:insert(fBandTime5)
	 
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
	
	local function eBandTouch (event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("eBand", {time = 220})
	end
	
	local function bBandTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("bBand", {time = 220})
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
	
	local function aBandTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("aBand", {time = 220})
	end
	
	local function dBandTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("dBand", {time = 220})
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
	
	local function fBandTouch(event)
		dayGroup5.alpha=0
		dayGroup5:removeSelf()
		dayGroup5=nil
		composer.gotoScene("fBand", {time = 220})
	end

	home:addEventListener("tap", homeButton)
	cell:addEventListener("tap", assignmentsTouch)
	cell1:addEventListener("tap", eBandTouch)
	cell2:addEventListener("tap", bBandTouch)
	cell3:addEventListener("tap", advisingTouch)
	cell4:addEventListener("tap", breakTouch)
	cell5:addEventListener("tap", dBandTouch)
	cell6:addEventListener("tap", aBandTouch)
	cell7:addEventListener("tap", lunchTouch)
	cell8:addEventListener("tap", communityTouch)
	cell9:addEventListener("tap", fBandTouch)

end


function scene:hide (event)

end

function scene:show (event)

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene