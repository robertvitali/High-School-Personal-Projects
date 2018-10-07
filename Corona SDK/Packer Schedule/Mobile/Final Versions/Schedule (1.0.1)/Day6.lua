local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()

--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
function scene:create (event)
	local dayGroup6 = self.view
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
	local temp = display.newText("Day 6", display.contentWidth/2, 0, native.systemFont, 20)
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
		local fBandText6 = display.newText("F Band", display.contentWidth/2, 80, nil, 16)
		local fBandTime6 = display.newText("8:10 - 9:00", 40, cell1.y, nil, 12)
		if(UserInfo.fBand ~= "")then
			fBandText6.text = UserInfo.fBand
		end
		
	local cell2 = display.newRect(display.contentWidth/2, 130, 150, 30)
		local cBandText6 = display.newText("C Band", display.contentWidth/2, 130, nil, 16)
		local cBandTime6 = display.newText("9:05 - 9:55", 40, cell2.y, nil, 12)
		if(UserInfo.cBand ~= "")then
			cBandText6.text = UserInfo.cBand
		end
		
	local cell3 = display.newRect(display.contentWidth/2, 180, 150, 30)
		local advisingText6 = display.newText("Advising", display.contentWidth/2, 180, nil, 16)
		local advisingTime6 = display.newText("9:55 - 10:15", 40, cell3.y, nil, 12)
		if(UserInfo.advising ~= "")then
			advisingText6.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 230, 150, 30)
		local breakText6 = display.newText("Break", display.contentWidth/2, 230, nil, 16)
		local breakTime6 = display.newText("10:15 - 10:35", 40, cell4.y, nil, 12)
		if(UserInfo.myBreak ~= "")then
			breakText6.text = UserInfo.myBreak
		end
		
	local cell5 = display.newRect(display.contentWidth/2, 280, 150, 30)
		local dBandText6 = display.newText("D Band", display.contentWidth/2, 280, nil, 16)
		local dBandTime6 = display.newText("10:35 - 11:25", 40, cell5.y, nil, 12)
		if(UserInfo.dBand ~= "")then
			dBandText6.text = UserInfo.dBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 330, 150, 30)
		local aBandText6 = display.newText("A Band", display.contentWidth/2, 330, nil, 16)
		local aBandTime6 = display.newText("11:30 - 12:20", 40, cell6.y, nil, 12)
		if(UserInfo.aBand ~= "")then
			aBandText6.text = UserInfo.aBand
		end
		
	local cell7 = display.newRect(display.contentWidth/2, 380, 150, 30)
		local lunchText6 = display.newText("Lunch", display.contentWidth/2, 380, nil, 16)
		local lunchTime6 = display.newText("12:20 - 1:00", 40, cell7.y, nil, 12)
		if(UserInfo.lunch ~= "")then
			lunchText6.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 430, 150, 30)
		local communityText6 = display.newText("Community", display.contentWidth/2, 430, nil, 16)
		local communityTime6 = display.newText("1:00 - 1:45", 40, cell8.y, nil, 12)
		if(UserInfo.community ~= "")then
			communityText6.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 480, 150, 30)
		local gBandText6 = display.newText("G Band", display.contentWidth/2, 480, nil, 16)
		local gBandTime6 = display.newText("1:45 - 3:15", 40, cell9.y, nil, 12)
		if(UserInfo.gBand ~= "")then
			gBandText6.text = UserInfo.gBand
		end
	
	cell.strokeWidth = 2
	cell:setStrokeColor(0,0,0)
	cellText:setFillColor(0.6,0,0)
	cell1.strokeWidth = 2
	cell1:setStrokeColor(0,0,0)
	fBandText6:setFillColor(0.6,0,0)
	cell2.strokeWidth = 2
	cell2:setStrokeColor(0,0,0)
	cBandText6:setFillColor(0.6,0,0)
	cell3.strokeWidth = 2
	cell3:setStrokeColor(0,0,0)
	advisingText6:setFillColor(0.6,0,0)
	cell4.strokeWidth = 2
	cell4:setStrokeColor(0,0,0)
	breakText6:setFillColor(0.6,0,0)
	cell5.strokeWidth = 2
	cell5:setStrokeColor(0,0,0)
	aBandText6:setFillColor(0.6,0,0)
	cell6.strokeWidth = 2
	cell6:setStrokeColor(0,0,0)
	dBandText6:setFillColor(0.6,0,0)
	cell7.strokeWidth = 2
	cell7:setStrokeColor(0,0,0)
	lunchText6:setFillColor(0.6,0,0)
	cell8.strokeWidth = 2
	cell8:setStrokeColor(0,0,0)
	communityText6:setFillColor(0.6,0,0)
	cell9.strokeWidth = 2
	cell9:setStrokeColor(0,0,0)
	gBandText6:setFillColor(0.6,0,0)
	
	dayGroup6:insert(background)
	dayGroup6:insert(temp)
	dayGroup6:insert(home)
	dayGroup6:insert(cell)
	dayGroup6:insert(cell1)
	dayGroup6:insert(cell2)
	dayGroup6:insert(cell3)
	dayGroup6:insert(cell4)
	dayGroup6:insert(cell5)
	dayGroup6:insert(cell6)
	dayGroup6:insert(cell7)
	dayGroup6:insert(cell8)
	dayGroup6:insert(cell9)
	dayGroup6:insert(cellText)
	dayGroup6:insert(fBandText6)
	dayGroup6:insert(fBandTime6)
	dayGroup6:insert(cBandText6)
	dayGroup6:insert(cBandTime6)
	dayGroup6:insert(advisingText6)
	dayGroup6:insert(advisingTime6)
	dayGroup6:insert(breakText6)
	dayGroup6:insert(breakTime6)
	dayGroup6:insert(aBandText6)
	dayGroup6:insert(aBandTime6)
	dayGroup6:insert(dBandText6)
	dayGroup6:insert(dBandTime6)
	dayGroup6:insert(lunchText6)
	dayGroup6:insert(lunchTime6)
	dayGroup6:insert(communityText6)
	dayGroup6:insert(communityTime6)
	dayGroup6:insert(gBandText6)
	dayGroup6:insert(gBandTime6)
--THIS BUTTON TO GO BACK TO THE HOME PAGE
	function homeButton(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("HomeScreen", {time = 220})
	end

	local function assignmentsTouch(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("allHomeworkDay6", {time = 220})
	end
	
	local function fBandTouch(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("fBand", {time = 220})
	end
	
	local function cBandTouch(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("cBand", {time = 220})
	end
	
	local function advisingTouch(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("advising", {time = 220})
	end
	
	local function breakTouch(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("break", {time = 220})
	end
	
	local function aBandTouch(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("aBand", {time = 220})
	end
	
	local function dBandTouch(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("dBand", {time = 220})
	end
	
	local function lunchTouch(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("lunch", {time = 220})
	end
	
	local function communityTouch(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("community", {time = 220})
	end
	
	local function gBandTouch(event)
		dayGroup6.alpha=0
		dayGroup6:removeSelf()
		dayGroup6=nil
		composer.gotoScene("gBand", {time = 220})
	end
	
	home:addEventListener("tap", homeButton)
	cell:addEventListener("tap", assignmentsTouch)
	cell1:addEventListener("tap", fBandTouch)
	cell2:addEventListener("tap", cBandTouch)
	cell3:addEventListener("tap", advisingTouch)
	cell4:addEventListener("tap", breakTouch)
	cell5:addEventListener("tap", dBandTouch)
	cell6:addEventListener("tap", aBandTouch)
	cell7:addEventListener("tap", lunchTouch)
	cell8:addEventListener("tap", communityTouch)
	cell9:addEventListener("tap", gBandTouch)
end


function scene:hide (event)

end

function scene:show (event)

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene