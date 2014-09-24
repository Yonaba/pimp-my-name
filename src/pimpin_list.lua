System.currentDirectory("ms0:/PSP/GAME/PMN/")
file = io.open("NAME.TXT", "r")
name = file:read()
file:close()
 
System.currentDirectory("ms0:/PSP/GAME/PMN/fonts/")
white = Color.new(255,255,255)
red = Color.new(255,0,0)
fbrowser = {s = 1, fl = System.listDirectory("ms0:/PSP/GAME/PMN/fonts/"),ls = 1, sp = 10}
 
fbrowser.nf = table.getn(fbrowser.fl)
oldpad = Controls.read()
 
function runfbrowser()
  for i = ((fbrowser.ls-1)*fbrowser.sp)+1, fbrowser.ls*fbrowser.sp do
    if fbrowser.nf >= i then
      screen:print(0,((i-((fbrowser.ls-1)*fbrowser.sp))*10)-10,fbrowser.fl[i].name,white)
    elseif
      fbrowser.nf < i then break end
    end

  screen:print(0,((fbrowser.s-((fbrowser.ls-1)*fbrowser.sp))*10)-10,fbrowser.fl[fbrowser.s].name,red)
   
  if pad:down() and not oldpad:down() then fbrowser.s = fbrowser.s + 1 end
  if pad:up() and not oldpad:up() then fbrowser.s = fbrowser.s - 1 end
   
  if fbrowser.s > fbrowser.nf then 
    fbrowser.s = fbrowser.nf 
  elseif fbrowser.s < 1 then 
    fbrowser.s = 1 
  end
  if fbrowser.s > fbrowser.sp*fbrowser.ls then 
    fbrowser.ls = fbrowser.ls + 1
  elseif fbrowser.s < ((fbrowser.ls-1) * fbrowser.sp)+1 then 
    fbrowser.ls = fbrowser.ls - 1 fbrowser.s = (fbrowser.ls)*fbrowser.sp 
  end
   
  if pad:cross() and not oldpad:cross() then
    if not fbrowser.fl[fbrowser.s].directory then
      if string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".ttf" 
      or string.lower(string.sub(fbrowser.fl[fbrowser.s].name, -4)) == ".TTF" then
        file = io.open("font.txt", "w")
        file:write(fbrowser.fl[fbrowser.s].name)
        file:close()
        System.currentDirectory("ms0:/PSP/GAME/PMN/")
        dofile("print.lua")
      end
    end
  end
  
end


while true do
  pad = Controls.read()
  screen:clear()
  runfbrowser()
  
  screen.waitVblankStart()
  screen.flip()
  oldpad = pad
end
