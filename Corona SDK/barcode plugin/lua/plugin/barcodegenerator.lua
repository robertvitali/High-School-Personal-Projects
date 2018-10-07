local Library = require "CoronaLibrary"

-- Create library
local lib = Library:new{ name='barcodegenerator', publisherId='com.encryptmee' }

-------------------------------------------------------------------------------
-- BEGIN (Insert your implementation starting here)
-------------------------------------------------------------------------------
	--barcodeName = name of file that will be stored in system.DocumentsDirectory
	--barcodeValue = the number/variable that you would like the barcode to be
	--imageType = jpg or png
	--barcodeType = (c39, c128a, c128b, c128c, i2of5).

	local function generate(barcodeName, barcodeType, barcodeValue, imageType)
		local function networkListener( event )
		    if ( event.isError ) then
		        print( "Network error: ", event.response )
		        print( "File not downloaded" )
		    elseif ( event.phase == "progress" ) then
		    elseif ( event.phase == "ended" ) then
		        print( "Download complete" )
		    end
		end

		local photoLink = "http://barcodes4.me/barcode/"..barcodeType.."/"..barcodeValue.."."..imageType
		local params = {}
		params.progress = "download"
		params.response = {
			filename = barcodeName,
		 	baseDirectory = system.DocumentsDirectory
		}
		network.request( photoLink, "GET", networkListener,  params )
	end
	lib.generate = generate


	local function deleteBarcodeFile(barcodeName)
		os.remove(system.pathForFile(barcodeName, system.DocumentsDirectory))
	end
	lib.deleteBarcodeFile = deleteBarcodeFile
-------------------------------------------------------------------------------
-- END
-------------------------------------------------------------------------------

-- Return library instance
return lib
