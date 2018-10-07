-----------------------------------------------------------------------------------------
--
-- Home Screen
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
local widget = require "widget"
local json = require "json"
local scene = composer.newScene()
local pasteboard = require ("plugin.pasteboard")



function scene:create (event)
	local dayGroup1 = self.view
	
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
	home.y = -10




	--SET UP BACKRGROUND RECTANGLE SO THAT COLOR CAN BE CHANGED EASILY
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(0.215, 0.67, 0.270)

	local storeButton = display.newRoundedRect(display.contentWidth/2, display.contentHeight - 25, display.contentWidth - 40, display.contentHeight/4, 250)
	local storeButtonText = display.newText("Coming Soon", storeButton.x, storeButton.y, nil, 30)
		storeButtonText:setFillColor(0,0,0)
	local text = display.newText("EncryptMee+", display.contentWidth/2, display.contentHeight/9, native.systemFont, 40)
		text:setFillColor(1,1,1)
	local text2 = native.newTextBox(display.contentWidth/2, display.contentHeight/2, display.contentWidth - 40, display.contentHeight/2)
		text2.isEditable = false
		text2:setTextColor(0,0,0)
		text2.text = "Benefits of Upgrading to EncryptMee+:\n - No Ads\n - 3D Touch Support\n - Share button in encryption frame\n - Password protected\n - Create custom algorithms for individual contacts\n - Different cyphers besides polyalphabetic cyphers\n - Cyphers are longer and more complex"
	
	dayGroup1:insert(background)
	dayGroup1:insert(home)
	dayGroup1:insert(storeButton)
	dayGroup1:insert(storeButtonText)
	dayGroup1:insert(text)
	dayGroup1:insert(text2)


	--THIS BUTTON TO GO BACK TO THE HOME PAGE
	local function homeButton(event)
		dayGroup1.alpha=0
		dayGroup1:removeSelf()
		dayGroup1=nil
		composer.gotoScene("HomeScreen")
	end

	home:addEventListener("tap", homeButton)	
	end

	function scene:show(event)
	
	end


	function scene:hide(event)
		
	end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene