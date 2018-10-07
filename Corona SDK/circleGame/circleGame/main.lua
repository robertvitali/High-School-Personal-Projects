-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")
local composer = require "composer"




require("extensions.table")


_G.dataLocal={}  -- intialize a global variable to hold User schedule
   dataLocal.highScoreFP1=0
   dataLocal.highScoreFP2=0
   dataLocal.highScoreFP3=0
   dataLocal.highScoreTT1=0
   dataLocal.highScoreTT2=0
   dataLocal.highScoreTT3=0
   dataLocal.highScoreEP1=0
   dataLocal.highScoreEP2=0
   dataLocal.highScoreEP3=0
   dataLocal.highScoreFPU1=""
   dataLocal.highScoreFPU2=""
   dataLocal.highScoreFPU3=""
   dataLocal.highScoreEPU1=""
   dataLocal.highScoreEPU2=""
   dataLocal.highScoreEPU3=""
   dataLocal.highScoreTTU1=""
   dataLocal.highScoreTTU2=""
   dataLocal.highScoreTTU3=""


   


--Does the user have previous info stored?
path = system.pathForFile( "userstuff1", system.DocumentsDirectory )
myFile = io.open(path, "r") 

-- Load user registration information

if myFile then
  io.close(myFile)
  dataLocal = table.load("userstuff1")
end


composer.gotoScene("startScreen", {effect = "zoomInOutFade", time = 380})