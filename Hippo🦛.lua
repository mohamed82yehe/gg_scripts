gg.setVisible(false)
gg.clearResults()

-- البحث عن القيم الثلاثة
gg.searchNumber("200;20;5", gg.TYPE_DOUBLE)

-- تعديل القيمة 20 إلى 999999
gg.refineNumber("20", gg.TYPE_DOUBLE)
local r1 = gg.getResults(100)
for i = 1, #r1 do
  r1[i].value = 999999
end
gg.setValues(r1)

-- تعديل القيمة 5 إلى 0
gg.refineNumber("5", gg.TYPE_DOUBLE)
local r2 = gg.getResults(100)
for i = 1, #r2 do
  r2[i].value = 0
end
gg.setValues(r2)

gg.clearResults()
gg.toast("عيييش 🔥")
