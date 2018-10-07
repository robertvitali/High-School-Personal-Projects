-----------------------------------------------------------------------------------------
--
-- Home Screen
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
local scene = composer.newScene()
local ads = require( "ads" )

appID = "ca-app-pub-4668108448526393/9871797869"
if ( system.getInfo( "platformName" ) == "Android" ) then
    appID = "ca-app-pub-4668108448526393/3685663463"
end



function scene:create (event)
	homeScreenGroup = self.view

	local textSize = 60

	--SET UP BACKRGROUND RECTANGLE SO THAT COLOR CAN BE CHANGED EASILY
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
		background:setFillColor(0.4196, 0.7373, 0.27)


	button1 = display.newRoundedRect(display.contentWidth/2, display.contentHeight/2 - display.contentHeight/5, display.contentWidth - 10, display.contentHeight/4, 250)
	--button1 = display.newRect(display.contentWidth/2, display.contentHeight/2 - 100, 240, 110)
	--button1:setStrokeColor(.6,0,0)
	button1Text = display.newText("Encrypt Message", button1.x, button1.y, nil, textSize)
	button1Text:setFillColor(0,0,0)
	
	
	button2 = display.newRoundedRect(display.contentWidth/2, display.contentHeight/2 + display.contentHeight/5, display.contentWidth - 10, display.contentHeight/4, 250)
	button2Text = display.newText("Decrypt Message", button2.x, button2.y, nil, textSize)
	button2Text:setFillColor(0,0,0)
	


	--[[infoButton = display.newRect(display.contentWidth - 40, 0, 60,30)
	infoButtonText = display.newText("More", infoButton.x, infoButton.y, nil, 15)
	infoButtonText:setFillColor(0,0,0)]]



	ads.init( "admob", appID, adListener )

	ads.show( "banner", { x=0, y=display.contentHeight + 50, appID } )

	if ( system.getInfo( "platformName" ) == "Android" ) then
    	ads.show( "banner", { x=0, y=display.contentHeight - 50, appID } )
	end


	--for ipad
	if ( string.sub( system.getInfo("model"), 1, 4 ) == "iPad" ) then
		ads.show( "banner", { x = -40, y=display.contentHeight + 50, appID } )
	end
	--for ipad

	homeScreenGroup:insert(background)
	homeScreenGroup:insert(button1)
	homeScreenGroup:insert(button1Text)
	homeScreenGroup:insert(button2)
	homeScreenGroup:insert(button2Text)
	--homeScreenGroup:insert(infoButton)
	--homeScreenGroup:insert(infoButtonText)	
end

local function ButtonTap1 (event)
	composer.gotoScene("Encrypt")
	--ads.hide()
end

local function ButtonTap2 (event)
	composer.gotoScene("Decrypt")
	--ads.hide()
end

local function infoButtonTap (event)
	composer.gotoScene("infoButton")
	ads.hide()
end

function scene:show(event)
	button1:addEventListener("tap", ButtonTap1)
	button2:addEventListener("tap", ButtonTap2)
	--infoButton:addEventListener("tap", infoButtonTap)
end


function scene:hide(event)
	button1:addEventListener("tap", ButtonTap1)
	button2:addEventListener("tap", ButtonTap2)
	--infoButton:addEventListener("tap", infoButtonTap)
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene