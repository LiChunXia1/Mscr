require("util.TouchUtil")
require("util.GameUtil")
require("fishing.FishingTools")
require("fishing.FishingWarehouse")




while true do
  --校验鱼竿
  if examine() then
    --开始钓鱼
    catchFish()
    --存储仓库
    warehouseMethod()
  end
end
