local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()

--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
--TEXT BOXES?
function scene:create (event)
	local dayGroup7 = self.view
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
	local temp = display.newText("Day 7", display.contentWidth/2, 0, native.systemFont, 20)
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
		local cellText = display.newText("PO", display.contentWidth/2, 30, nil, 16)
		
	local cell1 = display.newRect(display.contentWidth/2, 80, 150, 30)
		local gBandText7 = display.newText("G Band", display.contentWidth/2, 80, nil, 16)
		if(UserInfo.gBand ~= "")then
			gBandText7.text = UserInfo.gBand
		end
		
 	local cell2 = display.newRect(display.contentWidth/2, 130, 150, 30)
		local fBandText7 = display.newText("F Band", display.contentWidth/2, 130, nil, 16)
		if(UserInfo.fBand ~= "")then
			fBandText7.text = UserInfo.fBand
		end
		
	local cell3 = display.newRect(display.contentWidth/2, 180, 150, 30)
		local advisingText7 = display.newText("Advising", display.contentWidth/2, 180, nil, 16)
		if(UserInfo.advising ~= "")then
			advisingText7.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 230, 150, 30)
		local breakText7 = display.newText("Break", display.contentWidth/2, 230, nil, 16)
		if(UserInfo.myBreak ~= "")then
			breakText7.text = UserInfo.myBreak
		end

	local cell5 = display.newRect(display.contentWidth/2, 280, 150, 30)
		local eBandText7 = display.newText("E Band", display.contentWidth/2, 280, nil, 16)
		if(UserInfo.eBand ~= "")then
			eBandText7.text = UserInfo.eBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 330, 150, 30)
		local bBandText7 = display.newText("B Band", display.contentWidth/2, 330, nil, 16)
		if(UserInfo.bBand ~= "")then
			bBandText7.text = UserInfo.bBand
		end
		
	local cell7 = display.newRect(display.contentWidth/2, 380, 150, 30)
		local lunchText7 = display.newText("Lunch", display.contentWidth/2, 380, nil, 16)
		if(UserInfo.lunch ~= "")then
			lunchText7.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 430, 150, 30)
		local communityText7 = display.newText("Community", display.contentWidth/2, 430, nil, 16)
		if(UserInfo.community ~= "")then
			communityText7.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 480, 150, 30)
		local aBandText7 = display.newText("A Band", display.contentWidth/2, 480, nil, 16)
		if(UserInfo.aBand ~= "")then
			aBandText7.text = UserInfo.aBand
		end
	
	cell.strokeWidth = 2
	cell:setStrokeColor(0,0,0)
	cellText:setFillColor(0.6,0,0)
	cell1.strokeWidth = 2
	cell1:setStrokeColor(0,0,0)
	gBandText7:setFillColor(0.6,0,0)
	cell2.strokeWidth = 2
	cell2:setStrokeColor(0,0,0)
	fBandText7:setFillColor(0.6,0,0)
	cell3.strokeWidth = 2
	cell3:setStrokeColor(0,0,0)
	advisingText7:setFillColor(0.6,0,0)
	cell4.strokeWidth = 2
	cell4:setStrokeColor(0,0,0)
	breakText7:setFillColor(0.6,0,0)
	cell5.strokeWidth = 2
	cell5:setStrokeColor(0,0,0)
	bBandText7:setFillColor(0.6,0,0)
	cell6.strokeWidth = 2
	cell6:setStrokeColor(0,0,0)
	eBandText7:setFillColor(0.6,0,0)
	cell7.strokeWidth = 2
	cell7:setStrokeColor(0,0,0)
	lunchText7:setFillColor(0.6,0,0)
	cell8.strokeWidth = 2
	cell8:setStrokeColor(0,0,0)
	communityText7:setFillColor(0.6,0,0)
	cell9.strokeWidth = 2
	cell9:setStrokeColor(0,0,0)
	aBandText7:setFillColor(0.6,0,0)
	
	dayGroup7:insert(background)
	dayGroup7:insert(temp)
	dayGroup7:insert(home)
	dayGroup7:insert(cell)
	dayGroup7:insert(cell1)
	dayGroup7:insert(cell2)
	dayGroup7:insert(cell3)
	dayGroup7:insert(cell4)
	dayGroup7:insert(cell5)
	dayGroup7:insert(cell6)
	dayGroup7:insert(cell7)
	dayGroup7:insert(cell8)
	dayGroup7:insert(cell9)
	dayGroup7:insert(cellText)
	dayGroup7:insert(gBandText7)
	dayGroup7:insert(fBandText7)
	dayGroup7:insert(advisingText7)
	dayGroup7:insert(breakText7)
	dayGroup7:insert(bBandText7)
	dayGroup7:insert(eBandText7)
	dayGroup7:insert(lunchText7)
	dayGroup7:insert(communityText7)
	dayGroup7:insert(aBandText7)
--THIS BUTTON TO GO BACK TO THE HOME PAGE
	function homeButton(event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("HomeScreen", {effect = "slideRight", time = 100})
	end
	
	local function gBandTouch (event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("gBand", {effect = "slideLeft", time = 100})
	end
	
	local function fBandTouch(event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("fBand", {effect = "slideLeft", time = 100})
	end
	
	local function advisingTouch(event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("advising", {effect = "slideLeft", time = 100})
	end
	
	local function breakTouch(event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("break", {effect = "slideLeft", time = 100})
	end
	
	local function bBandTouch(event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("bBand", {effect = "slideLeft", time = 100})
	end
	
	local function eBandTouch(event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("eBand", {effect = "slideLeft", time = 100})
	end
	
	local function lunchTouch(event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("lunch", {effect = "slideLeft", time = 100})
	end
	
	local function communityTouch(event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("community", {effect = "slideLeft", time = 100})
	end
	
	local function aBandTouch(event)
		dayGroup7.alpha=0
		dayGroup7:removeSelf()
		dayGroup7=nil
		composer.gotoScene("aBand", {effect = "slideLeft", time = 100})
	end
	
	home:addEventListener("tap", homeButton)
	cell1:addEventListener("tap", gBandTouch)
	cell2:addEventListener("tap", fBandTouch)
	cell3:addEventListener("tap", advisingTouch)
	cell4:addEventListener("tap", breakTouch)
	cell5:addEventListener("tap", eBandTouch)
	cell6:addEventListener("tap", bBandTouch)
	cell7:addEventListener("tap", lunchTouch)
	cell8:addEventListener("tap", communityTouch)
	cell9:addEventListener("tap", aBandTouch)
end


function scene:hide (event)

end

function scene:show (event)

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene