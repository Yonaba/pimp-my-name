bg = Image.load("gfx/menu_fond.png")
red = Color.new(255,0,0)
fadeimg = Image.createEmpty(480,272)
fadeimg:clear()
titleimg = Image.createEmpty(90,10)
titleimg:clear()
shoutimg= Image.createEmpty(288,10)
shoutimg:clear()
textimg= Image.createEmpty(385,180)
textimg:clear()
pbar= Image.createEmpty(200,18)
pbar:clear()

function refresh()
  screen:clear()
  screen:blit(0, 0, bg)
  screen:blit(0,0,fadeimg)
  screen:blit(93,2,titleimg)
  screen:blit(96,26,shoutimg)
  screen:blit(43, 49, textimg)
  screen:blit(35, 251, pbar)
  screen.flip()
  screen.waitVblankStart()
end

function sweetintro()
  wsh = {}
  for i = 1,7 do
    wsh[i] = Image.createEmpty(10,10)
    wsh[i]:blit(0,0,bg,(i-1)*10,273,10,10)
  end
  temptitle = Image.createEmpty(90,10)
  tempshout = Image.createEmpty(288,10)
  temptitle:print(1,1,"LuaPlayerHM",red)
  tempshout:print(1,1,"Created by homemister and PiCkDaT",red)
  refresh()
  System.sleep(500)
  count = 0
  for i = 1,49 do
    count = (count % 7) + 1
    titleimg:clear()
    titleimg:blit(0,0,temptitle,0,0,i*2,10)
    titleimg:blit((i*2)-9, 0, wsh[count])
    refresh()
  end
  titleimg:clear()
  titleimg:blit(0,0,temptitle)
  temptitle = nil
  refresh()
  System.sleep(1000)
  count = 0
  for i = 1,68 do
    count = (count % 7) + 1
    shoutimg:clear()
    shoutimg:blit(0,0,tempshout,0,0,i*4,10)
    shoutimg:blit((i*4)-9, 0, wsh[count])
    refresh()
  end
  shoutimg:clear()
  shoutimg:blit(0,0,tempshout)
  wsh = nil
  count = nil
  tempshout = nil
  refresh()
  System.sleep(1000)
  for na = 1,32 do
    fadeimg:clear(Color.new(0,0,0,224-(na*7)))
    System.memclean()
    refresh()
  end
  fadeimg:clear()
end

while true do
	screen:clear()
	sweetintro()
end
