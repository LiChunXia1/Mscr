
--[������] ī�� ��צ�� �ƻ��� ʯ����
local marineFishColor = {
  {"89B8FD","7|0|CADAEF|9|-6|F5F6F6|3|-7|CEE7FF|-3|-1|A6CCFD|-5|2|C2D2BF|-2|10|547DC8|-7|6|526EC6|-7|8|214287"},
  {"C4D0E0","1|0|4D4C55|-1|-5|98A6E5|6|-2|667AD3|1|6|7083E2|3|8|7796EB|-11|1|5661A8|-9|-3|5865BA|-7|7|8D97E0"},
  {"54ABCD","-3|6|B7E5E9|4|1|7ACAD8|-7|7|E1E4CE|-2|1|48A6CA"},
  {"3D5487","-4|1|5E84D9|3|-3|6A90D7|2|3|7EB6EB|0|4|6389B2|-9|4|405A90"}
}
--[��ˮ��] ���� ����
local freshwaterFish = {
  {"798341","2|-3|9FA866|6|1|A1A39F|3|6|848E4D|-5|5|222414|-3|-1|8B9646|2|-4|69713E"},
  {"5A5A57","2|-3|7A7A77|7|-7|34332D|5|0|898988|4|4|8C8B87|-2|4|414343|-3|1|1F1F1D|-5|4|605F5D|-2|-2|A5A4A0|2|-10|9A9891|8|-4|858582"},
}
--ĵ��ָ��
local oysters_pointer = {{221,166}}
--����ָ��
local toxin_pointer = {{200,75}}
--ɳϺָ��
local sandShrimp_pointer = {{231,176}}
--�����㱦��ָ��
local marine_pointer = {
  {14,96},
  {79,17},
  {136,126},
  {137,42},
  {164,62},
}
--��ˮ�㱦��ָ��
local freshwater_pointer = {
  {269,146},
  {265,31},
  {239,136},
  {240,48},
  {164,128},
}



--[����ֿ�]
function setWarehouse(color,pointer)
  --��������
  local index = 0
  --��ָ����������
  function openNum5()
    --�ر�ҳ���ֹ��bug
    exitView()
    --ÿ�ε��ö����������
    index = index + 1
    if index > 5 then
      index = 1
    end
    taps(0,pointer[index][1],pointer[index][2],1500)
  end
  --��Ĭ�ϱ���
  openNum5()
  --forѭ���տ��Ʊ���
  local exitFor = 0
  --��ʼ�洢[��ˮ��][������]
  for i=1,100 do
    local yes = false
    --������ɫ��
    for i=1,#color do
      local intX,intY = findMultiColor(21,48,119,230,color[i][1],color[i][2],0,0.9)
      if intX>-1 and intY>-1 then 
        taps(0,intX,intY,300)
        selectAll()
        if this_transfer(true) then
          --�л�����
          openNum5()
        end
        --��ֹ�����϶�
        yes = true
      end
    end
    --����Ƿ������϶�
    if yes == false then
      --�Ҳ����㵱ǰҳ��,���������϶�,������ֵ������forѭ��
      exitFor = exitFor + 1
      if exitFor > 3 then exitView() break end
      touchDown(0,70,210) touchMoveEx(0,70,150,200) sleep(100) touchUp(0) sleep(1200)
    end
  end
  --�ر�
  exitView()
end





--���뵭ˮ��
function setFreshwaterFish()
  setWarehouse(freshwaterFish,freshwater_pointer)
end


--����[������]
function setMarineFish()
  setWarehouse(marineFishColor,marine_pointer)
end

--�洢ĵ����Ϻ����
function setOysterLobsterToxin()
  --ĵ�� ɳϺ ����
  local color = {
    {"A7CEC3","3|-4|A1D1C9|-1|6|ECEFED|-6|3|85ADA8|-3|0|C6E2DC|4|1|B7E0D8|1|-3|E5F3F0|-2|5|9FAEA3"},
    {"BCBBCD","-2|-3|C9C7D7|2|-2|706B79|6|0|8C8A9D|5|7|C1BCC7|-7|7|98B7B8|-6|2|A8A7BE"},
    {"FF7EDA","5|-6|FF63CF|5|1|F5008C|-6|0|FF51C8|1|-7|FFA6E5"}
  }
  --����ָ��
  local pointer = {
    {231,176},
    {175,166},
    {212,71},
  }
  --��ָ������
  function open(index)
    taps(0,pointer[index][1],pointer[index][2],1500)
  end
  --��ʼ�洢
  for index = 1,3 do
    --�򿪱���
    open(index)
    for i=1,4 do
      local intX,intY = findMultiColor(21,48,119,230,color[index][1],color[index][2],0,0.9)
      if intX>-1 and intY>-1 then 
        taps(0,intX,intY,300)
        selectAll()
        this_transfer(false)
        sleep(700)
      else
        --�Ҳ����㵱ǰҳ��,���������϶�,������ֵ������forѭ��
        touchDown(0,70,210) touchMoveEx(0,70,150,200) sleep(100) touchUp(0) sleep(1200)
      end
    end
    exitView()
  end
end