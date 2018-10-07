local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()

--THIS SETS UP THE DIFFERENT CELLS TO PLACE PERIODS IN
--TEXT BOXES?
function scene:create (event)
	local dayGroup2 = self.view
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(.6,0,0)
	local temp = display.newText("Day 2", display.contentWidth/2, 0, native.systemFont, 20)
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
	
	local cell = display.newRect(display.contentWidth/2, 30, 150, 30)
		local cellText = display.newText("PO", display.contentWidth/2, 30, nil, 16)
		
	local cell1 = display.newRect(display.contentWidth/2, 80, 150, 30)
		local bBandText2 = display.newText("B Band", display.contentWidth/2, 80, nil, 16)
		if(UserInfo.bBand ~= "")then
			bBandText2.text = UserInfo.bBand
		end
		
	local cell2 = display.newRect(display.contentWidth/2, 130, 150, 30)
		local eBandText2 = display.newText("E Band", display.contentWidth/2, 130, nil, 16)
		if(UserInfo.eBand ~= "")then
			eBandText2.text = UserInfo.eBand
		end
		
	local cell3 = display.newRect(display.contentWidth/2, 180, 150, 30)
		local advisingText2 = display.newText("Advising", display.contentWidth/2, 180, nil, 16)
		if(UserInfo.advising ~= "")then
			advisingText2.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 230, 150, 30)
		local breakText2 = display.newText("Break", display.contentWidth/2, 230, nil, 16)
		if(UserInfo.myBreak ~= "")then
			breakText2.text = UserInfo.myBreak
		end
		
	local cell5 = display.newRect(display.contentWidth/2, 280, 150, 30)
		local gBandText2 = display.newText("G Band", display.contentWidth/2, 280, nil, 16)
		if(UserInfo.gBand ~= "")then
			gBandText2.text = UserInfo.gBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 330, 150, 30)
		local fBandText2 = display.newText("F Band", display.contentWidth/2, 330, nil, 16)
		if(UserInfo.fBand ~= "")then
			fBandText2.text = UserInfo.fBand
		end
		
	local cell7 = display.newRect(display.contentWidth/2, 380, 150, 30)
		local lunchText2 = display.newText("Lunch", display.contentWidth/2, 380, nil, 16)
		if(UserInfo.lunch ~= "")then
			lunchText2.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 430, 150, 30)
		local communityText2 = display.newText("Community", display.contentWidth/2, 430, nil, 16)
		if(UserInfo.community ~= "")then
			communityText2.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 480, 150, 30)
		local cBandText2 = display.newText("C Band", display.contentWidth/2, 480, nil, 16)
		if(UserInfo.cBand ~= "")then
			cBandText2.text = UserInfo.cBand
		end
	
	cell.strokeWidth = 2
	cell:setStrokeColor(0,0,0)
	cellText:setFillColor(0.6,0,0)
	cell1.strokeWidth = 2
	cell1:setStrokeColor(0,0,0)
	bBandText2:setFillColor(0.6,0,0)
	cell2.strokeWidth = 2
	cell2:setStrokeColor(0,0,0)
	eBandText2:setFillColor(0.6,0,0)
	cell3.strokeWidth = 2
	cell3:setStrokeColor(0,0,0)
	advisingText2:setFillColor(0.6,0,0)
	cell4.strokeWidth = 2
	cell4:setStrokeColor(0,0,0)
	breakText2:setFillColor(0.6,0,0)
	cell5.strokeWidth = 2
	cell5:setStrokeColor(0,0,0)
	fBandText2:setFillColor(0.6,0,0)
	cell6.strokeWidth = 2
	cell6:setStrokeColor(0,0,0)
	gBandText2:setFillColor(0.6,0,0)
	cell7.strokeWidth = 2
	cell7:setStrokeColor(0,0,0)
	lunchText2:setFillColor(0.6,0,0)
	cell8.strokeWidth = 2
	cell8:setStrokeColor(0,0,0)
	communityText2:setFillColor(0.6,0,0)
	cell9.strokeWidth = 2
	cell9:setStrokeColor(0,0,0)
	cBandText2:setFillColor(0.6,0,0)
	
	dayGroup2:insert(background)
	dayGroup2:insert(temp)
	dayGroup2:insert(home)
	dayGroup2:insert(cell)
	dayGroup2:insert(cell1)
	dayGroup2:insert(cell2)
	dayGroup2:insert(cell3)
	dayGroup2:insert(cell4)
	dayGroup2:insert(cell5)
	dayGroup2:insert(cell6)
	dayGroup2:insert(cell7)
	dayGroup2:insert(cell8)
	dayGroup2:insert(cell9)
	dayGroup2:insert(cellText)
	dayGroup2:insert(bBandText2)
	dayGroup2:insert(eBandText2)
	dayGroup2:insert(advisingText2)
	dayGroup2:insert(breakText2)
	dayGroup2:insert(fBandText2)
	dayGroup2:insert(gBandText2)
	dayGroup2:insert(lunchText2)
	dayGroup2:insert(communityText2)
	dayGroup2:insert(cBandText2)

	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	function homeButton(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("HomeScreen", {effect = "slideRight", time = 300})
	end
	
	local function bBandTouch(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("bBand", {effect = "slideLeft", time = 300})
	end
	
	local function eBandTouch(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("eBand", {effect = "slideLeft", time = 300})
	end
	
	local function advisingTouch(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("advising", {effect = "slideLeft", time = 300})
	end
	
	local function breakTouch(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("break", {effect = "slideLeft", time = 300})
	end
	
	local function fBandTouch(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("fBand", {effect = "slideLeft", time = 300})
	end
	
	local function gBandTouch(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("gBand", {effect = "slideLeft", time = 300})
	end
	
	local function lunchTouch(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("lunch", {effect = "slideLeft", time = 300})
	end
	
	local function communityTouch(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("community", {effect = "slideLeft", time = 300})
	end
	
	local function cBandTouch(event)
		dayGroup2.alpha=0
		dayGroup2:removeSelf()
		dayGroup2=nil
		composer.gotoScene("cBand", {effect = "slideLeft", time = 300})
	end

	
		home:addEventListener("tap", homeButton)
		cell1:addEventListener("tap", bBandTouch)
		cell2:addEventListener("tap", eBandTouch)
		cell3:addEventListener("tap", advisingTouch)
		cell4:addEventListener("tap", breakTouch)
		cell5:addEventListener("tap", gBandTouch)
		cell6:addEventListener("tap", fBandTouch)
		cell7:addEventListener("tap", lunchTouch)
		cell8:addEventListener("tap", communityTouch)
		cell9:addEventListener("tap", cBandTouch)
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
1)MAKE THE BACKGROUND COLOR MAROON (.6,0,0)
2)MAKE THE TEXT COLOR MAROON
3)ADD ALL OF THE BAND PAGES
]]