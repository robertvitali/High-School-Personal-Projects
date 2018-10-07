local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()

--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
--TEXT BOXES?
function scene:create (event)
	local dayGroup4 = self.view
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
	local temp = display.newText("Day 4", display.contentWidth/2, 0, native.systemFont, 20)
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

	
--		local home = display.newText("Home", 35, 0, nil, 18)
--		home:setFillColor(0,0,1)
	
	cell = display.newRect(display.contentWidth/2, 30, 150, 30)
		cellText = display.newText("PO", display.contentWidth/2, 30, nil, 16)
		
	local cell1 = display.newRect(display.contentWidth/2, 80, 150, 30)
		local dBandText4 = display.newText("D Band", display.contentWidth/2, 80, nil, 16)
		if(UserInfo.dBand ~= "")then
			dBandText4.text = UserInfo.dBand
		end
		
	local cell2 = display.newRect(display.contentWidth/2, 130, 150, 30)
		local aBandText4 = display.newText("A Band", display.contentWidth/2, 130, nil, 16)
		if(UserInfo.aBand ~= "")then
			aBandText4.text = UserInfo.aBand
		end
		
	local cell3 = display.newRect(display.contentWidth/2, 180, 150, 30)
		local advisingText4 = display.newText("Advising", display.contentWidth/2, 180, nil, 16)
		if(UserInfo.advising ~= "")then
			advisingText4.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 230, 150, 30)
		local breakText4 = display.newText("Break", display.contentWidth/2, 230, nil, 16)
		if(UserInfo.myBreak ~= "")then
			breakText4.text = UserInfo.myBreak
		end
	
	local cell5 = display.newRect(display.contentWidth/2, 280, 150, 30)
		local gBandText4 = display.newText("G Band", display.contentWidth/2, 280, nil, 16)
		if(UserInfo.gBand ~= "")then
			gBandText4.text = UserInfo.gBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 330, 150, 30)
		local cBandText4 = display.newText("C Band", display.contentWidth/2, 330, nil, 16)
		if(UserInfo.cBand ~= "")then
			cBandText4.text = UserInfo.cBand
		end

	local cell7 = display.newRect(display.contentWidth/2, 380, 150, 30)
		local lunchText4 = display.newText("Lunch", display.contentWidth/2, 380, nil, 16)
		if(UserInfo.lunch ~= "")then
			lunchText4.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 430, 150, 30)
		local communityText4 = display.newText("Community", display.contentWidth/2, 430, nil, 16)
		if(UserInfo.community ~= "")then
			communityText4.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 480, 150, 30)
		local eBandText4 = display.newText("E Band", display.contentWidth/2, 480, nil, 16)
		if(UserInfo.eBand ~= "")then
			eBandText4.text = UserInfo.eBand
		end
	
	cell.strokeWidth = 2
	cell:setStrokeColor(0,0,0)
	cellText:setFillColor(0.6,0,0)
	cell1.strokeWidth = 2
	cell1:setStrokeColor(0,0,0)
	dBandText4:setFillColor(0.6,0,0)
	cell2.strokeWidth = 2
	cell2:setStrokeColor(0,0,0)
	aBandText4:setFillColor(0.6,0,0)
	cell3.strokeWidth = 2
	cell3:setStrokeColor(0,0,0)
	advisingText4:setFillColor(0.6,0,0)
	cell4.strokeWidth = 2
	cell4:setStrokeColor(0,0,0)
	breakText4:setFillColor(0.6,0,0)
	cell5.strokeWidth = 2
	cell5:setStrokeColor(0,0,0)
	cBandText4:setFillColor(0.6,0,0)
	cell6.strokeWidth = 2
	cell6:setStrokeColor(0,0,0)
	gBandText4:setFillColor(0.6,0,0)
	cell7.strokeWidth = 2
	cell7:setStrokeColor(0,0,0)
	lunchText4:setFillColor(0.6,0,0)
	cell8.strokeWidth = 2
	cell8:setStrokeColor(0,0,0)
	communityText4:setFillColor(0.6,0,0)
	cell9.strokeWidth = 2
	cell9:setStrokeColor(0,0,0)
	eBandText4:setFillColor(0.6,0,0)
	
	dayGroup4:insert(background)
	dayGroup4:insert(temp)
	dayGroup4:insert(home)
	dayGroup4:insert(cell)
	dayGroup4:insert(cell1)
	dayGroup4:insert(cell2)
	dayGroup4:insert(cell3)
	dayGroup4:insert(cell4)
	dayGroup4:insert(cell5)
	dayGroup4:insert(cell6)
	dayGroup4:insert(cell7)
	dayGroup4:insert(cell8)
	dayGroup4:insert(cell9)
	dayGroup4:insert(cellText)
	dayGroup4:insert(dBandText4)
	dayGroup4:insert(aBandText4)
	dayGroup4:insert(advisingText4)
	dayGroup4:insert(breakText4)
	dayGroup4:insert(cBandText4)
	dayGroup4:insert(gBandText4)
	dayGroup4:insert(lunchText4)
	dayGroup4:insert(communityText4)
	dayGroup4:insert(eBandText4)
	
	local function dBandTouch(event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("dBand", {effect = "slideLeft", time = 300})
	end
	
	local function aBandTouch (event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("aBand", {effect = "slideLeft", time = 300})
	end
	
	local function advisingTouch(event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("advising", {effect = "slideLeft", time = 300})
	end
	
	local function breakTouch(event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("break", {effect = "slideLeft", time = 300})
	end
	
	local function cBandTouch(event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("cBand", {effect = "slideLeft", time = 300})
	end
	
	local function gBandTouch(event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("gBand", {effect = "slideLeft", time = 300})
	end
	
	local function lunchTouch(event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("lunch", {effect = "slideLeft", time = 300})
	end
	
	local function communityTouch(event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("community", {effect = "slideLeft", time = 300})
	end
	
	local function eBandTouch(event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("eBand", {effect = "slideLeft", time = 300})
	end
	
	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	function homeButton(event)
		dayGroup4.alpha=0
		dayGroup4:removeSelf()
		dayGroup4=nil
		composer.gotoScene("HomeScreen", {effect = "slideRight", time = 300})
	end
	
	home:addEventListener("tap", homeButton)
	cell1:addEventListener("tap", dBandTouch)
	cell2:addEventListener("tap", aBandTouch)
	cell3:addEventListener("tap", advisingTouch)
	cell4:addEventListener("tap", breakTouch)
	cell5:addEventListener("tap", gBandTouch)
	cell6:addEventListener("tap", cBandTouch)
	cell7:addEventListener("tap", lunchTouch)
	cell8:addEventListener("tap", communityTouch)
	cell9:addEventListener("tap", eBandTouch)
end


function scene:hide (event)

end

function scene:show (event)

end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene