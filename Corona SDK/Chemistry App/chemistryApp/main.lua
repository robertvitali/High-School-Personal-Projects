-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
composer.recycleOnSceneChange = true
local firebaseAnalytics = require("plugin.firebaseAnalytics")
firebaseAnalytics.init()

require("extensions.table")
_G.localData={}  -- intialize a global variable to hold User schedule

localData.notes = ""

localData.symbol1 = ""
localData.mass1 = 0
localData.symbol2 = ""
localData.mass2 = 0
localData.symbol3 = ""
localData.mass3 = 0
localData.symbol4 = ""
localData.mass4 = 0
localData.symbol5 = ""
localData.mass5 = 0
localData.symbol6 = ""
localData.mass6 = 0
localData.boolean1 = nil
localData.time = 0
localData.firstTime = 0

--Does the user have previous info stored?
path = system.pathForFile( "localDataSaved", system.DocumentsDirectory )
myFile = io.open(path, "r") 

-- Load user registration information

if myFile then
  io.close(myFile)
  localData = table.load("localDataSaved")
end


if(localData.boolean1 == nil)then
	localData.boolean1 = 1
	localData.time = 0
table.save(localData, "localDataSaved")
end



_G.element={}
--elements with the letter A
element.Ac = 227
element.Ag = 107.868
element.Al = 26.9815
element.Am = 243
element.Ar = 39.948
element.As = 74.9216
element.At = 21
element.Au = 196.967

--elements with the letter B
element.B = 10.812
element.Ba = 137.327
element.Be = 9.01218
element.Bh = 272
element.Bi = 208.980
element.Bk = 247
element.Br = 79.904

--elements with the letter C
element.C = 12.011
element.Ca = 40.078
element.Cd = 112.412
element.Ce = 140.116
element.Cf = 251
element.Cl = 35.453
element.Cm = 247
element.Cn = 285
element.Co = 58.933
element.Cr = 51.996
element.Cs = 132.905
element.Cu = 63.546

--elements with the letter D
element.Db = 268
element.Ds = 281
element.Dy = 162.500

--elements with the letter E
element.Er = 167.259
element.Es = 252
element.Eu = 151.964

--elements with the letter F
element.F = 18.9984
element.Fe = 55.845
element.Fl = 289
element.Fm = 257
element.Fr = 223

--elements with the letter G
element.Ga = 69.723
element.Gd = 157.25
element.Ge = 72.64

--elements with the letter H
element.H = 1.008
element.He = 4.003
element.Hg = 200.59
element.Hf = 178.49
element.Ho = 164.93
element.Hs = 270

--elements with the letter I
element.I = 126.904
element.In = 114.818
element.Ir = 192.217

--elements with the letter K
element.K = 39.0983
element.Kr = 83.798

--elements with the letter L
element.La = 138.905
element.Li = 6.941
element.Lr = 262
element.Lu = 174.967
element.Lv = 293

--elements with the letter M
element.Md = 258
element.Mg = 24.3051
element.Mn = 54.9380
element.Mo = 95.96
element.Mt = 276

--elements with the letter N
element.N = 14.0067
element.Na = 22.9898
element.Nb = 92.9064
element.Nd = 144.242
element.Ne = 20.1798
element.Ni = 58.6934
element.No = 259
element.Np = 237

--elements with the letter O
element.O = 15.9994
element.Os = 190.23

--elements with the letter P
element.P = 30.9738
element.Pa = 231.036
element.Pb = 207.2
element.Pd = 106.42
element.Pm = 145
element.Po = 209
element.Pr = 140.908
element.Pt = 195.085
element.Pu = 244

--elements with the letter R
element.Ra = 226
element.Rb = 85.4678
element.Re = 186.207
element.Rf = 267
element.Rg = 280
element.Rh = 102.906
element.Rn = 222
element.Ru = 101.07

--elements with the letter S
element.S = 32.066
element.Sb = 121.760
element.Sc = 44.9559
element.Se = 78.96
element.Sg = 271
element.Si = 28.0855
element.Sm = 150.36
element.Sn = 118.711
element.Sr = 87.62

--elements with the letter T
element.Ta = 180.948
element.Tb = 158.925
element.Tc = 98
element.Te = 127.60
element.Th = 232.038
element.Ti = 47.867
element.Tl = 204.383
element.Tm = 168.934

--elements with the letter U
element.U = 238.029
element.Uuo = 294
element.Uup = 288
element.Uus = 294
element.Uut = 284

--elements with the letter V
element.V = 50.9415

--element with the letter W
element.W = 183.84

--element with the letter X
element.Xe = 131.294

--element with the letter Y
element.Y = 88.9059
element.Yb = 173.054

--element with the letter Z
element.Zn = 65.38
element.Zr = 91.224



composer.gotoScene("HomeScreen")