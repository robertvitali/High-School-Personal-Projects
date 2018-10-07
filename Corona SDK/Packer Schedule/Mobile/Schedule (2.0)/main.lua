--APP PRODUCED BY STORM ALEXANDER IN CONJUNCTION WITH SHAI ZACARAEV

display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
composer.recycleOnSceneChange = true

--local sceneGroup = display.newGroup()
require("extensions.table")
--[[
splashscreenbg = display.newRect(sceneGroup, display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
splashscreen = display.newImage(sceneGroup, "PackerSeal.png",0,0 );
splashscreen.x = display.contentWidth/2
splashscreen.y = display.contentHeight / 2
--splashText = display.newText(sceneGroup,"Scheduler", display.contentWidth/2, 400, nil, 24)
]]


_G.UserInfo={}  -- intialize a global variable to hold User schedule
   UserInfo.aBand =""
   UserInfo.bBand =""
   UserInfo.cBand = ""
   UserInfo.dBand=""
   UserInfo.eBand=""
   UserInfo.fBand=""
   UserInfo.gBand=""
   UserInfo.aBandHomework=""
   UserInfo.bBandHomework=""
   UserInfo.cBandHomework=""
   UserInfo.dBandHomework=""
   UserInfo.eBandHomework=""
   UserInfo.fBandHomework=""
   UserInfo.gBandHomework=""

   --all the different break peroids for 7 days
   UserInfo.myBreak =""
   UserInfo.myBreak2=""
   UserInfo.myBreak3=""
   UserInfo.myBreak4=""
   UserInfo.myBreak5=""
   UserInfo.myBreak6=""
   UserInfo.myBreak7=""
   UserInfo.breakTasks=""
   UserInfo.breakTasks2=""
   UserInfo.breakTasks3=""
   UserInfo.breakTasks4=""
   UserInfo.breakTasks5=""
   UserInfo.breakTasks6=""
   UserInfo.breakTasks7=""

   --all the different advising periods for 7 days
   UserInfo.advising = ""
   UserInfo.advising2=""
   UserInfo.advising3=""
   UserInfo.advising4=""
   UserInfo.advising5=""
   UserInfo.advising6=""
   UserInfo.advising7=""
   UserInfo.advisingTasks=""
   UserInfo.advisingTasks2=""
   UserInfo.advisingTasks3=""
   UserInfo.advisingTasks4=""
   UserInfo.advisingTasks5=""
   UserInfo.advisingTasks6=""
   UserInfo.advisingTasks7=""

   --all the different lunch bands for 7 days
   UserInfo.lunch = ""
   UserInfo.lunch2=""
   UserInfo.lunch3=""
   UserInfo.lunch4=""
   UserInfo.lunch5=""
   UserInfo.lunch6=""
   UserInfo.lunch7=""
   UserInfo.lunchTasks=""
   UserInfo.lunchTasks2=""
   UserInfo.lunchTasks3=""
   UserInfo.lunchTasks4=""
   UserInfo.lunchTasks5=""
   UserInfo.lunchTasks6=""
   UserInfo.lunchTasks7=""

   --all the different community variables for 7 days
   UserInfo.community=""
   UserInfo.community2=""
   UserInfo.community3=""
   UserInfo.community4=""
   UserInfo.community5=""
   UserInfo.community6=""
   UserInfo.community7=""
   UserInfo.communityTasks=""
   UserInfo.communityTasks2=""
   UserInfo.communityTasks3=""
   UserInfo.communityTasks4=""
   UserInfo.communityTasks5=""
   UserInfo.communityTasks6=""
   UserInfo.communityTasks7="" 
   

--Does the user have previous info stored?
path = system.pathForFile( "userstuff", system.DocumentsDirectory )
myFile = io.open(path, "r") 

-- Load user registration information

if myFile then
  io.close(myFile)
  UserInfo = table.load("userstuff")
  table.print_r(UserInfo)
end

composer.gotoScene("HomeScreen")

 --[[
local function removeSplash(event)
sceneGroup:removeSelf()
sceneGroup=nil
composer.gotoScene("HomeScreen", {effect = "zoomInOutFade", time = 380})
end 
timer.performWithDelay(2000,removeSplash)]]

--[[REGULAR NOTES SECTION
1) FIX THE COLORING OF THE SPLASH SCREEN SO THAT IT MATCHES UP WITH THE COLORS OF THE OTHER PAGES
]]

--[[THIS IS THE NOTES SECTION FOR WHAT SHOULD BE UPDATED:
1) SWIPE RIGHT FROM HOME PAGE --> GOES TO A PAGE WHICH LISTS ALL OF THE HOMEWORKS THAT ARE WRITTEN DOWN AND FOR WHICH CLASS THEY ARE (CHECKLIST)
2) IN SETTINGS HAVE THE ABILITY TO COLOR CUSTOMIZE EACH PERIOD
3) MAYBE HAVE A NOTES SECTION
]]