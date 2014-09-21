while true do
  screen:clear()
  pad = Controls.read()

  if pad:cross() then
    txtmsg = System.startOSK("Enter Name","Enter Name")
    System.message(txtmsg,0)
  end

  file = io.open("name.txt" , "w")
  file:write(txtmsg)
  file:close()

  dofile("pimpin_list.lua")
  
  screen.waitVblankStart()
  screen.flip()
end

