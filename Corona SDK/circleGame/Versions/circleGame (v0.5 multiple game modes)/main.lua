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
   UserInfo.highScoreFP1=0
   UserInfo.highScoreFP2=0
   UserInfo.highScoreFP3=0
   UserInfo.highScoreTT1=0
   UserInfo.highScoreTT2=0
   UserInfo.highScoreTT3=0
   UserInfo.highScoreEP1=0
   UserInfo.highScoreEP2=0
   UserInfo.highScoreEP3=0

   


--Does the user have previous info stored?
path = system.pathForFile( "userstuff", system.DocumentsDirectory )
myFile = io.open(path, "r") 

-- Load user registration information

if myFile then
  io.close(myFile)
  UserInfo = table.load("userstuff")
end


composer.gotoScene("startScreen", {effect = "zoomInOutFade", time = 380})