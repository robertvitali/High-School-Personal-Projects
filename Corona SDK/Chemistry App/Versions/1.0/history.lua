local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"
local pasteboard = require ("plugin.pasteboard")
require("extensions.table")


local lastScene = composer.getSceneName("previous")

function scene:create (event)
	bBandGroup1 = self.view

	--fixes issues with buttons showing weird on android version
	widget.setTheme( "widget_theme_ios7" )

	--SET UP BACKRGROUND RECTANGLE AND COLOR SO THAT 
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
	--	background:setFillColor(154/255, 17/255, 49/255)
	--	background:setFillColor(25/255, 140/255, 191/255)
	background:setFillColor(89/255,89/255,89/255)

	--Top Bar
	local whiteBar2 = display.newRect(display.contentWidth/2, -28, display.contentWidth, display.contentHeight/6.65-20)
	whiteBar2:setFillColor(1,1,1)

	local clear = display.newText("Clear", 6*display.contentWidth/7, whiteBar2.y + 2, native.systemFontBold, 30)
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
	fontSize = 65,
	emboss = true
	}
	back.y = whiteBar2.y
	
	--TITLE ABOVE TEXT BOX
	local notesText = display.newText("History", display.contentWidth/2, whiteBar2.y, native.systemFontBold, 50)
	notesText:setFillColor(0,0,0)

--	local button1 = display.newRect(display.contentWidth/2, display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5)
	local button1 = display.newRoundedRect(display.contentWidth/2, display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, 1000)
		local symbolText1 = display.newText("No Data", display.contentWidth/4, button1.y, native.systemFontBold, 44)
		symbolText1:setFillColor(0,0,0)
		local massText1 = display.newText("No Data", 3*display.contentWidth/4 - 10, button1.y, native.systemFontBold, 35)
		massText1:setFillColor(0,0,0)
--	local button2 = display.newRect(display.contentWidth/2, 2.2*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5)
	local button2 = display.newRoundedRect(display.contentWidth/2, 2.2*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, 900)
		local symbolText2 = display.newText("No Data", display.contentWidth/4, button2.y, native.systemFontBold, 44)
		symbolText2:setFillColor(0,0,0)
		local massText2= display.newText("No Data", 3*display.contentWidth/4 - 10, button2.y, native.systemFontBold, 35)
		massText2:setFillColor(0,0,0)
--	local button3 = display.newRect(display.contentWidth/2, 3.4*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5)
	local button3 = display.newRoundedRect(display.contentWidth/2, 3.4*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, 800)
		local symbolText3 = display.newText("No Data", display.contentWidth/4, button3.y, native.systemFontBold, 44)
		symbolText3:setFillColor(0,0,0)
		local massText3= display.newText("No Data", 3*display.contentWidth/4 - 10, button3.y, native.systemFontBold, 35)
		massText3:setFillColor(0,0,0)
--	local button4 = display.newRect(display.contentWidth/2, 4.6*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5)
	local button4 = display.newRoundedRect(display.contentWidth/2, 4.6*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, 700)
		local symbolText4 = display.newText("No Data", display.contentWidth/4, button4.y, native.systemFontBold, 44)
		symbolText4:setFillColor(0,0,0)
		local massText4= display.newText("No Data", 3*display.contentWidth/4 - 10, button4.y, native.systemFontBold, 35)
		massText4:setFillColor(0,0,0)
--	local button5 = display.newRect(display.contentWidth/2, 5.8*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5)
	local button5 = display.newRoundedRect(display.contentWidth/2, 5.8*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, 600)
		local symbolText5 = display.newText("No Data", display.contentWidth/4, button5.y, native.systemFontBold, 44)
		symbolText5:setFillColor(0,0,0)
		local massText5= display.newText("No Data", 3*display.contentWidth/4 - 10, button5.y, native.systemFontBold, 35)
		massText5:setFillColor(0,0,0)
--	local button6 = display.newRect(display.contentWidth/2, 7*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5)
	local button6 = display.newRoundedRect(display.contentWidth/2, 7*display.contentHeight/7, 3.8*display.contentWidth/4, display.contentHeight/7.5, 500)
		local symbolText6 = display.newText("No Data", display.contentWidth/4, button6.y, native.systemFontBold, 44)
		symbolText6:setFillColor(0,0,0)
		local massText6= display.newText("No Data", 3*display.contentWidth/4 - 10, button6.y, native.systemFontBold, 35)
		massText6:setFillColor(0,0,0)

	if(UserInfo.symbol1 ~= "")then
		symbolText1.text = UserInfo.symbol1
		massText1.text = tostring(UserInfo.mass1).." g/mol"
	else
		button1.alpha = 0
		symbolText1.alpha = 0
		massText1.alpha = 0
	end

	if(UserInfo.symbol2 ~= "")then
		symbolText2.text = UserInfo.symbol2
		massText2.text = tostring(UserInfo.mass2).." g/mol"
	else
		button2.alpha = 0
		symbolText2.alpha = 0
		massText2.alpha = 0
	end

	if(UserInfo.symbol3 ~= "")then
		symbolText3.text = UserInfo.symbol3
		massText3.text = tostring(UserInfo.mass3).." g/mol"
	else
		button3.alpha = 0
		symbolText3.alpha = 0
		massText3.alpha = 0
	end

	if(UserInfo.symbol4 ~= "")then
		symbolText4.text = UserInfo.symbol4
		massText4.text = tostring(UserInfo.mass4).." g/mol"
	else
		button4.alpha = 0
		symbolText4.alpha = 0
		massText4.alpha = 0
	end

	if(UserInfo.symbol5 ~= "")then
		symbolText5.text = UserInfo.symbol5
		massText5.text = tostring(UserInfo.mass5).." g/mol"
	else
		button5.alpha = 0
		symbolText5.alpha = 0
		massText5.alpha = 0
	end

	if(UserInfo.symbol6 ~= "")then
		symbolText6.text = UserInfo.symbol6
		massText6.text = tostring(UserInfo.mass6).." g/mol"
	else
		button6.alpha = 0
		symbolText6.alpha = 0
		massText6.alpha = 0
	end

	--INSERTING EACH ELEMENT OF THE PAGE INTO THE GROUP TO MAKE REMOVAL EASIER
	bBandGroup1:insert(background)
	bBandGroup1:insert(whiteBar2)
	bBandGroup1:insert(back)
	bBandGroup1:insert(notesText)
	bBandGroup1:insert(button1)
	bBandGroup1:insert(button2)
	bBandGroup1:insert(button3)
	bBandGroup1:insert(button4)
	bBandGroup1:insert(button5)
	bBandGroup1:insert(button6)
	bBandGroup1:insert(symbolText1)
	bBandGroup1:insert(massText1)
	bBandGroup1:insert(symbolText2)
	bBandGroup1:insert(massText2)
	bBandGroup1:insert(symbolText3)
	bBandGroup1:insert(massText3)
	bBandGroup1:insert(symbolText4)
	bBandGroup1:insert(massText4)
	bBandGroup1:insert(symbolText5)
	bBandGroup1:insert(massText5)
	bBandGroup1:insert(symbolText6)
	bBandGroup1:insert(massText6)
	bBandGroup1:insert(clear)
	


	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function backButton(event)
		composer.gotoScene(lastScene)
		timer.pause(timer1)
	end
	back:addEventListener("tap", backButton)

	local function copyButton1(event)
		massString1 = tostring(UserInfo.mass1)
		pasteboard.copy("string", massString1)
	end
	button1:addEventListener("tap", copyButton1)

	local function copyButton2(event)
		massString2 = tostring(UserInfo.mass2)
		pasteboard.copy("string", massString2)
	end
	button2:addEventListener("tap", copyButton2)

	local function copyButton3(event)
		massString3 = tostring(UserInfo.mass3)
		pasteboard.copy("string", massString3)
	end
	button3:addEventListener("tap", copyButton3)

	local function copyButton4(event)
		massString4 = tostring(UserInfo.mass4)
		pasteboard.copy("string", massString4)
	end
	button4:addEventListener("tap", copyButton4)

	local function copyButton5(event)
		massString5 = tostring(UserInfo.mass5)
		pasteboard.copy("string", massString5)
	end
	button5:addEventListener("tap", copyButton5)

	local function copyButton6(event)
		massString6 = tostring(UserInfo.mass6)
		pasteboard.copy("string", massString6)
	end
	button6:addEventListener("tap", copyButton6)

	local function clearFunction(event)
		UserInfo.symbol1 = ""
		UserInfo.mass1 = 0
		UserInfo.symbol2 = ""
		UserInfo.mass2 = 0
		UserInfo.symbol3 = ""
		UserInfo.mass3 = 0
		UserInfo.symbol4 = ""
		UserInfo.mass4 = 0
		UserInfo.symbol5 = ""
		UserInfo.mass5 = 0
		UserInfo.symbol6 = ""
		UserInfo.mass6 = 0
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
