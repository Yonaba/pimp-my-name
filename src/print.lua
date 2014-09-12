file = io.open("ms0:/PSP/GAME/PMN/fonts/font.txt","r")
font_name = file:read()
file:close()

font = Font.load("ms0:/PSP/GAME/PMN/fonts/"..font_name)
font:setPixelSizes(95,110)

file = io.open("ms0:/PSP/GAME/PMN/NAME.TXT", "r")
name = file:read()
file:close()

--Setting Variables
x=100
y=100
t=1
pos=1
Text = {}
Text[1]= name

--format image
file = io.open("ms0:/PSP/GAME/PMN/FORMAT.TXT", "r")
f_format = file:read()
file:close()

sccnt = 1

--folder image
file = io.open("ms0:/PSP/GAME/PMN/folder.TXT", "r")
f_folder = file:read()
file:close()

while true do
	screen:clear()
	pad = Controls.read()

	if pad:l() then t=t-1 end
	if pad:r() then t=t+1 end
	if  t < 1 then t = 1 end
	if t>pos then t = pos end

	if pad:left() then x=x-1 end
	if pad:right()then x=x+1 end

	if pad:up() then y=y-1 end
	if pad:down() then y=y+1 end

	if x<=0 then x=0 end
	if x>=480 then x=480 end
	if y<=0 then y=0 end
	if y>=272 then y=272 end

	if pad:select() then
		screen:save("ms0:/PICTURE/"..sccnt.."."..f_format)
		sccnt = sccnt + 1
	end

	if pad:triangle() then 
		dofile("ms0:/PSP/GAME/PMN/menu.lua")
	end

	screen:fontPrint(font,x,y,Text[t], Color.new(255,0,0))

	screen.waitVblankStart()
	screen.flip()
end
