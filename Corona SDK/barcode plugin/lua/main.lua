-- 
-- Abstract: PLUGIN_NAME Library Plugin Test Project
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2015 Corona Labs Inc. All Rights Reserved.
--
------------------------------------------------------------

-- Load plugin library
local barcode = require ("plugin.barcodegenerator")

-------------------------------------------------------------------------------
-- BEGIN (Insert your sample test starting here)
-------------------------------------------------------------------------------
barcode.generate("barcode1", "c128a", "1000", "jpg")
barcode.generate("barcode2", "c39", "1000", "jpg")
barcode.generate("barcode3", "c128b", "1000", "png")
barcode.generate("barcode4", "c128c", "1000", "png")
barcode.generate("barcode5", "i2of5", "1000", "jpg")

barcodeImage = display.newImage("barcode1.jpg", system.DocumentsDirectory, display.contentWidth/2, display.contentHeight/2)



barcode.deleteBarcodeFile("barcode2.jpg")

-------------------------------------------------------------------------------
-- END
-------------------------------------------------------------------------------