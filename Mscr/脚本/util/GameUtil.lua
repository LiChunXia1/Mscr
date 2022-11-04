require("util.TouchUtil")

--全选物品
function selectAll()
  for i=1,30 do
    local intX,intY = findMultiColor(54,74,398,223,"4D60CD","-5|-3|5A6DFF|3|-7|5A6DFF|3|4|5A6DFF|-5|5|5A6DFF|0|2|444E57|-1|-6|515352",0,0.9)
    if intX>-1 and intY>-1 then 
      taps(0,intX,intY,300)
      break
    end
    sleep(100)
  end
end


--转移
function this_transfer(isMax)
  for i=1,30 do
    local intX,intY = findMultiColor(51,60,416,237,"CBE3F2","6|1|ECF8FF|2|6|76B1D4|-1|-3|4996E4|-4|-1|4996E4|-4|-9|61AFFF|0|4|EDF8FF",0,0.9)
    if intX>-1 and intY>-1 then 
      taps(0,intX,intY,0)
      if isMax then
        for i=1,16 do
          local intX,intY = findMultiColor(212,154,225,169,"117CD5","2|2|0183ED|0|3|117CD5|7|2|0C81E0|7|-3|0C81E0",1,0.95)
          if intX>-1 and intY>-1 then 
            --[这里添加宝箱满]
            return true 
          end
          sleep(50)
        end
      end
      break
    end
    sleep(100)
  end
  return false
end


--[网络检查]
function networkCheck()
  local intX,intY = findMultiColor(205,125,226,153,"F1D2AE","-4|-6|FFAF61|6|3|E08F38|-3|3|FAEFE1|1|6|DD8A30|-3|8|FFF8ED|-2|-11|FCEBBB|-5|0|D57C12",1,0.95)
  if intX>-1 and intY>-1 then 
    taps(0,214,139,100)
    return true
  end
  return false
end


--[获取宝箱类型]
function chestType()
  --[木头]
  if cmpColorEx("211|23|E6C287,209|19|C1813D,212|25|C68A47,215|20|F9E5AE,215|24|C38340",0.9) == 1 then
    return 2
  end
  --[海盗]
  if cmpColorEx("213|13|BD7833,209|11|C2823F,210|15|B8702B,216|12|F9E5AE,211|18|F4DDA5",0.9) == 1 then
    return 1
  end
  --[找不到宝箱]
  return 0
end