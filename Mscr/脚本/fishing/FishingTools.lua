
--��������
local layoutName = "catchFish"
--�洢�ֿ�
local addWarehouse = 0
--�ϳɺ���
local addBlowfish = 0




--�洢
function warehouseMethod()
  if addBlowfish == 45 then
    setFreshwaterFish()
    setOysterLobsterToxin()
    addBlowfish = 0
  end
  if addBlowfish == 20 then
    --�򿪱���
    taps(0,305,219,700)
    --������
    taps(0,308,186,300)
    --����ϳ�ҳ��
    taps(0,376,109,700)
    --�������λ��
    taps(0,55,45,400)
    --ȫѡ
    taps(0,337,142,300)
    --�ϳ�
    taps(0,294,170,200)
    --�ر�
    exitView()
    --��ʼ��ֵ
    addBlowfish = 0
  end
end

--ִ�е���
function catchFish()
  --����
  touchDown(0,335,181) sleep(1100) touchUp(0) sleep(3000)
  --����
  ui.newLayout(layoutName)
  ui.show(layoutName)
  sleep(26000)
  ui.dismiss(layoutName)
  sleep(600)
  --����
  touchDown(0,335,181) sleep(700) touchUp(0) sleep(1100)
  --����
  addWarehouse = addWarehouse + 1
  addBlowfish = addBlowfish + 1
end



--У�����
function examine()
  --ʶ���������
  if cmpColorEx("385|234|3C759A,388|230|5188A6,388|233|467A98",0.8) == 1 then
    return true
  end
  --�����������
  openBackpack()
  --ʶ�𱳰����
  local intX,intY = findMultiColor(50,39,350,174,"507DAD","2|6|EAE3E3|2|-2|548CBF|5|-5|337399|5|4|86979D|-6|7|467AA5|-1|4|6B7F86",0,0.9)
  if intX>-1 and intY>-1 then
    --������
    taps(0,intX,intY,300)
    --�رմ���
    exitView()
    --���´������
    return false
  end

  --�رմ���
  exitView()
  --�򿪹���̨
  taps(0,193,236,1500)
  --�����ʾ�ɺϳ���Ʒ
  taps(0,137,213,400)
  --�������
  taps(0,275,24,700)
  --��������Ƿ���ڿɺϳ�
  local intX,intY = findMultiColor(18,56,47,156,"507DAD","3|-3|4E8BBC|2|6|EAE3E3|-7|8|4D7BA8|5|-3|C0C9CD|5|-5|337399",0,0.9)
  if intX>-1 and intY>-1 then 
    --������
    taps(0,intX,intY,300)
    --���3�����
    for i=1,3 do taps(0,325,176,300) end
    --�������
    taps(0,295,203,0)
    --�رմ���
    exitView()
    --���´������
    return false
  end

  --�رմ���
  exitView()
  --�򿪲��ϱ���
  taps(0,395,152,1500)

  --�������
  taps(0,215,38,500)
  --���֩��˿
  taps(0,147,71,350)
  --���3��
  for i=1,3 do taps(0,223,157,100) end
  --���뱳��
  taps(0,242,181,300)

  --���ֲ��
  taps(0,283,36,500)
  --���ľ��
  taps(0,150,68,350)
  --���3��
  for i=1,3 do taps(0,222,143,100) end
  --���뱳��
  taps(0,245,170,300)

  --�رմ���
  exitView()
  --���´������
  return false
end