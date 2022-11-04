
--延迟点击
function taps(runSleep,tapX,tapY,endSleep)
  sleep(runSleep)
  tap(tapX,tapY)
  sleep(endSleep)
end

--打开背包,整理背包
function openBackpack()
  taps(0,305,217,700)
  taps(0,310,185,300)
end


--关闭背包
function exitView()
  local intX,intY = findMultiColor(134,4,418,126,"E4E4F1","0|-6|485BF1|-7|0|485BF1|6|0|485BF1|-2|3|E3E3F1|-3|-3|E4E4F1|2|2|E4E4F1",1,0.9)
  if intX>-1 and intY>-1 then
    taps(0,intX,intY,1000)
    exitView()
  end
end