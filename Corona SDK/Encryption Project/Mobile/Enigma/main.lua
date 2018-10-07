-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
composer.recycleOnSceneChange = true
local firebaseAnalytics = require("plugin.firebaseAnalytics")
firebaseAnalytics.init()
composer.gotoScene("HomeScreen")