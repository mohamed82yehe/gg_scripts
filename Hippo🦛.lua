gg.setVisible(false)
gg.clearResults()

-- البحث عن القيم الثلاثة 200;20;5 من نوع DOUBLE
gg.searchNumber("200;20;5", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
gg.sleep(1000)

-- الحصول على النتائج بعد البحث
local results = gg.getResults(100)

-- فلترة القيمة 20 وتعديلها إلى 999999
gg.refineNumber("20", gg.TYPE_DOUBLE)
local r1 = gg.getResults(100)
for i = 1, #r1 do
  r1[i].value = 999999
end
gg.setValues(r1)
gg.sleep(500)

-- فلترة القيمة 5 وتعديلها إلى 0
gg.refineNumber("5", gg.TYPE_DOUBLE)
local r2 = gg.getResults(100)
for i = 1, #r2 do
  r2[i].value = 0
end
gg.setValues(r2)

gg.clearResults()
gg.toast("تم التعديل بنجاح 🔥")
