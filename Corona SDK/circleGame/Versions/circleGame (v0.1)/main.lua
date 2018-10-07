-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")
local composer = require "composer"




require("extensions.table")


_G.UserInfo={}  -- intialize a global variable to hold User schedule
   UserInfo.highScore1=0
   UserInfo.highScore2=0
   UserInfo.highScore3=0
   


--Does the user have previous info stored?
path = system.pathForFile( "userstuff", system.DocumentsDirectory )
myFile = io.open(path, "r") 

-- Load user registration information

if myFile then
  io.close(myFile)
  UserInfo = table.load("userstuff")
end


composer.gotoScene("gamePlay", {effect = "zoomInOutFade", time = 380})