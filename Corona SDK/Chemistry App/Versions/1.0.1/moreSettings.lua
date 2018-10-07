-- new settings page


local composer = require "composer"
local scene = composer.newScene()
local json = require "json"
local widget = require "widget"
require("extensions.table")


local height = display.contentHeight/30
local height2 = display.contentHeight/12

local temp = display.newText("Extra Settings", display.contentWidth/2, ((height2 - 80)/2), native.systemBoldFont, 60)
	temp:setFillColor(0,0,0)
local whiteRect = display.newRect(display.contentWidth/2, -20, display.contentWidth, 140)

	
local back = widget.newButton
	{
		left = 0,
		top = temp.y - 30,
		height = 40,
		width = 120,
		id = "back",
		label = "<",
		labelColor = {default = {0,0,0}, over = {0,0,0}} ,
		fontSize = 60,
		emboss = true
	}
	back.y = temp.y
	back.x = back.x + 8

--TO MAKE SURE THAT THE BACK BUTTON WAS PRESSED AND WORKS
local function backButtonEvent (event)
	local phase = event.phase
end

local scrollView = widget.newScrollView
	{
		backgroundColor = {89/255,89/255,89/255},
		left = 0,
		top= -(90), -- -(90)
		width = display.contentWidth,
		height = display.contentHeight + 200,
		topPadding = 60,
		bottomPadding = 40,
		horizontalScrollDisabled = true,
		verticalScrollDisabled = false,
	}
--	scrollView:setIsLocked( true )


--CREATING SCENE HERE
function scene:create (event)
	local settings2Group = self.view
	widget.setTheme( "widget_theme_ios7" )
	background = display.newRect(scrollView.width, scrollView.height, display.contentWidth*2, 1340)
	--	background:setFillColor(25/255, 140/255, 191/255)
		background:setFillColor(89/255,89/255,89/255)
		
	Ac = display.newText("Ac: ", 125, height2 + 8, native.systemFont, 28)
		Ac:setFillColor(1,1,1)
	AcField = native.newTextField(400, Ac.y + 4, 350, 44)
	AcField.text = UserInfo.AcEdit
	AcField.inputType = "default"
		
	Ag = display.newText("Ag: ", 125, 2*height2 + 8, native.systemFont, 28)
		Ag:setFillColor(1,1,1)
	AgField = native.newTextField(400, Ag.y + 4, 350, 44)
	AgField.text = UserInfo.AgEdit
	AgField.inputType = "default"
	
	Al = display.newText("Al: ", 125, 3*height2 + 8, native.systemFont, 28)
		Al:setFillColor(1,1,1)
	AlField = native.newTextField(400, Al.y + 4, 350, 44)
	AlField.text = UserInfo.AlEdit
	AlField.inputType = "default"

	Am = display.newText("Am: ", 125, 4*height2 + 8, native.systemFont, 28)
		Am:setFillColor(1,1,1)
	AmField = native.newTextField(400, Am.y + 4, 350, 44)
	AmField.text = UserInfo.AmEdit
	AmField.inputType = "default"

	Ar = display.newText("Ar: ", 125, 5*height2 + 8, native.systemFont, 28)
		Ar:setFillColor(1,1,1)
	ArField = native.newTextField(400, Ar.y + 4, 350, 44)
	ArField.text = UserInfo.ArEdit
	ArField.inputType = "default"

	advising6 = display.newText("As: ", 125, 6*height2 + 8, native.systemFont, 28)
		advising6:setFillColor(1,1,1)
	advising6Field = native.newTextField(400, advising6.y + 4, 350, 44)
	advising6Field.text = UserInfo.advising5
	advising6Field.inputType = "default"

	advising7 = display.newText("At: ", 125, 7*height2+8, native.systemFont, 28)
		advising7:setFillColor(1,1,1)		
	advising7Field = native.newTextField(400, advising7.y + 4, 350, 44)
	advising7Field.text = UserInfo.advising7
	advising7Field.inputType = "default"
	
	break1 = display.newText("Au: ", 144, 8*height2+ 8, native.systemFont, 28)
		break1:setFillColor(1,1,1)		
	break1Field = native.newTextField(400, break1.y + 4, 350, 44)
	break1Field.text = UserInfo.myBreak1
	break1Field.inputType = "default"

	break2 = display.newText("B: ", 144, 9*height2+8, native.systemFont, 28)
		break2:setFillColor(1,1,1)
	break2Field = native.newTextField(400, break2.y + 4, 350, 44)
	break2Field.text = UserInfo.myBreak2
	break2Field.inputType = "default"

	break3 = display.newText("Ba: ", 144, 10*height2+8, native.systemFont, 28)
		break3:setFillColor(1,1,1)
	break3Field = native.newTextField(400, break3.y + 4, 350, 44)
	break3Field.text = UserInfo.myBreak3
	break3Field.inputType = "default"
	
	break4 = display.newText("Be: ", 144, 11*height2 + 8, native.systemFont, 28)
		break4:setFillColor(1,1,1)
	break4Field = native.newTextField(400, break4.y + 4, 350, 44)
	break4Field.text = UserInfo.myBreak4
	break4Field.inputType = "default"

	break5 = display.newText("Bh: ", 144, 12*height2 + 8, native.systemFont, 28)
		break5:setFillColor(1,1,1)
	break5Field = native.newTextField(400, break5.y + 4, 350, 44)
	break5Field.text = UserInfo.myBreak5
	break5Field.inputType = "default"

	break6 = display.newText("Bi: ", 144, 13*height2 + 8, native.systemFont, 28)
		break6:setFillColor(1,1,1)
	break6Field = native.newTextField(400, break6.y + 4, 350, 44)
	break6Field.text = UserInfo.myBreak6
	break6Field.inputType = "default"

	break7 = display.newText("Bk: ", 144, 14*height2 + 8, native.systemFont, 28)
		break7:setFillColor(1,1,1)
	break7Field = native.newTextField(400, break7.y + 4, 350, 44)
	break7Field.text = UserInfo.myBreak7
	break7Field.inputType = "default"

	community1 = display.newText("Br: ", 110, 15*height2 + 8, native.systemFont, 25.5)
		community1:setFillColor(1,1,1)
	community1Field = native.newTextField(400, community1.y + 4, 350, 44)
	community1Field.text = UserInfo.community1
	community1Field.inputType = "default"

	community2 = display.newText("C: ", 110, 16*height2 + 8, native.systemFont, 25.5)
		community2:setFillColor(1,1,1)
	community2Field = native.newTextField(400, community2.y + 4, 350, 44)
	community2Field.text = UserInfo.community2
	community2Field.inputType = "default"

	community3 = display.newText("Ca: ", 110, 17*height2 + 8, native.systemFont, 25.5)
		community3:setFillColor(1,1,1)
	community3Field = native.newTextField(400, community3.y + 4, 350, 44)
	community3Field.text = UserInfo.community3
	community3Field.inputType = "default"

	community4 = display.newText("Cd: ", 110, 18*height2 + 8, native.systemFont, 25.5)
		community4:setFillColor(1,1,1)
	community4Field = native.newTextField(400, community4.y + 4, 350, 44)
	community4Field.text = UserInfo.community4
	community4Field.inputType = "default"

	community5 = display.newText("Ce: ", 110, 19*height2 + 8, native.systemFont, 25.5)
		community5:setFillColor(1,1,1)
	community5Field = native.newTextField(400, community5.y + 4, 350, 44)
	community5Field.text = UserInfo.community5
	community5Field.inputType = "default"

	community6 = display.newText("Cf: ", 110, 20*height2 + 8, native.systemFont, 25.5)
		community6:setFillColor(1,1,1)
	community6Field = native.newTextField(400, community6.y + 4, 350, 44)
	community6Field.text = UserInfo.community6
	community6Field.inputType = "default"

	community7 = display.newText("Cl: ", 110, 21*height2 + 8, native.systemFont, 25.5)
		community7:setFillColor(1,1,1)
	community7Field = native.newTextField(400, community7.y + 4, 350, 44)
	community7Field.text = UserInfo.community1
	community7Field.inputType = "default"

	lunch1 = display.newText("Cm: ", 144, 22*height2 + 8, native.systemFont, 28)
		lunch1:setFillColor(1,1,1)
	lunch1Field = native.newTextField(400, lunch1.y + 4, 350, 44)
	lunch1Field.text = UserInfo.lunch1
	lunch1Field.inputType = "default"

	lunch2 = display.newText("Cn: ", 144, 23*height2 + 8, native.systemFont, 28)
		lunch2:setFillColor(1,1,1)
	lunch2Field = native.newTextField(400, lunch2.y + 4, 350, 44)
	lunch2Field.text = UserInfo.lunch2
	lunch2Field.inputType = "default"

	lunch3 = display.newText("Co: ", 144, 24*height2 + 8, native.systemFont, 28)
		lunch3:setFillColor(1,1,1)
	lunch3Field = native.newTextField(400, lunch3.y + 4, 350, 44)
	lunch3Field.text = UserInfo.lunch3
	lunch3Field.inputType = "default"

	lunch4 = display.newText("Cr: ", 144, 25*height2 + 8, native.systemFont, 28)
		lunch4:setFillColor(1,1,1)
	lunch4Field = native.newTextField(400, lunch4.y + 4, 350, 44)
	lunch4Field.text = UserInfo.lunch4
	lunch4Field.inputType = "default"

	lunch5 = display.newText("Cs: ", 144, 26*height2 + 8, native.systemFont, 28)
		lunch5:setFillColor(1,1,1)
	lunch5Field = native.newTextField(400, lunch5.y + 4, 350, 44)
	lunch5Field.text = UserInfo.lunch5
	lunch5Field.inputType = "default"

	lunch6 = display.newText("Cu: ", 144, 27*height2 + 8, native.systemFont, 28)
		lunch6:setFillColor(1,1,1)
	lunch6Field = native.newTextField(400, lunch6.y + 4, 350, 44)
	lunch6Field.text = UserInfo.lunch6
	lunch6Field.inputType = "default"

	lunch7 = display.newText("Db: ", 144, 28*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch8 = display.newText("Ds: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch8:setFillColor(1,1,1)
	lunch8Field = native.newTextField(400, lunch8.y + 4, 350, 44)
	lunch8Field.text = UserInfo.lunch7
	lunch8Field.inputType = "default"

	lunch9 = display.newText("Dy: ", 144, 30*height2 + 8, native.systemFont, 28)
		lunch9:setFillColor(1,1,1)
	lunch9Field = native.newTextField(400, lunch9.y + 4, 350, 44)
	lunch9Field.text = UserInfo.lunch7
	lunch9Field.inputType = "default"

	lunch10 = display.newText("Er: ", 144, 31*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch10Field = native.newTextField(400, lunch10.y + 4, 350, 44)
	lunch10Field.text = UserInfo.lunch7
	lunch10Field.inputType = "default"

	lunch11 = display.newText("Es: ", 144, 32*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch11Field = native.newTextField(400, lunch11.y + 4, 350, 44)
	lunch11Field.text = UserInfo.lunch7
	lunch11Field.inputType = "default"

	lunch12 = display.newText("Eu: ", 144, 33*height2 + 8, native.systemFont, 28)
		lunch12:setFillColor(1,1,1)
	lunch12Field = native.newTextField(400, lunch12.y + 4, 350, 44)
	lunch12Field.text = UserInfo.lunch7
	lunch12Field.inputType = "default"

	lunch13 = display.newText("F: ", 144, 34*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch13Field = native.newTextField(400, lunch13.y + 4, 350, 44)
	lunch13Field.text = UserInfo.lunch7
	lunch13Field.inputType = "default"

	lunch14 = display.newText("Fe: ", 144, 35*height2 + 8, native.systemFont, 28)
		lunch14:setFillColor(1,1,1)
	lunch14Field = native.newTextField(400, lunch14.y + 4, 350, 44)
	lunch14Field.text = UserInfo.lunch7
	lunch14Field.inputType = "default"

	lunch15 = display.newText("Fl: ", 144, 36*height2 + 8, native.systemFont, 28)
		lunch15:setFillColor(1,1,1)
	lunch15Field = native.newTextField(400, lunch15.y + 4, 350, 44)
	lunch15Field.text = UserInfo.lunch7
	lunch15Field.inputType = "default"

	lunch16 = display.newText("Fm: ", 144, 37*height2 + 8, native.systemFont, 28)
		lunch16:setFillColor(1,1,1)
	lunch16Field = native.newTextField(400, lunch16.y + 4, 350, 44)
	lunch16Field.text = UserInfo.lunch7
	lunch16Field.inputType = "default"

	lunch17 = display.newText("Fr: ", 144, 38*height2 + 8, native.systemFont, 28)
		lunch17:setFillColor(1,1,1)
	lunch17Field = native.newTextField(400, lunch17.y + 4, 350, 44)
	lunch17Field.text = UserInfo.lunch7
	lunch17Field.inputType = "default"

	lunch18 = display.newText("Ga: ", 144, 39*height2 + 8, native.systemFont, 28)
		lunch18:setFillColor(1,1,1)
	lunch18Field = native.newTextField(400, lunch18.y + 4, 350, 44)
	lunch18Field.text = UserInfo.lunch7
	lunch18Field.inputType = "default"

	lunch19 = display.newText("Gd: ", 144, 40*height2 + 8, native.systemFont, 28)
		lunch19:setFillColor(1,1,1)
	lunch19Field = native.newTextField(400, lunch19.y + 4, 350, 44)
	lunch19Field.text = UserInfo.lunch7
	lunch19Field.inputType = "default"

	lunch20 = display.newText("Ge: ", 144, 41*height2 + 8, native.systemFont, 28)
		lunch20:setFillColor(1,1,1)
	lunch20Field = native.newTextField(400, lunch20.y + 4, 350, 44)
	lunch20Field.text = UserInfo.lunch7
	lunch20Field.inputType = "default"

	lunch21 = display.newText("H: ", 144, 42*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch21Field = native.newTextField(400, lunch21.y + 4, 350, 44)
	lunch21Field.text = UserInfo.lunch7
	lunch21Field.inputType = "default"

	lunch22 = display.newText("He: ", 144, 43*height2 + 8, native.systemFont, 28)
		lunch22:setFillColor(1,1,1)
	lunch22Field = native.newTextField(400, lunch22.y + 4, 350, 44)
	lunch22Field.text = UserInfo.lunch7
	lunch22Field.inputType = "default"

	lunch23 = display.newText("Hg: ", 144, 44*height2 + 8, native.systemFont, 28)
		lunch23:setFillColor(1,1,1)
	lunch23Field = native.newTextField(400, lunch23.y + 4, 350, 44)
	lunch23Field.text = UserInfo.lunch7
	lunch23Field.inputType = "default"

	lunch24 = display.newText("Hf: ", 144, 45*height2 + 8, native.systemFont, 28)
		lunch24:setFillColor(1,1,1)
	lunch24Field = native.newTextField(400, lunch24.y + 4, 350, 44)
	lunch24Field.text = UserInfo.lunch7
	lunch24Field.inputType = "default"

	lunch25 = display.newText("Ho: ", 144, 46*height2 + 8, native.systemFont, 28)
		lunch25:setFillColor(1,1,1)
	lunch25Field = native.newTextField(400, lunch25.y + 4, 350, 44)
	lunch25Field.text = UserInfo.lunch7
	lunch25Field.inputType = "default"

	lunch26 = display.newText("Hs: ", 144, 47*height2 + 8, native.systemFont, 28)
		lunch26:setFillColor(1,1,1)
	lunch26Field = native.newTextField(400, lunch26.y + 4, 350, 44)
	lunch26Field.text = UserInfo.lunch7
	lunch26Field.inputType = "default"

	lunch27 = display.newText("I: ", 144, 48*height2 + 8, native.systemFont, 28)
		lunch27:setFillColor(1,1,1)
	lunch27Field = native.newTextField(400, lunch27.y + 4, 350, 44)
	lunch27Field.text = UserInfo.lunch7
	lunch27Field.inputType = "default"

	lunch28 = display.newText("In: ", 144, 49*height2 + 8, native.systemFont, 28)
		lunch28:setFillColor(1,1,1)
	lunch28Field = native.newTextField(400, lunch28.y + 4, 350, 44)
	lunch28Field.text = UserInfo.lunch7
	lunch28Field.inputType = "default"

	lunch29 = display.newText("Ir: ", 144, 50*height2 + 8, native.systemFont, 28)
		lunch29:setFillColor(1,1,1)
	lunch29Field = native.newTextField(400, lunch29.y + 4, 350, 44)
	lunch29Field.text = UserInfo.lunch7
	lunch29Field.inputType = "default"

	lunch30 = display.newText("K: ", 144, 51*height2 + 8, native.systemFont, 28)
		lunch30:setFillColor(1,1,1)
	lunch30Field = native.newTextField(400, lunch30.y + 4, 350, 44)
	lunch30Field.text = UserInfo.lunch7
	lunch30Field.inputType = "default"

	lunch31 = display.newText("Kr: ", 144, 52*height2 + 8, native.systemFont, 28)
		lunch31:setFillColor(1,1,1)
	lunch31Field = native.newTextField(400, lunch31.y + 4, 350, 44)
	lunch31Field.text = UserInfo.lunch7
	lunch31Field.inputType = "default"

	lunch32 = display.newText("La: ", 144, 53*height2 + 8, native.systemFont, 28)
		lunch32:setFillColor(1,1,1)
	lunch32Field = native.newTextField(400, lunch32.y + 4, 350, 44)
	lunch32Field.text = UserInfo.lunch7
	lunch32Field.inputType = "default"

	lunch33 = display.newText("Li: ", 144, 54*height2 + 8, native.systemFont, 28)
		lunch33:setFillColor(1,1,1)
	lunch33Field = native.newTextField(400, lunch33.y + 4, 350, 44)
	lunch33Field.text = UserInfo.lunch7
	lunch33Field.inputType = "default"

	lunch34 = display.newText("Lr: ", 144, 55*height2 + 8, native.systemFont, 28)
		lunch34:setFillColor(1,1,1)
	lunch34Field = native.newTextField(400, lunch34.y + 4, 350, 44)
	lunch34Field.text = UserInfo.lunch7
	lunch34Field.inputType = "default"

	lunch35 = display.newText("Lu: ", 144, 56*height2 + 8, native.systemFont, 28)
		lunch35:setFillColor(1,1,1)
	lunch35Field = native.newTextField(400, lunch35.y + 4, 350, 44)
	lunch35Field.text = UserInfo.lunch7
	lunch35Field.inputType = "default"

	lunch7 = display.newText("Lv: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Md: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Mg: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Mn: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Mo: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Mt: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("N: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Na: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Nb: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Nd: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Ne: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Ni: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("No: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Np: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("O: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Os: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("P: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Pa: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Pb: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Pd: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Pm: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Po: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Pr: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Pt: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Pu: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Ra: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Rb: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Re: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Rf: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Rg: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Rh: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Rn: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Ru: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("S: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Sb: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Sc: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Se: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Sg: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Si: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Sm: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Sn: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Sr: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Ta: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Tb: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Tc: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Te: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Th: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Ti: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Tl: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Tm: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("U: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Uuo: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Uup: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Uus: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Uut: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("V: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("W: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Xe: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Y: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Yb: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Zn: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	lunch7 = display.newText("Zr: ", 144, 29*height2 + 8, native.systemFont, 28)
		lunch7:setFillColor(1,1,1)
	lunch7Field = native.newTextField(400, lunch7.y + 4, 350, 44)
	lunch7Field.text = UserInfo.lunch7
	lunch7Field.inputType = "default"

	scrollView:insert(background)
	scrollView:insert(whiteRect)
	scrollView:insert(temp)
	scrollView:insert(back)

	
	
	settings2Group:insert(scrollView)



	local function keyboardListener(event)
		native.setKeyboardFocus(nil)
	end

--[[
	--function for clicking teacher button
	function teacherVersion(event)
		if teacher == 0 then
			teacher = teacher + 1
		elseif teacher == 1 then
			teacher = teacher - 1
		end
		print(teacher)
		teacherCheck()
		UserInfo.teacher = teacher
		teacher = UserInfo.teacher
		table.save(UserInfo, "userSavedInfo")
	end

	--function to check if teacher mode is on or off and what happens if so
	function teacherCheck(event)
		if(teacher == 0)then
			teacherButton:setFillColor(0,0,0)
			teacherText:setFillColor(1,1,1)
			teacherText.text = "Student Mode On"
			homeworkString = "Homework"
			assignmentString = "Assignments"
			placeholderString = "Write Your Homework Here"
		elseif teacher == 1 then
			teacherButton:setFillColor(1,1,1)
			teacherText:setFillColor(0,0,0)
			teacherText.text = "Teacher Mode On"
			homeworkString = "Notes"
			assignmentString = "Notes/Tasks"
			placeholderString = "Write Your Notes Here"
		end
	end]]

	local function backButton(event)
		advising1Field.isVisible = false
		advising2Field.isVisible = false
		advising3Field.isVisible = false
		advising4Field.isVisible = false
		advising5Field.isVisible = false
		advising6Field.isVisible = false
		advising7Field.isVisible = false
		
		break1Field.isVisible = false
		break2Field.isVisible = false
		break3Field.isVisible = false
		break4Field.isVisible = false
		break5Field.isVisible = false
		break6Field.isVisible = false
		break7Field.isVisible = false

		community1Field.isVisible = false
		community2Field.isVisible = false
		community3Field.isVisible = false
		community4Field.isVisible = false
		community5Field.isVisible = false
		community6Field.isVisible = false
		community7Field.isVisible = false

		lunch1Field.isVisible = false
		lunch2Field.isVisible = false
		lunch3Field.isVisible = false
		lunch4Field.isVisible = false
		lunch5Field.isVisible = false
		lunch6Field.isVisible = false
		lunch7Field.isVisible = false
		
		native.setKeyboardFocus(nil)

		UserInfo.advising1 = advising1Field.text
		UserInfo.advising2 = advising2Field.text
		UserInfo.advising3 = advising3Field.text
		UserInfo.advising4 = advising4Field.text
		UserInfo.advising5 = advising5Field.text
		UserInfo.advising6 = advising6Field.text
		UserInfo.advising7 = advising7Field.text
		
		UserInfo.myBreak1 = break1Field.text
		UserInfo.myBreak2 = break2Field.text
		UserInfo.myBreak3 = break3Field.text
		UserInfo.myBreak4 = break4Field.text
		UserInfo.myBreak5 = break5Field.text
		UserInfo.myBreak6 = break6Field.text
		UserInfo.myBreak7 = break7Field.text

		UserInfo.community1 = community1Field.text
		UserInfo.community2 = community2Field.text
		UserInfo.community3 = community3Field.text
		UserInfo.community4 = community4Field.text
		UserInfo.community5 = community5Field.text
		UserInfo.community6 = community6Field.text
		UserInfo.community7 = community7Field.text

		UserInfo.lunch1 = lunch1Field.text
		UserInfo.lunch2 = lunch2Field.text
		UserInfo.lunch3 = lunch3Field.text
		UserInfo.lunch4 = lunch4Field.text
		UserInfo.lunch5 = lunch5Field.text
		UserInfo.lunch6 = lunch6Field.text
		UserInfo.lunch7 = lunch7Field.text
		--SAVES THE INPUT INTO A FILE
		table.save(UserInfo, "userSavedInfo")

		composer.gotoScene("settings", {effect = "fade", time = 200})
		clickTracker()
	end


	background:addEventListener("tap", keyboardListener)
	scrollView:addEventListener("tap", keyboardListener)
	back:addEventListener("tap", backButton)
	--teacherButton:addEventListener("tap", teacherVersion)
end  -- end of create scene



function scene:hide (event)

end

function scene:show (event)

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
return scene

--[[NOTES
]]