# barcodegenerator.deleteBarcodeFile()

|                      | &nbsp; 
| -------------------- | ---------------------------------------------------------------
| __Type__             | [function](http://docs.coronalabs.com/api/type/Function.html)
| __Library__          | [barcodegenerator.*](Readme.markdown)
| __Return value__     | [TYPE]()
| __Keywords__         | 
| __See also__         | 


## Overview

This function deletes the barcode file from the local saved folder.


## Syntax

	barcodegenerator.deleteBarcodeFile( barcodeName )

##### barcodeName <small>(required)</small>
_[TYPE]()._ Name of the barcode including the type of file (.jpg or .png).


## Examples

``````lua
local barcodegenerator = require 'plugin.barcodegenerator'

barcodegenerator.deleteBarcodeFile( "barcode1.jpg" )
``````
