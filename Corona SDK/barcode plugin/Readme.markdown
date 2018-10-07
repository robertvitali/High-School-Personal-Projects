__*[NOTE]:*__ See [Instructions](Instructions.markdown) for these stub documentation files. (Remove this before you deploy your docs)


# PLUGIN_NAME: Plugin API Docs

|                      | &nbsp; 
| -------------------- | ---------------------------------------------------------------
| __Type__             | [TYPE](http://docs.coronalabs.com/api/type/Library.html)
| __Corona Store__     | [barcodegenerator](http://store.coronalabs.com/plugin/barcodegenerator)
| __Keywords__         | 
| __See also__         | 

## Overview

The barcodegenerator plugin can be used in your [Corona](https://coronalabs.com/products/corona-sdk/) project. It enables you to...


## Syntax

	local barcodegenerator = require "plugin.barcodegenerator"

### Functions

##### [barcodegenerator.generate()](downloadFunction.markdown)

##### [barcodegenerator.deleteBarcodeFile()](deleteBarcodeFile.markdown)



## Project Configuration

### Corona Store Activation

In order to use this plugin, you must activate the plugin at the [Corona Store](http://store.coronalabs.com/plugin/barcodegenerator).


### SDK

When you build using the Corona Simulator, the server automatically takes care of integrating the plugin into your project. 

All you need to do is add an entry into a `plugins` table of your `build.settings`. The following is an example of a minimal `build.settings` file:

``````
settings =
{
	plugins =
	{
		-- key is the name passed to Lua's 'require()'
		["plugin.barcodegenerator"] =
		{
			-- required
			publisherId = "com.encryptmee",
		},
	},		
}
``````

### Enterprise

If you have activated this plugin, you can download this plugin from the corresponding plugin page in the [Corona Store](http://store.coronalabs.com/plugin/barcodegenerator).


## Platform-specific Notes

[Insert discussion on issues specific to iOS/Android/etc, or to specific devices]


## Resources

### Sample Code

You can access sample code [here](SAMPLE_CODE_URL).

### Support

More support is available from the PUBLISHER_NAME team:

* [E-mail](mailto://support@encryptmee.com)
* [Forum](http://FORUM_URL)
* [Plugin Publisher](http://www.encryptmee.com)


## Compatibility

| Platform                     | Supported
| ---------------------------- | ---------------------------- 
| iOS                          | Yes
| Android                      | Yes
| Android (GameStick)          | No
| Android (Kindle)             | No
| Android (NOOK)               | No
| Android (Ouya)               | No
| Mac App                      | Yes
| Win32 App                    | Yes
| Windows Phone 8              | Yes
| Corona Simulator (Mac)       | Yes
| Corona Simulator (Win)       | Yes

