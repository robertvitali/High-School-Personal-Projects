# barcodegenerator.download()

|                      | &nbsp; 
| -------------------- | ---------------------------------------------------------------
| __Type__             | [function](http://docs.coronalabs.com/api/type/Function.html)
| __Library__          | [barcodegenerator.*](Readme.markdown)
| __Return value__     | [TYPE]()
| __Keywords__         | 
| __See also__         | 


## Overview

This function generates a barcode and saves it as a png or jpg file in system.DocumentsDirectory. The supported barcode standards are: (c39, c128a, c128b, c128c, i2of5).


## Syntax

	barcodegenerator.download(barcodeName, barcodeType, barcodeValue, imageType)

##### barcodeName <small>(required)</small>
_[TYPE]()._ The name you would like the image to be saved as. This should be a string.

##### barcodeType <small>(required)</small>
_[TYPE]()._ The type of barcode that you would like to generate. The supported barcode standards are (c39, c128a, c128b, c128c, i2of5). This should be a string.

##### barcodeValue <small>(required)</small>
_[TYPE]()._ The value you would like the barcode to be equal to. This should be saved as a string even if the value only contains numbers.

##### imageType <small>(required)</small>
_[TYPE]()._ The type of image you would like the barcode to be saved as. Supported file types are .jpg and .png. This variable should be defined as 'jpg' or 'png' only. No '.' is needed before jpg or png. This should be saved as a string.


## Examples

``````lua
local barcodegenerator = require 'plugin.barcodegenerator'

barcodegenerator.download("barcode1", "c39", "102ABC", "jpg")
``````
