shadow = Color.new(255,255,0,255)

--fonts
font = Font.createMonoSpaced()
font:setPixelSizes(0,15)
selector = 1

--printCenterfuntion
function printCenteredfont(y,text,color) 
	local length = string.len(text) 
	local x = 240 - ((length*8)/2) 
	screen:fontPrint(font,x,y,text,color) 
end 

oldpad = Controls.read()
status = "Png"

while true do
	screen:clear()
	pad = Controls.read()

	if pad:right() and not oldpad:right() then selector = selector +1
	elseif pad:left() and not oldpad:left() then selector = selector -1
	end

	if selector >= 4 then selector = 4 end
	if selector <= 1 then selector = 1 end

	if selector == 1 then screen:fillRect(144,63,25,12,shadow) end
	if selector == 2 then screen:fillRect(205,63,28,12,shadow) end
	if selector == 3 then screen:fillRect(270,63,28,12,shadow) end
	if selector == 4 then screen:fillRect(330,63,30,12,shadow) end

	if pad:cross() and selector == 1 then
		file=io.open("format.txt", "w")
		file:write(".png")
		file:close()
	end

	if pad:cross() and selector == 2 then
		file=io.open("format.txt", "w")
		file:write(".tga")
		file:close()
	end

	if pad:cross() and selector == 3 then
		file=io.open("format.txt", "w")
		file:write(".bmp")
		file:close()
	end

	if pad:cross() and selector == 4 then
		file=io.open("format.txt", "w")
		file:write(".jpg")
		file:close()
	end

	if pad:start() then dofile("menu.lua") end

	printCenteredfont(55,"Output Image Format",Color.new(255,255,0))
	printCenteredfont(73,"Png    Tga    Bmp    Jpg",Color.new(255,0,0))
	oldpad = pad

	screen.waitVblankStart()
	screen.flip()
end