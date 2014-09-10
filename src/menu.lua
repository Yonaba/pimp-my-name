Mp3me.load("sound/concentrate.mp3")
Mp3me.play()

fond=Image.load("gfx/menu_fond.png")

font = Font.load("fonts/Blade Runner Movie Font.ttf")
font:setPixelSizes (15,15)

selecteur = Image.load("gfx/selecteur.png")
selecteur2 = Image.load("gfx/selecteur2.png")
selecteur3 = Image.load("gfx/selecteur3.png")
selecteur4 = Image.load("gfx/selecteur4.png")

var = 0

function printCenteredfont(y,text,color) 
	local length = string.len(text) 
	local x = 240 - ((length*8)/2) 
	screen:fontPrint(font,x,y,text,color) 
end

img =selecteur
pos_y = 150
sel = 1

oldpad  = Controls.read()

while true do
	screen:clear()
	screen:blit(0,0,fond)
	pad=Controls.read()

	printCenteredfont(175,"Start",Color.new(255,255,255)) 
	printCenteredfont(195,"Options",Color.new(255,255,255))
	printCenteredfont(215,"Credits",Color.new(255,255,255))
	printCenteredfont(235,"Exit",Color.new(255,255,255))
	screen:blit(130,pos_y,img)

	var = var+1

	if var>=0 and var<=5 then img = selecteur end
	if var>=5 and var<=10 then img = selecteur2 end
	if var>=10 and var<=15 then img = selecteur3 end
	if var>=15 and var<=20 then img = selecteur4 end
	if var > 20 then var = 0 end

	if pad:down() and not oldpad:down() then
		sel = sel + 1
		pos_y = pos_y+20
	end

	if sel > 4 then sel = 4 end
	if pos_y > 210 then pos_y = 210 end

	if pad:up() and not oldpad:up() then
		sel = sel-1
		pos_y = pos_y -20
	end

	if sel < 1 then sel = 1 end
	if pos_y < 150 then pos_y = 150 end

	if pad:cross() and not oldpad:cross() and sel == 1 then
		dofile("index.lua")
		collectgarbage()
	end

	if pad:cross() and not oldpad:cross() and sel == 2 then
		dofile("options.lua")
		collectgarbage()
	end

	if pad:cross() and not oldpad:cross() and sel == 3 then
		dofile("credits.lua")
		collectgarbage()
	end

	if pad:cross() and not oldpad:cross() and sel == 4 then
		collectgarbage()
		System.Quit()
	end

	oldpad= pad
	screen.waitVblankStart()
	screen.flip()
end