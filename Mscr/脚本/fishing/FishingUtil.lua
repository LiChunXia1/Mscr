
--[所有鱼像素点] 墨鱼 八爪鱼 黄花鱼 石斑鱼
local seafoodFishColor = {
  {"89B8FD","7|0|CADAEF|9|-6|F5F6F6|3|-7|CEE7FF|-3|-1|A6CCFD|-5|2|C2D2BF|-2|10|547DC8|-7|6|526EC6|-7|8|214287"},
  {"C4D0E0","1|0|4D4C55|-1|-5|98A6E5|6|-2|667AD3|1|6|7083E2|3|8|7796EB|-11|1|5661A8|-9|-3|5865BA|-7|7|8D97E0"},
  {"54ABCD","-3|6|B7E5E9|4|1|7ACAD8|-7|7|E1E4CE|-2|1|48A6CA"},
  {"3D5487","-4|1|5E84D9|3|-3|6A90D7|2|3|7EB6EB|0|4|6389B2|-9|4|405A90"}
}

--青鱼 鲇鱼
local freshwaterFish = {
  {"798341","2|-3|9FA866|6|1|A1A39F|3|6|848E4D|-5|5|222414|-3|-1|8B9646|2|-4|69713E"},
  {"5A5A57","2|-3|7A7A77|7|-7|34332D|5|0|898988|4|4|8C8B87|-2|4|414343|-3|1|1F1F1D|-5|4|605F5D|-2|-2|A5A4A0|2|-10|9A9891|8|-4|858582"},
}

--牡蛎
local clamColor = {
  {"A7CEC3","3|-4|A1D1C9|-1|6|ECEFED|-6|3|85ADA8|-3|0|C6E2DC|4|1|B7E0D8|1|-3|E5F3F0|-2|5|9FAEA3"}
}

--毒素
local venomColor = {
  {"FF7EDA","5|-6|FF63CF|5|1|F5008C|-6|0|FF51C8|1|-7|FFA6E5"}
}

--沙虾
local shrimpColor = {
  {"BCBBCD","-2|-3|C9C7D7|2|-2|706B79|6|0|8C8A9D|5|7|C1BCC7|-7|7|98B7B8|-6|2|A8A7BE"}
}

--河豚制作毒素
function setBlowfish()
  if addBlowfish == 18 then
    --打开背包
    taps(0,304,216,600)
    --点击合成页面
    taps(0,373,112,300)
    --点击毒素
    taps(0,54,47,300)
    --全选
    taps(0,340,142,300)
    --合成
    taps(0,291,173,300)
    --关闭
    exitView()
    --初始化
    addBlowfish = 0
  end
end


--存储鱼 (颜色数组, 指针地址数组)
function setWarehouse(color,pointer)
  --宝箱地址
  local openId = 0
  --打开宝箱
  function open()
    --关闭其他窗口
    exitView()
    --每次调用都自动切换宝箱
    openId = openId + 1
    if openId > 5 then
      --超出了最大宝箱
      openId = 1
    end
    --打开指针数组宝箱
    taps(0,pointer[openId][1],pointer[openId][2],1700)
  end
  --打开宝箱
  open()
  --结束for控制变量
  local exitFor = 0
  --存储
  for i=1,100 do
    for i=1,#array do
      local intX,intY = findMultiColor(21,49,122,230,color[i][1],color[i][2],0,0.9)
      if intX>-1 and intY>-1 then
        exitFor = 0
      else
        exitFor = exitFor + 1 if exitFor > 3 then break end
        touchDown(0,70,219) touchMoveEx(0,71,111,300) sleep(100) touchUp(0) sleep(400)
      end
    end
  end
end