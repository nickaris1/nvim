function printObj(obj, hierarchyLevel)
  if (hierarchyLevel == nil) then
    hierarchyLevel = 0
  elseif (hierarchyLevel == 4) then
    return 0
  end

  local whitespace = ""
  for i=0,hierarchyLevel,1 do
    whitespace = whitespace .. "-"
  end
  io.write(whitespace)

  print(obj)
  if (type(obj) == "table") then
    for k,v in pairs(obj) do
      io.write(whitespace .. "-")
      if (type(v) == "table") then
        printObj(v, hierarchyLevel+1)
      else
        print(v)
      end
    end
  else
    print(obj)
  end
end
