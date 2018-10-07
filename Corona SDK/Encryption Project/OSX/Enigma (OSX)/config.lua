--calculate the aspect ratio of the device
--aspectRatio = display.pixelHeight / display.pixelWidth
application = {
   content = {
      --[[width = aspectRatio and gt; 1.5 and 800 or math.floor( 1200 / aspectRatio ),
      height = aspectRatio and lt; 1.5 and 1200 or math.floor( 800 * aspectRatio ),
      scale = "letterBox",
      fps = 30,
 
      imageSuffix = {
         ["@2x"] = 1.3,
      },]]
      width = 1440,
      height = 900,
      scale = "letterBox",
      fps = 30,
   },
}