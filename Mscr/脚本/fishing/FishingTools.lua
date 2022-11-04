
--堵塞名称
local layoutName = "catchFish"
--存储仓库
local addWarehouse = 0
--合成河豚
local addBlowfish = 0




--存储
function warehouseMethod()
  if addBlowfish == 45 then
    setFreshwaterFish()
    setOysterLobsterToxin()
    addBlowfish = 0
  end
  if addBlowfish == 20 then
    --打开背包
    taps(0,305,219,700)
    --整理背包
    taps(0,308,186,300)
    --进入合成页面
    taps(0,376,109,700)
    --点击毒素位置
    taps(0,55,45,400)
    --全选
    taps(0,337,142,300)
    --合成
    taps(0,294,170,200)
    --关闭
    exitView()
    --初始化值
    addBlowfish = 0
  end
end

--执行钓鱼
function catchFish()
  --钓鱼
  touchDown(0,335,181) sleep(1100) touchUp(0) sleep(3000)
  --堵塞
  ui.newLayout(layoutName)
  ui.show(layoutName)
  sleep(26000)
  ui.dismiss(layoutName)
  sleep(600)
  --捕鱼
  touchDown(0,335,181) sleep(700) touchUp(0) sleep(1100)
  --叠加
  addWarehouse = addWarehouse + 1
  addBlowfish = addBlowfish + 1
end



--校验鱼竿
function examine()
  --识别手中鱼竿
  if cmpColorEx("385|234|3C759A,388|230|5188A6,388|233|467A98",0.8) == 1 then
    return true
  end
  --进背包找鱼竿
  openBackpack()
  --识别背包鱼竿
  local intX,intY = findMultiColor(50,39,350,174,"507DAD","2|6|EAE3E3|2|-2|548CBF|5|-5|337399|5|4|86979D|-6|7|467AA5|-1|4|6B7F86",0,0.9)
  if intX>-1 and intY>-1 then
    --点击鱼竿
    taps(0,intX,intY,300)
    --关闭窗口
    exitView()
    --重新处理鱼竿
    return false
  end

  --关闭窗口
  exitView()
  --打开工作台
  taps(0,193,236,1500)
  --点击显示可合成物品
  taps(0,137,213,400)
  --点击工具
  taps(0,275,24,700)
  --查找鱼竿是否存在可合成
  local intX,intY = findMultiColor(18,56,47,156,"507DAD","3|-3|4E8BBC|2|6|EAE3E3|-7|8|4D7BA8|5|-3|C0C9CD|5|-5|337399",0,0.9)
  if intX>-1 and intY>-1 then 
    --点击鱼竿
    taps(0,intX,intY,300)
    --点击3把鱼竿
    for i=1,3 do taps(0,325,176,300) end
    --制作鱼竿
    taps(0,295,203,0)
    --关闭窗口
    exitView()
    --重新处理鱼竿
    return false
  end

  --关闭窗口
  exitView()
  --打开材料宝箱
  taps(0,395,152,1500)

  --点击材料
  taps(0,215,38,500)
  --点击蜘蛛丝
  taps(0,147,71,350)
  --点击3个
  for i=1,3 do taps(0,223,157,100) end
  --放入背包
  taps(0,242,181,300)

  --点击植物
  taps(0,283,36,500)
  --点击木板
  taps(0,150,68,350)
  --点击3个
  for i=1,3 do taps(0,222,143,100) end
  --放入背包
  taps(0,245,170,300)

  --关闭窗口
  exitView()
  --重新处理鱼竿
  return false
end