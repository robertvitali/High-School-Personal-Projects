local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"
local pasteboard = require ("plugin.pasteboard")
require("extensions.table")


function scene:create (event)
	historyGroup = self.view

	--fixes issues with buttons showing weird on android version
	widget.setTheme( "widget_theme_ios7" )

	--SET UP BACKRGROUND RECTANGLE AND COLOR SO THAT 
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(89/255,89/255,89/255)

	--Top Bar
	local whiteBar2 = display.newRect(display.contentWidth/2, display.contentHeight/7, display.contentWidth, display.contentHeight/8)
		whiteBar2.y = whiteBar.height/2
		whiteBar2:setFillColor(1,1,1)

	local clear = display.newText("Clear", 6*display.contentWidth/7, whiteBar2.y + 2, native.systemFontBold, display.contentHeight/40)
		clear:setFillColor(0,0,0)
	--BACK BUTTON
	back = widget.newButton
	{
	left = 0,
	top = -30,
	width = 120,
	height = 40,
	id = "back",
	label = "<",
	labelColor = {default = {0,0,0}, over = {0,0,0}},
	fontSize = display.contentHeight/18,
	emboss = true
	}
	back.y = whiteBar2.y
	
	--TITLE ABOVE TEXT BOX
	local notesText = display.newText("History", display.contentWidth/2, whiteBar2.y, native.systemFontBold, display.contentHeight/25)
		notesText:setFillColor(0,0,0)

	local button1 = display.newRoundedRect(display.contentWidth/2, whiteBar2.y, 3.8*display.contentWidth/4, display.contentHeight/7.5, display.contentHeight/2)
		button1.y = whiteBar2.y + 1.03*button1.height
		local symbolText1 = display.newText("No Data", display.contentWidth/4, button1.y, native.systemFontBold, display.contentHeight/20)
		symbolText1:setFillColor(0,0,0)
		local massText1 = display.newText("No Data", 3*display.contentWidth/4 - 10, button1.y, native.systemFontBold, display.contentHeight/28)
		massText1:setFillColor(0,0,0)

	local button2 = display.newRoundedRect(display.contentWidth/2, 2.2*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, display.contentHeight/2)
		button2.y = button1.y + 1.08*button2.height
		local symbolText2 = display.newText("No Data", display.contentWidth/4, button2.y, native.systemFontBold, display.contentHeight/20)
		symbolText2:setFillColor(0,0,0)
		local massText2= display.newText("No Data", 3*display.contentWidth/4 - 10, button2.y, native.systemFontBold, display.contentHeight/28)
		massText2:setFillColor(0,0,0)

	local button3 = display.newRoundedRect(display.contentWidth/2, 3.4*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, display.contentHeight/2)
		button3.y = button2.y + 1.08*button3.height
		local symbolText3 = display.newText("No Data", display.contentWidth/4, button3.y, native.systemFontBold, display.contentHeight/20)
		symbolText3:setFillColor(0,0,0)
		local massText3= display.newText("No Data", 3*display.contentWidth/4 - 10, button3.y, native.systemFontBold, display.contentHeight/28)
		massText3:setFillColor(0,0,0)

	local button4 = display.newRoundedRect(display.contentWidth/2, 4.6*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, display.contentHeight/2)
		button4.y = button3.y + 1.08*button4.height
		local symbolText4 = display.newText("No Data", display.contentWidth/4, button4.y, native.systemFontBold, display.contentHeight/20)
		symbolText4:setFillColor(0,0,0)
		local massText4= display.newText("No Data", 3*display.contentWidth/4 - 10, button4.y, native.systemFontBold, display.contentHeight/28)
		massText4:setFillColor(0,0,0)

	local button5 = display.newRoundedRect(display.contentWidth/2, 5.8*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, display.contentHeight/2)
		button5.y = button4.y + 1.08*button5.height
		local symbolText5 = display.newText("No Data", display.contentWidth/4, button5.y, native.systemFontBold, display.contentHeight/20)
		symbolText5:setFillColor(0,0,0)
		local massText5= display.newText("No Data", 3*display.contentWidth/4 - 10, button5.y, native.systemFontBold, display.contentHeight/28)
		massText5:setFillColor(0,0,0)

	local button6 = display.newRoundedRect(display.contentWidth/2, 7*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, display.contentHeight/2)
		button6.y = button5.y + 1.08*button6.height
		local symbolText6 = display.newText("No Data", display.contentWidth/4, button6.y, native.systemFontBold, display.contentHeight/20)
		symbolText6:setFillColor(0,0,0)
		local massText6= display.newText("No Data", 3*display.contentWidth/4 - 10, button6.y, native.systemFontBold, display.contentHeight/28)
		massText6:setFillColor(0,0,0)

	if(localData.symbol1 ~= "")then
		symbolText1.text = localData.symbol1
		massText1.text = tostring(localData.mass1).." g/mol"
	else
		button1.alpha = 0
		symbolText1.alpha = 0
		massText1.alpha = 0
	end

	if(localData.symbol2 ~= "")then
		symbolText2.text = localData.symbol2
		massText2.text = tostring(localData.mass2).." g/mol"
	else
		button2.alpha = 0
		symbolText2.alpha = 0
		massText2.alpha = 0
	end

	if(localData.symbol3 ~= "")then
		symbolText3.text = localData.symbol3
		massText3.text = tostring(localData.mass3).." g/mol"
	else
		button3.alpha = 0
		symbolText3.alpha = 0
		massText3.alpha = 0
	end

	if(localData.symbol4 ~= "")then
		symbolText4.text = localData.symbol4
		massText4.text = tostring(localData.mass4).." g/mol"
	else
		button4.alpha = 0
		symbolText4.alpha = 0
		massText4.alpha = 0
	end

	if(localData.symbol5 ~= "")then
		symbolText5.text = localData.symbol5
		massText5.text = tostring(localData.mass5).." g/mol"
	else
		button5.alpha = 0
		symbolText5.alpha = 0
		massText5.alpha = 0
	end

	if(localData.symbol6 ~= "")then
		symbolText6.text = localData.symbol6
		massText6.text = tostring(localData.mass6).." g/mol"
	else
		button6.alpha = 0
		symbolText6.alpha = 0
		massText6.alpha = 0
	end

	--INSERTING EACH ELEMENT OF THE PAGE INTO THE GROUP TO MAKE REMOVAL EASIER
	historyGroup:insert(background)
	historyGroup:insert(whiteBar2)
	historyGroup:insert(back)
	historyGroup:insert(notesText)
	historyGroup:insert(button1)
	historyGroup:insert(button2)
	historyGroup:insert(button3)
	historyGroup:insert(button4)
	historyGroup:insert(button5)
	historyGroup:insert(button6)
	historyGroup:insert(symbolText1)
	historyGroup:insert(massText1)
	historyGroup:insert(symbolText2)
	historyGroup:insert(massText2)
	historyGroup:insert(symbolText3)
	historyGroup:insert(massText3)
	historyGroup:insert(symbolText4)
	historyGroup:insert(massText4)
	historyGroup:insert(symbolText5)
	historyGroup:insert(massText5)
	historyGroup:insert(symbolText6)
	historyGroup:insert(massText6)
	historyGroup:insert(clear)
	


	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function backButton(event)
		historyGroup:removeSelf()
		composer.gotoScene("HomeScreen")
		timer.pause(timer1)
	end
	back:addEventListener("tap", backButton)

	local function copyButton1(event)
		massString1 = tostring(localData.mass1)
		pasteboard.copy("string", massString1)
	end
	button1:addEventListener("tap", copyButton1)

	local function copyButton2(event)
		massString2 = tostring(localData.mass2)
		pasteboard.copy("string", massString2)
	end
	button2:addEventListener("tap", copyButton2)

	local function copyButton3(event)
		massString3 = tostring(localData.mass3)
		pasteboard.copy("string", massString3)
	end
	button3:addEventListener("tap", copyButton3)

	local function copyButton4(event)
		massString4 = tostring(localData.mass4)
		pasteboard.copy("string", massString4)
	end
	button4:addEventListener("tap", copyButton4)

	local function copyButton5(event)
		massString5 = tostring(localData.mass5)
		pasteboard.copy("string", massString5)
	end
	button5:addEventListener("tap", copyButton5)

	local function copyButton6(event)
		massString6 = tostring(localData.mass6)
		pasteboard.copy("string", massString6)
	end
	button6:addEventListener("tap", copyButton6)

	local function clearFunction(event)
		localData.symbol1 = ""
		localData.mass1 = 0
		localData.symbol2 = ""
		localData.mass2 = 0
		localData.symbol3 = ""
		localData.mass3 = 0
		localData.symbol4 = ""
		localData.mass4 = 0
		localData.symbol5 = ""
		localData.mass5 = 0
		localData.symbol6 = ""
		localData.mass6 = 0
		composer.gotoScene("HomeScreen")
	end
	clear:addEventListener("tap", clearFunction)


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
