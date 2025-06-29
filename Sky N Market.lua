function SKY_SHOP()
    gg.setVisible(false)
    local choices = gg.multiChoice({
        "✅ تفعيل الكل",
        "🔍 بحث يدوي+ فتح الكشك",
        "🏅 شارة المنطاد+المغامر+الحديقة",
        "🍄 زرع السحاب",
        "🍐 شجر السحاب+ زهرة السحاب",
        "🍁 اعشاب السحاب",
        "🍬 منتجات حيوانات السحاب",
        "👗 فستان - 🍥 ماكرون - 🍹 شاي",
        "👚 روب - 🥗 كعكة بازلاء - 🍷 مشروب غازي",
        "🎀 بيريه - 🍮 جيلي الكريستال - 🥃 مصل قلنباق",
        "🦇 اجنحة - 🎂 رخامية - ❄️ عصير جليدي",
        "🏒 عصا - 🍩 دونات - 🍉 عصير بطيخ",
        "🌸 حجاب -  منتجات السحاب الجديدة",
        "🌿 أعشاب وكريستالات جديدة",
        "🍽️ وصفات طاولة طعام السحاب",
        "🧂 توابل ومدق السحاب",
        "🔥 منتجات مصهر السحاب",
        "❌ خروج"
    }, nil, "☁️ متجر السحاب - اختيار متعدد ☁️")

    if not choices then return end
    
    if choices[18] then
        gg.toast("🚪 تم الخروج من متجر السحاب")
        os.exit()
    end
    
    if choices[1] then
        for i = 2, 17 do
            choices[i] = true
        end
    end

    local items = {
        {search="MANUAL"}, -- 2
        {search="306101~306102","306106~306107"}, -- 3
        {search="304101~304107"}, -- 4
        {search="303101~303105","303111","303121"}, -- 5
        {search="9101001~9101024"}, -- 6
        {search="302101~302105"}, -- 7
        {search="301101~301103"}, -- 8
        {search="301201~301203"}, -- 9
        {search="301301~301303"}, -- 10
        {search="301401~301403"}, -- 11
        {search="301501~301503"}, -- 12
        {search="301601~301603"}, -- 13
        {search="9101021~9101027"}, -- 14
        {search="3951001~3951020"}, -- 15
        {search={"307101","307201","307301","307401","307501","307601"}}, -- 16
        {search={"307102","307202","307302","307402","307502","307602",
                 "307702","307802","307902","317102","317202","317302","317402"}} -- 17
    }

    local modified = false
    
    for i = 2, 17 do
        if choices[i] then
            local item = items[i-1]
            gg.clearResults()
            
            if item.search == "MANUAL" then
                local input = gg.prompt({"أدخل الكود -- عدد منتجات الكشك المغلق:"}, nil, {"number"})
                if input and input[1] then
                    gg.searchNumber(input[1], gg.TYPE_DOUBLE)
                    local results = gg.getResults(100)
                    if #results > 0 then
                        for j, v in ipairs(results) do
                            v.value = 0
                            v.freeze = false
                        end
                        gg.setValues(results)
                        modified = true
                        gg.toast("تم فتح الكشك بنجاح ✓")
                    else
                        gg.toast("⚠️ لم يتم العثور على القيمة")
                    end
                end
            elseif type(item.search) == "string" and item.search:find('~') then
                local startCode, endCode = item.search:match('(%d+)~(%d+)')
                startCode = tonumber(startCode)
                endCode = tonumber(endCode)
                local partSuccess = false
                
                for code = startCode, endCode do
                    gg.searchNumber(code, gg.TYPE_DOUBLE)
                    local results = gg.getResults(100)
                    if #results > 0 then
                        for j, v in ipairs(results) do
                            v.value = 0
                            v.freeze = false
                        end
                        gg.setValues(results)
                        partSuccess = true
                    end
                    gg.clearResults()
                end
                
                if partSuccess then
                    modified = true
                    gg.toast("تم التفعيل بنجاح ✓")
                else
                    gg.toast("⚠️ فشل في التفعيل")
                end
            elseif type(item.search) == "table" then
                local partSuccess = false
                for _, code in ipairs(item.search) do
                    gg.searchNumber(code, gg.TYPE_DOUBLE)
                    local results = gg.getResults(100)
                    if #results > 0 then
                        for j, v in ipairs(results) do
                            v.value = 0
                            v.freeze = false
                        end
                        gg.setValues(results)
                        partSuccess = true
                    end
                    gg.clearResults()
                end
                if partSuccess then
                    modified = true
                    gg.toast("تم التفعيل بنجاح ✓")
                else
                    gg.toast("⚠️ فشل في التفعيل")
                end
            else
                local numCode = tonumber(item.search)
                gg.searchNumber(numCode, gg.TYPE_DOUBLE)
                local results = gg.getResults(100)
                if #results > 0 then
                    for j, v in ipairs(results) do
                        v.value = 0
                        v.freeze = false
                    end
                    gg.setValues(results)
                    modified = true
                    gg.toast("تم التفعيل بنجاح ✓")
                else
                    gg.toast("⚠️ لم يتم العثور على العنصر")
                end
            end
            gg.clearResults()
        end
    end

    if modified then
        gg.toast("✅ تم تفعيل العناصر المحددة بنجاح")
    else
        gg.toast("⚠️ لم يتم تعديل أي عنصر")
    end
end

-- ✅ تشغيل القائمة تلقائيًا عند فتح السكربت
SKY_SHOP()
