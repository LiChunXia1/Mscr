require("util.TouchUtil")
require("util.GameUtil")
require("fishing.FishingTools")
require("fishing.FishingWarehouse")




while true do
  --У�����
  if examine() then
    --��ʼ����
    catchFish()
    --�洢�ֿ�
    warehouseMethod()
  end
end
