local composer = require "composer"
local widget = require "widget"
local scene = composer.newScene()

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
		local cBandText3 = display.newText("C Band", display.contentWidth/2, 80, nil, 16)
		if(UserInfo.cBand ~= "")then
			cBandText3.text = UserInfo.cBand
		end
		
	local cell2 = display.newRect(display.contentWidth/2, 130, 150, 30)
		local fBandText3 = display.newText("F Band", display.contentWidth/2, 130, nil, 16)
		if(UserInfo.fBand ~= "")then
			fBandText3.text = UserInfo.fBand
		end
		
	local cell3 = display.newRect(display.contentWidth/2, 180, 150, 30)
		local advisingText3 = display.newText("Advising", display.contentWidth/2, 180, nil, 16)
		if(UserInfo.advising ~= "")then
			advisingText3.text = UserInfo.advising
		end
		
	local cell4 = display.newRect(display.contentWidth/2, 230, 150, 30)
		local breakText3 = display.newText("Break", display.contentWidth/2, 230, nil, 16)
		if(UserInfo.myBreak ~= "")then
			breakText3.text = UserInfo.myBreak
		end
		
	local cell5 = display.newRect(display.contentWidth/2, 280, 150, 30)
		local eBandText3 = display.newText("E Band", display.contentWidth/2, 280, nil, 16)
		if(UserInfo.eBand ~= "")then
			eBandText3.text = UserInfo.eBand
		end

	local cell6 = display.newRect(display.contentWidth/2, 330, 150, 30)
		local bBandText3 = display.newText("B Band", display.contentWidth/2, 330, nil, 16)
		if(UserInfo.bBand ~= "")then
			bBandText3.text = UserInfo.bBand
		end
		
	local cell7 = display.newRect(display.contentWidth/2, 380, 150, 30)
		local lunchText3 = display.newText("Lunch", display.contentWidth/2, 380, nil, 16)
		if(UserInfo.lunch ~= "")then
			lunchText3.text = UserInfo.lunch
		end
		
	local cell8 = display.newRect(display.contentWidth/2, 430, 150, 30)
		local communityText3 = display.newText("Community", display.contentWidth/2, 430, nil, 16)
		if(UserInfo.community ~= "")then
			communityText3.text = UserInfo.community
		end
		
	local cell9 = display.newRect(display.contentWidth/2, 480, 150, 30)
		local dBandText3 = display.newText("D Band", display.contentWidth/2, 480, nil, 16)
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
	dayGroup3:insert(fBandText3)
	dayGroup3:insert(advisingText3)
	dayGroup3:insert(breakText3)
	dayGroup3:insert(bBandText3)
	dayGroup3:insert(eBandText3)
	dayGroup3:insert(lunchText3)
	dayGroup3:insert(communityText3)
	dayGroup3:insert(dBandText3)

	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	function homeButton(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("HomeScreen", {effect = "slideRight", time = 300})
	end
	
	local function cBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("cBand", {effect = "slideLeft", time = 300})
	end
	
	local function fBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("fBand", {effect = "slideLeft", time = 300})
	end
	
	local function advisingTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("advising", {effect = "slideLeft", time = 300})
	end
	
	local function breakTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("break", {effect = "slideLeft", time = 300})
	end
	
	local function bBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("bBand", {effect = "slideLeft", time = 300})
	end
	
	local function eBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("eBand", {effect = "slideLeft", time = 300})
	end
	
	local function lunchTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("lunch", {effect = "slideLeft", time = 300})
	end
	
	local function communityTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("community", {effect = "slideLeft", time = 300})
	end
	
	local function dBandTouch(event)
		dayGroup3.alpha=0
		dayGroup3:removeSelf()
		dayGroup3=nil
		composer.gotoScene("dBand", {effect = "slideLeft", time = 300})
	end
	
	home:addEventListener("tap", homeButton)
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