-- ROCKET SHIP GAME PRODUCED BY ROBERT VITALI
--MAIN FILE
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")
local composer = require "composer"
--composer.recycleOnSceneChange = true
composer.gotoScene("gamePlay", {effect = "zoomInOutFade", time = 380})