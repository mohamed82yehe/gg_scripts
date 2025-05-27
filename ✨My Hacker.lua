productionResults = nil

local menuState = {
    main = true,
    yellowShop = false,
    cloudIsland = false,
    farm = false,
    island = false,
    wahmi = false,
    production = false
}


function mainMenu()
    menuState = {
        main = true,
        yellowShop = false,
        cloudIsland = false,
        farm = false,
        island = false,
        wahmi = false,
        production = false
    }
    
    local main = gg.choice({
        "💵 الوهمي",
        "🌾 تفعيلات المزرعة",
        "🏝️ تفعيلات الجزيرة",
        "☁️ تفعيلات جزيرة السحاب",
        "⚡ الإنتاج السريع",
        "💴 شراء بأصفر",
        "🚪 خروج"
    }, nil, "مرحبًا بك، اختر القائمة:")

    if main == nil then return end

    if main == 1 then
        menuState.main = false
        menuState.wahmi = true
        HOME()
    elseif main == 2 then
        menuState.main = false
        menuState.farm = true
        FARM_MENU()
    elseif main == 3 then
        menuState.main = false
        menuState.island = true
        ISLAND_MENU()
    elseif main == 4 then
        menuState.main = false
        menuState.cloudIsland = true
        CLOUD_ISLAND_MENU()
    elseif main == 5 then
        menuState.main = false
        menuState.production = true
        fastProduction()
    elseif main == 6 then
        menuState.main = false
        menuState.yellowShop = true
        YELLOW_SHOP_MENU()
    elseif main == 7 then
        os.exit()
    end
end



--|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|--

function WAHMI()
    local list = gg.choice({
    	-- "تدمير الخطأ"
        "🔥 الطاقة",
        "🌿 سماد خارق",
        "🌱 سماد عادي",
        "💸 وهمي من الفيش",
        "↩️ رجوع"
    }, nil, "💵 قائمة الوهمي")

    if list == nil then return end

    if list == 1 then
        editValue("🔥 حدد طاقة قبل التشغيل", ":600027")
    elseif list == 2 then
        editValue("🌿 حدد سماد خارق قبل التشغيل", ":201004")
    elseif list == 3 then
        editValue("🌱 حدد سماد عادي قبل التشغيل", ":201000")
    elseif list == 4 then
        fakewheelforune()
    elseif list == 5 then 
        menuState.wahmi = false
        menuState.main = true
        mainMenu()
        return
    end
end

function editValue(alertMessage, byteValue)
    gg.alert(alertMessage)
    gg.setVisible(false)


    gg.clearResults()
    gg.searchNumber("8245935277855761735", gg.TYPE_QWORD)
    local results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("0", gg.TYPE_QWORD)
    end
    gg.clearResults()

    gg.searchNumber(":error", gg.TYPE_BYTE)
    results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("0", gg.TYPE_BYTE)
    end
    gg.clearResults()

    gg.searchNumber(byteValue, gg.TYPE_BYTE)
    results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll(":400009", gg.TYPE_BYTE)
    end
    gg.processResume()
    gg.clearResults()
end

function fakewheelforune()
    gg.setVisible(false)
    local input = gg.prompt({"💰 اكتب سعر منتج الفيش:"}, nil, {"number"})
    if input and tonumber(input[1]) then
        gg.searchNumber(input[1], gg.TYPE_DOUBLE)
        local results = gg.getResults(100000)
        if #results > 0 then
            gg.editAll("-99999999", gg.TYPE_DOUBLE)
            gg.toast("✅ تم التعديل بنجاح")
        else
            gg.alert("⚠️ لم يتم العثور على القيمة المطلوبة")
        end
        gg.clearResults()
    else
        gg.alert("⚠️ الرجاء إدخال رقم صحيح.")
    end
end


--|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|--

function FARM_MENU()
    local farm = gg.choice({
        "🎣 تثبيت الصنارة + الحظ",
        "🐟 إضافة طعم السمك",
        "🪂 دعوة الزوار",
        "⭐ فتح النجمة الثالثة للزوار",        
        "🏷️ تذاكر التنظيف",
        "🐾 تكبير بالخارق",
        "🏠 رفع بيت خالد",
        "🐠 حظ المأكولات البحرية",
        --"تحديد جنس الحيوان الاليف"
        --"تقليل استهلاك تلقائي كعكة الميلاد"
        --"المهام اليومية"
        --"فتح الكشك"
        --"الحروف والديكورات"
        --"رفع المستوى"
        --"زرع المختبر"
        --"زرع البوط"
        
        "↩️ رجوع"
    }, nil, "🌾 قائمة تفعيلات المزرعة")

    if farm == nil then return end

    if farm == 1 then
        fishingrodLuckBoost()
    elseif farm == 2 then
        fishBait()
    elseif farm == 3 then
        invitevisitor()
    elseif farm == 4 then
        visitor3Star()
    elseif farm == 5 then
        cleanTickets()
    elseif farm == 6 then
        feedingHack()
    elseif farm == 7 then
        raiseHouse()
    elseif farm == 8 then
        seafoodLuck()
    elseif farm == 9 then
        menuState.farm = false
        menuState.main = true
        mainMenu()
        return 
    end
end

function fishingrodLuckBoost()
    gg.setVisible(false)
    local targets = { ":fish_jump_power", ":fish_stamina_growth", ":fish_lv1", ":fish_lv2" }
    for _, value in ipairs(targets) do
        gg.searchNumber(value, gg.TYPE_BYTE)
        local results = gg.getResults(100000)
        if #results > 0 then
            gg.editAll("0", gg.TYPE_BYTE)
        end
        gg.clearResults()
    end
    gg.unrandomizer(8000000, 0, 1.0, 0.0)
    gg.toast("✅ تم التفعيل")
end



function fishBait()
    gg.processResume()
    gg.searchNumber("200;1000", gg.TYPE_DWORD)
    gg.refineNumber("1000", gg.TYPE_DWORD)
    local revert = gg.getResults(100000)
    if #revert > 0 then
        gg.editAll("9999999", gg.TYPE_DWORD)
    end

    gg.clearResults()
    gg.searchNumber("200;1200", gg.TYPE_DWORD)
    gg.refineNumber("1200", gg.TYPE_DWORD)
    revert = gg.getResults(100000)
    if #revert > 0 then
        gg.editAll("9999999", gg.TYPE_DWORD)
    end

    gg.clearResults()
    gg.processResume()
    gg.toast("✅ تم إضافة مساحة لطعم السمك")
end



function invitevisitor()
    gg.setVisible(false)
    local patterns = { "467D;1E", "1095", "36;162" }
    for _, p in ipairs(patterns) do
        gg.searchNumber(p, gg.TYPE_DOUBLE)
        local results = gg.getResults(100000)
        if #results > 0 then
            gg.editAll("0", gg.TYPE_DOUBLE)
        end
        gg.clearResults()
    end
    gg.toast("✅ تم تفعيل دعوة الزوار")
end


function visitor3Star()
    gg.setVisible(false)
    gg.searchNumber("1;3;2;20;4;5;6;14::999", gg.TYPE_DOUBLE)
    gg.refineNumber("1", gg.TYPE_DOUBLE)
    local revert = gg.getResults(100000)
    if #revert > 0 then
        gg.editAll("0", gg.TYPE_DOUBLE)
        gg.toast("✅ تم فتح النجمة الثالثة للزوار")
    end
    gg.clearResults()
end


function cleanTickets()
    gg.alert("🏷️ حدد الجيران قبل تفعيل تذاكر التنظيف.")
    gg.setVisible(false)
    gg.searchNumber("300;20", gg.TYPE_DOUBLE)
    gg.refineNumber("20", gg.TYPE_DOUBLE)
    local results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("300", gg.TYPE_DOUBLE)
        gg.toast("✅ تم تفعيل التذاكر")
    else
        gg.toast("⚠️ لم يتم العثور على القيم المطلوبة")
    end
    gg.clearResults()
end

function feedingHack()
    gg.setVisible(false)
    gg.searchNumber("161;50", gg.TYPE_DOUBLE)
    gg.refineNumber("50", gg.TYPE_DOUBLE)
    local results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("0", gg.TYPE_DOUBLE)
        gg.toast("✅ تم تفعيل التكبير بالخارج")
    else
        gg.toast("⚠️ لم يتم العثور على القيم المطلوبة")
    end
    gg.clearResults()
end

function raiseHouse()
    gg.setVisible(false)
    gg.searchNumber("50000;5;1", gg.TYPE_DWORD)
    gg.refineNumber("1", gg.TYPE_DWORD)
    local revert = gg.getResults(100000)
    if #revert > 0 then
        gg.editAll("1000", gg.TYPE_DWORD)
    end

    gg.clearResults()
    gg.searchNumber(":size_y", gg.TYPE_BYTE)
    revert = gg.getResults(100000)
    if #revert > 0 then
        gg.editAll("0", gg.TYPE_BYTE)
    end

    gg.clearResults()
    gg.toast("✅ تم تفعيل رفع بيت خالد")
end


function seafoodLuck()
    gg.setVisible(false)
    local choices = gg.multiChoice({
        "✅ تفعيل الكل",
        "🌿 (أعشاب الخليج) سماد عادي وخارق",
        "🟢 (أعشاب البحر) صلصال الطحالب",
        "🐚 (صدفة) لؤلؤ",
        "🐌 (حلزون البحر البزاق) قوقعة حلزون البحر",
        "🌺 (مرجان) غصن + شرائح مرجان",
        "⭐ (نجم البحر) بيض نجم البحر",
        "🐙 (الأخطبوط) مفرقعة الحبر",
        "🦀 (السلطعون) كرات الجمبري",
        "🍤 (جمبري أبوسوم) حزمة طعام السمك",
        "🦞 (كابوريا الطين) ستيك سلطعون",
        "🦞🥚 (الكابوريا) ستيك + بطارخ سلطعون",
        "❄️🦀 (سلطعون مثلج) سلطعون لازق",
        "🦀🐸 (سلطعون الضفدع الأحمر) بطارخ سلطعون",
        "↩️ رجوع"
    }, nil, "اختار اللي عايز تصنعه من المأكولات البحرية 🐠")

    if not choices then return end  
    
    if choices[15] then
        return
    end
    
    if choices[1] then
        for i = 2, 14 do
            choices[i] = true
        end
    end

    local items = {
        {search="5011;7;500017;5", refine="7;5"},
        {search="31031;15", refine="15"},
        {search="31022;50", refine="50"},
        {search="31023;30", refine="30"},
        {search="31032;20;31027;30", refine="20;30"},
        {search="31028;30", refine="30"},
        {search="31030;20", refine="20"},
        {search="31024;50", refine="50"},
        {search="700052;10", refine="10"},
        {search="31025;40", refine="40"},
        {search="31026;6;31025;15", refine="6;15"},
        {search="31036;50", refine="50"},
        {search="31026;15", refine="15"}
    }

    local modified = false
    
    for i = 2, 14 do
        if choices[i] then
            local item = items[i-1]
            gg.clearResults()
            gg.searchNumber(item.search, gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
            gg.refineNumber(item.refine, gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
            
            local revert = gg.getResults(100000)
            if revert and #revert > 0 then
                gg.editAll("100", gg.TYPE_DOUBLE)
                modified = true
                gg.toast("تم التفعيل" .. (i-1))
            else
                gg.toast("⚠️ لم يتم العثور على قيم العنصر " .. (i-1))
            end
            gg.clearResults()
        end
    end

    if modified then
        gg.toast("✅ تم التفعيل المنتجات المحددة ")
    else
        gg.toast("⚠️ لم يتم تعديل أي عنصر")
    end
end



--|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|--

function ISLAND_MENU()
    local island = gg.choice({
        "⭐ فتح نجوم الآلات",
        --"المستشفى"
        --"تخطي نقاط المصانع"
        --"الغواصة "
        --"زرع البندورة"
        "↩️ رجوع"
    }, nil, "🏝️ قائمة تفعيلات الجزيرة")

    if island == nil then return end

    if island == 1 then
        unlockMachineStars()
    elseif island == 2 then
             menuState.island = false
             menuState.main = true
             mainMenu()
             return 
    end
end



function unlockMachineStars()
    gg.setVisible(false)
    gg.searchNumber("80;600", gg.TYPE_DWORD)
    local results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("0", gg.TYPE_DWORD)
    end
    gg.clearResults()

    gg.searchNumber("1800", gg.TYPE_DWORD)
    results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("0", gg.TYPE_DWORD)
        gg.toast("✅ تم فتح نجوم الآلات")
    end
    gg.clearResults()
end




--|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|--


function CLOUD_ISLAND_MENU()
    local menu = gg.choice({
        "🍄 تصفير زرع السحاب",
        "🌳 تصفير أشجار السحاب",
        "🍩 تصفير كشك المعجنات المنشورية",
        "👗 تصفير بوتيك السحاب",
        "↩️ رجوع"
    }, nil, "☁️ قائمة جزيرة السحاب")

    if menu == nil then return end

    if menu == 1 then
        RESET_CLOUD_PLANTING()
    elseif menu == 2 then
        RESET_CLOUD_TREES()
    elseif menu == 3 then
        RESET_PRISM_DONUTS()
    elseif menu == 4 then
        RESET_CLOUD_BOUTIQUE()
    elseif menu == 5 then
        menuState.cloudIsland = false
        menuState.main = true
        mainMenu()
        return 
    end
end

function RESET_CLOUD_PLANTING()
    gg.setVisible(false)
    gg.clearResults()
    
    gg.searchNumber("90;2049;90~300", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    local savedResults = gg.getResults(100000)
    
    if #savedResults > 0 then
        gg.loadResults(savedResults)
        gg.refineNumber("90", gg.TYPE_DWORD)
        local refinedResults = gg.getResults(100000)
        if #refinedResults > 0 then
            gg.editAll("1", gg.TYPE_DWORD)
        end
        
        gg.loadResults(savedResults)
        gg.refineNumber("300", gg.TYPE_DWORD)
        refinedResults = gg.getResults(100000)
        if #refinedResults > 0 then
            gg.editAll("1", gg.TYPE_DWORD)
        end
    end
    
    gg.clearResults()
    gg.searchNumber("180;2049;180~300", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg.refineNumber("180", gg.TYPE_DWORD)
    local results2 = gg.getResults(100000)
    if #results2 > 0 then
        gg.editAll("1", gg.TYPE_DWORD)
    end
    
    local times = {"7200", "14400", "21600"}
    for _, t in ipairs(times) do
        gg.clearResults()
        gg.searchNumber(t, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(100000)
        if #results > 0 then
            gg.editAll("1", gg.TYPE_DWORD)
        end
    end
    
    gg.processResume()
    gg.clearResults()
    gg.toast("✅ تم تصفير زرع السحاب 🍄")
end

function RESET_CLOUD_TREES()
    local values = {"14400", "18000", "21600", "900", "28800"}
    for _, v in ipairs(values) do
        gg.clearResults()
        gg.searchNumber(v, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local results = gg.getResults(100000)
        if #results > 0 then
            gg.editAll("1", gg.TYPE_DWORD)
        end
    end
    gg.clearResults()
    gg.toast("✅ تم تصفير أشجار السحاب 🌳")
end

function RESET_PRISM_DONUTS()
    gg.clearResults()
    gg.searchNumber("60;90", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("1", gg.TYPE_DOUBLE)
    end
    
    gg.clearResults()
    gg.searchNumber("150", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("1", gg.TYPE_DOUBLE)
    end
     
    gg.processResume()
    gg.clearResults()
    gg.toast("✅ تم تصفير كشك المعجنات المنشورية 🍩")
end

function RESET_CLOUD_BOUTIQUE()
    gg.clearResults()
    gg.searchNumber("15;150", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("1", gg.TYPE_DOUBLE)
    end
    
    gg.clearResults()
    gg.searchNumber("180", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
    local results = gg.getResults(100000)
    if #results > 0 then
        gg.editAll("1", gg.TYPE_DOUBLE)
    end
    
    gg.processResume()
    gg.clearResults()
    gg.toast("✅ تم تصفير بوتيك السحاب 👗")
end




--|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|--



function fastProduction()
    if productionResults then
        showProductionMenu()
        return
    end
    
    gg.alert("سيتم البدء في البحث")
    gg.setVisible(false)
    gg.clearResults()
    gg.searchNumber("10D;2049D;40~180D", gg.TYPE_DWORD)
    productionResults = gg.getResults(100000)
    showProductionMenu()
end

function showProductionMenu()
    local choice = gg.choice({
        "30 ثانية", "42 ثانية", "45 ثانية", "50 ثانية",
        "55 ثانية", "60 ثانية", "70 ثانية", "72 ثانية",
        "75 ثانية", "80 ثانية", "90 ثانية", "100 ثانية",
        "105 ثانية", "110 ثانية", "120 ثانية", "150 ثانية",
        "160 ثانية", "🔁 إعادة البحث", "↩️ رجوع"
    }, nil, "شوف وقت إنتاج الآلة أو الحيوان من دفعة الإنتاج وحدده")

    if choice == nil then return end

    local valueMap = {
        [1]=30,[2]=42,[3]=45,[4]=50,[5]=55,[6]=60,
        [7]=70,[8]=72,[9]=75,[10]=80,[11]=90,[12]=100,
        [13]=105,[14]=110,[15]=120,[16]=150,[17]=160
    }

    if choice >= 1 and choice <= 17 then
        if not productionResults then
            gg.alert("يجب تنفيذ إعادة البحث أولاً.")
            return
        end
        applyProductionEdit(valueMap[choice])
    elseif choice == 18 then
        productionResults = nil
        gg.clearResults()
        fastProduction()
    elseif choice == 19 then
        menuState.production = false 
        menuState.main = true
        mainMenu()
        return 
    end
end

function applyProductionEdit(value)
    local toEdit = {}
    for _, item in ipairs(productionResults) do
        if item.value == value then
            table.insert(toEdit, item)
        end
    end

    if #toEdit > 0 then
        for i = 1, #toEdit do
            toEdit[i].value = 0
            toEdit[i].freeze = true
        end
        gg.setValues(toEdit)
        gg.addListItems(toEdit)
        gg.toast("✅ تم التفعيل")
    else
        gg.toast("⚠️ لم يتم العثور على نتائج للقيمة المحددة")
    end
end


--|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|--


function YELLOW_SHOP_MENU()
    local stayInMenu = true
    while stayInMenu do
        local menuY = gg.choice({
            "🔎 بدأ البحث",
            "🐾 منتجات حيوانات الشحن",
            "🎰 منتجات آلات الكنز",
            "🌀 منتجات المطورات",
            "👑 منتجات مصانع الجزيرة",
            "⛵ منتجات المنتجع",
            "✏️ التعديل اليدوي",
            "🔄 استعادة القيم الأصلية",
            "🔍 إعادة البحث",
            "↩️ رجوع"
        }, nil, "💴 قائمة الشراء بالاصفر")
       
        if menuY == nil then 
            stayInMenu = false
        elseif menuY == 1 then 
            Searching_YELLOW()
        elseif menuY == 2 then 
            showAnimalShippingProducts()
        elseif menuY == 3 then 
            showTreasureMachineProducts()
        elseif menuY == 4 then 
            showPowredProducts()
        elseif menuY == 5 then 
            showFactoryProducts()
        elseif menuY == 6 then 
            showResortProducts()
        elseif menuY == 7 then 
            manualEdit()
        elseif menuY == 8 then 
            restoreOriginalValues()
        elseif menuY == 9 then
            searchPerformed = false
            allResults = {}
            searchResults = {}
            Searching_YELLOW()
        elseif menuY == 10 then
            stayInMenu = false
            menuState.yellowShop = false
            menuState.main = true
            mainMenu()
        end
        gg.setVisible(false)
    end
end

function Searching_YELLOW()
    -- البحث الأول مع تحديد نوع DOUBLE
    gg.clearResults()
    local search1 = '500537;2;19;3'
    local search2 = '500391;20115'
    allResults = {} -- إعادة تهيئة المتغير

    gg.searchNumber(search1, gg.TYPE_DOUBLE)
    local res1 = gg.getResults(100000)
    for i = 1, #res1 do table.insert(allResults, res1[i]) end
    gg.clearResults()

    gg.searchNumber(search2, gg.TYPE_DOUBLE)
    local res2 = gg.getResults(100000)
    for i = 1, #res2 do table.insert(allResults, res2[i]) end
    gg.clearResults()

    -- فحص وجود نتائج
    if #allResults == 0 then
        gg.alert("⚠️ لم يتم العثور على نتائج، سيتم عرض القائمة.")
        return
    end

    gg.toast("🎉 تم جمع النتائج بنجاح")

    -- تعديل القيم 2 و 3 إلى 9999
    local function modifyStaticValues()
       local modified = {}
       for i, v in ipairs(allResults) do
           if math.abs(v.value - 2) < 0.001 or math.abs(v.value - 3) < 0.001 then
               v.value = 9999
               table.insert(modified, v)
          end
       end
       if #modified > 0 then
           gg.setValues(modified)
           gg.toast("✅ تم تعديل القيم الثابتة")
       end
   end

   modifyStaticValues()

   -- استخراج نتائج الأكواد المحددة من النتائج المجمعة
   searchResults = {
       res500537 = {},
       res19 = {},
       res500391 = {},
       res20115 = {}
   }

   local function isEqual(val, target)
     return math.abs(val - target) < 0.001
   end

    for _, v in ipairs(allResults) do
       if isEqual(v.value, 500537) then
           table.insert(searchResults.res500537, v)
       elseif isEqual(v.value, 19) then
           table.insert(searchResults.res19, v)
       elseif isEqual(v.value, 500391) then
           table.insert(searchResults.res500391, v)
       elseif isEqual(v.value, 20115) then
           table.insert(searchResults.res20115, v)
       end
    end
    
    searchPerformed = true
    gg.toast("تم تحضير النتائج للتعديل")
end

function manualEdit()
    if not searchPerformed then
        gg.alert("⚠️ يجب إجراء البحث أولاً!")
        return
    end
    
    local codes = {}
    local input = gg.prompt({
        "الكود الأول :",
        "الكود الثاني :",
        "الكود الثالث :",
        "الكود الرابع :"
    }, {nil, nil, nil, nil}, {"number", "number", "number", "number"})
    
    if not input then return end
    
    -- تعيين القيمة الافتراضية 610015 لأي خانة فارغة أو غير رقمية
    for i = 1, 4 do
        local val = tonumber(input[i])
        codes[i] = val or 610015.0
    end
    
    applyOption(codes)
    gg.setVisible(false)
end

function restoreOriginalValues()
    if not searchPerformed then
        gg.alert("⚠️ يجب إجراء البحث أولاً!")
        return
    end
    
    local anyRestored = false
    
    -- استعادة القيم الأصلية مع التحويل إلى DOUBLE
    if #searchResults.res500537 > 0 then
        anyRestored = true
        for i, v in ipairs(searchResults.res500537) do
            v.value = 500537.0
        end
        gg.setValues(searchResults.res500537)
    end
    
    if #searchResults.res19 > 0 then
        anyRestored = true
        for i, v in ipairs(searchResults.res19) do
            v.value = 19.0
        end
        gg.setValues(searchResults.res19)
    end
    
    if #searchResults.res500391 > 0 then
        anyRestored = true
        for i, v in ipairs(searchResults.res500391) do
            v.value = 500391.0
        end
        gg.setValues(searchResults.res500391)
    end
    
    if #searchResults.res20115 > 0 then
        anyRestored = true
        for i, v in ipairs(searchResults.res20115) do
            v.value = 20115.0
        end
        gg.setValues(searchResults.res20115)
    end
    
    if anyRestored then
        gg.toast("تم استعادة القيم الأصلية بنجاح!")
    else
        gg.alert("⚠️ لم يتم العثور على قيم للاستعادة")
    end
    gg.setVisible(false)
end
    
function applyOption(codes)
    if not searchPerformed then
        gg.alert("⚠️ يجب إجراء البحث أولاً!")
        return
    end
    
    -- التحقق من وجود النتائج قبل التعديل
    local anyFound = false
    
    -- تطبيق الأكواد على النتائج مع التحويل إلى DOUBLE
    if #searchResults.res500537 > 0 then
        anyFound = true
        for i, v in ipairs(searchResults.res500537) do
            v.value = codes[1] or 610015
            v.value = v.value + 0.0 -- تأكيد التحويل إلى DOUBLE
        end
        gg.setValues(searchResults.res500537)
    end
    
    if #searchResults.res19 > 0 then
        anyFound = true
        for i, v in ipairs(searchResults.res19) do
            v.value = codes[2] or 610015
            v.value = v.value + 0.0
        end
        gg.setValues(searchResults.res19)
    end
    
    if #searchResults.res500391 > 0 then
        anyFound = true
        for i, v in ipairs(searchResults.res500391) do
            v.value = codes[3] or 610015
            v.value = v.value + 0.0
        end
        gg.setValues(searchResults.res500391)
    end
    
    if #searchResults.res20115 > 0 then
        anyFound = true
        for i, v in ipairs(searchResults.res20115) do
            v.value = codes[4] or 610015
            v.value = v.value + 0.0
        end
        gg.setValues(searchResults.res20115)
    end
    
    if anyFound then
        gg.toast("تم التعديل بنجاح!")
    else
        gg.alert("⚠️ لم يتم العثور على قيم للتعديل")
    end
    gg.setVisible(false)
end

function showAnimalShippingProducts()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🐣 بيضة القرن - ريش النحام الوردي - بتلة خيزران - حليب غزال المحظوظ",
            "🦃 قدم ديك رومي - ريشة يونيكورن - ريشة فينكس - مخمل رنة الاحتفال",
            "🐎 شعر حصان عيد الحب - زيت اعماق البحر - ذيل ثعلب الحظ - صوف ألبكة وردية",
            "🐟 سمكة مجمدة - وسادة الباندا الحمراء - نقشة نمر ساكورا - وسادة قضامة البحر",
            "🦏 الكركدن المنحوت - وسادة رقبة الفيل - حقيبة هدية الكريسماس - حلوى قصب الكريسماس",
            "💖 ريشة على شكل قلب - صوف متعدد الالوان",
            "🔙 رجوع"
        }, nil, "🐾 منتجات حيوانات الشحن")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({41055, 41057, 41061, 41073})
        elseif choice == 2 then 
            applyOption({41079, 41081, 41083, 41085})
        elseif choice == 3 then 
            applyOption({41087, 41091, 41093, 41095})
        elseif choice == 4 then 
            applyOption({41097, 41099, 41101, 41103})
        elseif choice == 5 then 
            applyOption({41105, 41107, 41109, 41111})
        elseif choice == 6 then 
            applyOption({41113, 41115, 41117, 41119})
        elseif choice == 7 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showPuffedPastryMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🥐 1-4 أول 4 منتجات من آلة الفطائر المنفوخة",
            "🧁 5-6 آخر منتجين من آلة الفطائر المنفوخة",
            "↩️ رجوع"
        }, nil, "🍪 آلة الفطائر المنفوخة")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({207801, 207802, 207803, 207804})
        elseif choice == 2 then 
            applyOption({207805, 207806, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showAgedJuiceMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🍹 1-4 أول 4 منتجات من آلة عصير الفواكه المعتقة",
            "🍷 5-6 آخر منتجين من آلة عصير الفواكه المعتقة",
            "↩️ رجوع"
        }, nil, "🍇 آلة عصير الفواكه المعتقة")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({208101, 208102, 208103, 208104})
        elseif choice == 2 then 
            applyOption({208105, 208106, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showEternalFlowerMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🌸 1-4 أول 4 منتجات من آلة الزهرة الخالدة",
            "💮 5-6 آخر منتجين من آلة الزهرة الخالدة",
            "↩️ رجوع"
        }, nil, "🌺 آلة الزهرة الخالدة")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({208301, 208302, 208303, 208304})
        elseif choice == 2 then 
            applyOption({208305, 208306, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showCroissantMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🥐 1-4 أول 4 منتجات من آلة الكرواسون",
            "🥖 5-6 آخر منتجين من آلة الكرواسون",
            "↩️ رجوع"
        }, nil, "🍞 آلة الكرواسون")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({208501, 208502, 208503, 208504})
        elseif choice == 2 then 
            applyOption({208505, 208506, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showGlovesMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🧤 1-4 أول 4 منتجات من آلة القفازات",
            "🧦 5-6 آخر منتجين من آلة القفازات",
            "↩️ رجوع"
        }, nil, "🧵 آلة القفازات")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({208801, 208802, 208803, 208804})
        elseif choice == 2 then 
            applyOption({208805, 208806, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showMilkPuddingMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🍮 1-4 أول 4 منتجات من آلة المهلبية",
            "🥛 5-6 آخر منتجين من آلة المهلبية",
            "↩️ رجوع"
        }, nil, "🍶 آلة المهلبية")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({208901, 208902, 208903, 208904})
        elseif choice == 2 then 
            applyOption({208905, 208906, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showMagicWandMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🪄 1-4 أول 4 منتجات من آلة العصا السحرية",
            "✨ 5-6 آخر منتجين من آلة العصا السحرية",
            "↩️ رجوع"
        }, nil, "🔮 آلة العصا السحرية")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({209201, 209202, 209203, 209204})
        elseif choice == 2 then 
            applyOption({209205, 209206, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showCottonCandyMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🍭 1-4 أول 4 منتجات من آلة حلوى غزل البنات",
            "🍬 5-6 آخر منتجين من آلة حلوى غزل البنات",
            "↩️ رجوع"
        }, nil, "🎪 آلة حلوى غزل البنات")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({209401, 209402, 209403, 209404})
        elseif choice == 2 then 
            applyOption({209405, 209406, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showParfaitMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🍧 1-4 أول 4 منتجات من آلة البارفيه",
            "🍨 5-6 آخر منتجين من آلة البارفيه",
            "↩️ رجوع"
        }, nil, "🍦 آلة البارفيه")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({209601, 209602, 209603, 209604})
        elseif choice == 2 then 
            applyOption({209605, 209606, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showCreamPuffMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🧁 1-4 أول 4 منتجات من آلة كريم باف",
            "🍰 5-6 آخر منتجين من آلة كريم باف",
            "↩️ رجوع"
        }, nil, "🧈 آلة كريم باف")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({209801, 209802, 209803, 209804})
        elseif choice == 2 then 
            applyOption({209805, 209806, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showSnowballMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "❄️ 1-4 أول 4 منتجات من آلة كرة الثلج",
            "⛄ 5-6 آخر منتجين من آلة كرة الثلج",
            "↩️ رجوع"
        }, nil, "🌨️ آلة كرة الثلج")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({210001, 210002, 210003, 210004})
        elseif choice == 2 then 
            applyOption({210005, 210006, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showDorayakiMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🥞 1-4 أول 4 منتجات من آلة الدوراياكي",
            "🍘 5-6 آخر منتجين من آلة الدوراياكي",
            "↩️ رجوع"
        }, nil, "🍡 آلة الدوراياكي")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({209301, 209302, 209303, 209304})
        elseif choice == 2 then 
            applyOption({209305, 209306, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showToothpasteMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🦷 1-4 أول 4 منتجات من آلة معجون الأسنان",
            "🧴 5-6 آخر منتجين من آلة معجون الأسنان",
            "↩️ رجوع"
        }, nil, "🧼 آلة معجون الأسنان")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({210201, 210202, 210203, 210204})
        elseif choice == 2 then 
            applyOption({210205, 210206, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showTreasureMachineProducts()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🍪 آلة الفطائر المنفوخة",
            "🍹 آلة عصير الفواكه المعتقة",
            "🌸 آلة الزهرة الخالدة",
            "🥐 آلة الكرواسون",
            "🧤 آلة القفازات",
            "🍮 آلة المهلبية",
            "🪄 آلة العصا السحرية",
            "🍭 آلة حلوى غزل البنات",
            "🍧 آلة البارفيه",
            "🧁 آلة كريم باف",
            "❄️ آلة كرة الثلج",
            "🥞 آلة الدوراياكي",
            "🦷 آلة معجون الأسنان",
            "🔙 رجوع"
        }, nil, "🎰 منتجات آلات الكنز")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            showPuffedPastryMachine()
        elseif choice == 2 then 
            showAgedJuiceMachine()
        elseif choice == 3 then 
            showEternalFlowerMachine()
        elseif choice == 4 then 
            showCroissantMachine()
        elseif choice == 5 then 
            showGlovesMachine()
        elseif choice == 6 then 
            showMilkPuddingMachine()
        elseif choice == 7 then 
            showMagicWandMachine()
        elseif choice == 8 then 
            showCottonCandyMachine()
        elseif choice == 9 then 
            showParfaitMachine()
        elseif choice == 10 then 
            showCreamPuffMachine()
        elseif choice == 11 then 
            showSnowballMachine()
        elseif choice == 12 then 
            showDorayakiMachine()
        elseif choice == 13 then 
            showToothpasteMachine()
        elseif choice == 14 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showPowredProducts()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🐄 مطور البقرة",
            "🐃 مطور الثور",
            "🦌 مطور الغزال",
            "🐑 مطور الخاروف",
            "🐓 مطور الدجاج",
            "🐇 مطور الأرنب",
            "🦚 مطور الطاووس",
            "🦃 مطور الديك الرومي",
            "🦩 مطور النعامة",
            "🥛 مطور معمل الألبان",
            "🌪️ مطور الطاحونة",
            "🥖 مطور المخبز",
            "🍷 مطور آلة العصير",
            "🍾 مطور العصارة",
            "🍓 مطور آلة المربى",
            "🍅 مطور آلة الصلصة",
            "🍔 مطور آلة البرغر",
            "🍬 مطور آلة صنع الحلوى",
            "🍭 مطور آلة السكر",
            "💐 مطور آلة باقة الورود",
            "🥩 مطور آلة البسطرمة",
            "🧸 مطور آلة الدمى",
            "🔙 رجوع"
        }, nil, "🌀 منتجات المطورات")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({22001, 22003, 22004, 610015})
        elseif choice == 2 then 
            applyOption({22067, 22068, 22069, 22070})
        elseif choice == 3 then 
            applyOption({22055, 22056, 22058, 610015})
        elseif choice == 4 then 
            applyOption({22075, 22076, 22077, 22078})
        elseif choice == 5 then 
            applyOption({22021, 22022, 22023, 22025})
        elseif choice == 6 then 
            applyOption({22035, 22036, 22037, 22038})
        elseif choice == 7 then 
            applyOption({22079, 22080, 22081, 22082})
        elseif choice == 8 then 
            applyOption({22089, 22090, 22091, 22092})
        elseif choice == 9 then 
            applyOption({22085, 22086, 22087, 22088})
        elseif choice == 10 then 
            applyOption({22002, 22005, 22006, 22007})
        elseif choice == 11 then 
            applyOption({22009, 22010, 22024, 610015})
        elseif choice == 12 then 
            applyOption({22063, 22064, 22066, 610015})
        elseif choice == 13 then 
            applyOption({22031, 22032, 22034, 610015})
        elseif choice == 14 then 
            applyOption({22043, 22044, 22045, 610015})
        elseif choice == 15 then 
            applyOption({22026, 22027, 22029, 610015})
        elseif choice == 16 then 
            applyOption({22047, 22048, 22050, 610015})
        elseif choice == 17 then 
            applyOption({22039, 22040, 22042, 610015})
        elseif choice == 18 then 
            applyOption({22059, 22060, 22062, 610015})
        elseif choice == 19 then 
            applyOption({22051, 22052, 22054, 610015})
        elseif choice == 20 then 
            applyOption({22071, 22072, 22073, 22074})
        elseif choice == 21 then 
            applyOption({22098, 22099, 22100, 22101})
        elseif choice == 22 then 
            applyOption({22094, 22095, 22096, 22097})
        elseif choice == 23 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showGrills()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🔥 لحم مشوي - ديك رومي - جمبري- لحم مشوي",
            "🔥 بطاطا مشوية - فطر - ثوم - باذنجان",
            "↩️ رجوع"
        }, nil, "🔥 آلة المشويات")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({20116, 20163, 20165, 20166})
        elseif choice == 2 then 
            applyOption({20169, 20168, 21067, 20170})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showSwimming()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "⚓ البطة - الاناناس - الاوزة",
            "⚓ البطيخ - افوكادو",
            "↩️ رجوع"
        }, nil, "⚓ آلة دولاب السباحة")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({205104, 205105, 205103, 610015})
        elseif choice == 2 then 
            applyOption({205101, 205102, 610015, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showFactoryProducts()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🔧 صامولة - برغى ملولب - مسمار مفتاح برغي",
            "⭐ سبيكة نحاسية - فضية - حديد - ذهبية",
            "💎 ألماس - مفك براغي",
            "🌳 اسطوانة خشبية - خشبة - لوح خشبي - نشارة خشب",
            "🌳 خشب البلوط - خشب الارز - خشب ساندرز",
            "⛏️ حجر طيني- ملح البارود - كوارتز - خام نحاس",
            "⛏️ خام حديد - ذهب - فضة - ألماس هائج",
            "🏮 المرآة - وعاء خزفي - زمرد زجاجي - ياقوت زجاجي",
            "🏮 حمشت ارجواني - زجاج ذهبي - زجاج صلب",
            "🧺 اريج خشبي - علبة تجميل - مرآة تجميل - طاولة الزهور",
            "🧱 حجر قرميد - انبوب ماء - شواء - قدر",
            "💎 حجر الاساس دهبي - فضي - ألماس",
            "👑 قرن وحيد القرن - تاج ذهبي",
            "💊 كبسولة الحيوان - شاش - صندوق انقاذ - بلطة",
            "💣 بارود - ديناميت - قنبلة - برميل بارود",
            "🌰 كستناء - خيزران - اوراق شاي",
            "🌳 اوراق التوت - مطاط - فاكهة دوريان",
            "🔥 آلة المشويات",
            "⚓ آلة دولاب السباحة",
            "☕ مارش قهوة",
            "🔙 رجوع"
        }, nil, "👑 منتجات مصانع الجزيرة")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({620002, 620003, 620004, 620005})
        elseif choice == 2 then 
            applyOption({620007, 620008, 620009, 620010})
        elseif choice == 3 then 
            applyOption({620006, 620011, 610015, 610015})
        elseif choice == 4 then 
            applyOption({630001, 630002, 630003, 630005})
        elseif choice == 5 then 
            applyOption({8013, 8017, 8021, 610015})
        elseif choice == 6 then 
            applyOption({1901, 1909, 1902, 1903})
        elseif choice == 7 then 
            applyOption({1904, 1905, 1907, 1908})
        elseif choice == 8 then 
            applyOption({640001, 640002, 640003, 640004})
        elseif choice == 9 then 
            applyOption({640005, 640006, 640008, 610015})
        elseif choice == 10 then 
            applyOption({610004, 610005, 610006, 610007})
        elseif choice == 11 then 
            applyOption({610008, 610009, 610010, 610011})
        elseif choice == 12 then 
            applyOption({610012, 610013, 610014, 610015})
        elseif choice == 13 then 
            applyOption({610015, 3034, 610015, 3034})
        elseif choice == 14 then 
            applyOption({611001, 611002, 611003, 610015})
        elseif choice == 15 then 
            applyOption({619001, 619002, 619003, 619004})
        elseif choice == 16 then 
            applyOption({8003, 8005, 8007, 610015})
        elseif choice == 17 then 
            applyOption({8009, 8023, 8025, 610015})
        elseif choice == 18 then 
            showGrills()
        elseif choice == 19 then 
            showSwimming()
        elseif choice == 20 then 
            applyOption({203001, 203001, 203001, 203001})
        elseif choice == 21 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showFountain()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "دبوس وردة - سمكة الشمس - لؤلؤة القمر - نجمة النجوم",
            "أخشاب الطفو - جوهر المياه - باقة خضراء - نسغ جوز الهند",
            "جرعة بديلة صغيرة - جرعة بديلة كبيرة",
            "↩️ رجوع"
        }, nil, "?? نافورة الوفرة")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({3171105, 3171106, 3171107, 3171108})
        elseif choice == 2 then 
            applyOption({3171009, 3171110, 3171111, 3171112})
        elseif choice == 3 then 
            applyOption({3171114, 3171115, 610015, 610015})
        elseif choice == 4 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showSashemi()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "سكلوب - اورشين - سلمون - حبار",
            "اخطبوط - سلطعون - ماكريل - قريدس",
            "↩️ رجوع"
        }, nil, "🥡 آلة الساشيمي")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({203501, 203502, 203503, 203504})
        elseif choice == 2 then 
            applyOption({203505, 203506, 203507, 203508})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showLightFlower()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "نرجس - سرخس - بابونج - زهرة زهرية",
            "زهرة العسل - لوتس - زهرة بيضاء",
            "↩️ رجوع"
        }, nil, "🏵️ آلة الزهرة الضوئي")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({203401, 203402, 203403, 203404})
        elseif choice == 2 then 
            applyOption({203405, 203406, 203407, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showBoats()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "بط اصفر - الاوزة - نعامة",
            "طاووس - نورس ميو - ببغاء",
            "↩️ رجوع"
        }, nil, "🦜 آلة القوارب")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({203601, 203602, 203603, 610015})
        elseif choice == 2 then 
            applyOption({203604, 203605, 203606, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showUmbrella()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "عشب البحر - الكيوي - الشمام - البطيخ",
            "قوس قزح - ندفة المياه - قنفذ البحر - المحار العملاقة",
            "↩️ رجوع"
        }, nil, "🌂 آلة المظلات")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({204001, 204002, 204003, 204004})
        elseif choice == 2 then 
            applyOption({204005, 204006, 204007, 204008})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showTishert()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "الزهور الوردية - الزرقاء - عباد الشمس - الدب",
            "الطحالب - زهرة الفقاعات - الحبار",
            "↩️ رجوع"
        }, nil, "👔 آلة القمصان")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({203901, 203902, 203903, 203904})
        elseif choice == 2 then 
            applyOption({203905, 203906, 203907, 610015})
        elseif choice == 3 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showResortMachine()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🥡 آلة الساشيمي",
            "🏵️ آلة الزهرة الضوئية",
            "🦜 آلة القوارب",
            "🌂 آلة المظلات",
            "👔 آلة القمصان",
            "🔙 رجوع"
        }, nil, "🌂 آلات المنتجع")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            showSashemi()
        elseif choice == 2 then 
            showLightFlower()
        elseif choice == 3 then 
            showBoats()
        elseif choice == 4 then 
            showUmbrella()
        elseif choice == 5 then 
            showTishert()
        elseif choice == 6 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end

function showResortProducts()
    local stayInMenu = true
    while stayInMenu do
        local choice = gg.choice({
            "🐙 حيوانات المنتجع",
            "🌂 آلات المنتجع",
            "🧪 نافورة الوفرة",
            "🔙 رجوع"
        }, nil, "⛵ منتجات المنتجع")
        
        if choice == nil then 
            stayInMenu = false
        elseif choice == 1 then 
            applyOption({41045, 41047, 41049, 41051})
        elseif choice == 2 then 
            showResortMachine()
        elseif choice == 3 then 
            showFountain()
        elseif choice == 4 then 
            stayInMenu = false
        end
        gg.setVisible(false)
    end
end




--|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|--


--|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|•|--

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        if menuState.main then
            mainMenu()
        elseif menuState.wahmi then
            WAHMI()    
        elseif menuState.farm then
            FARM_MENU()
        elseif menuState.island then
            ISLAND_MENU()    
        elseif menuState.cloudIsland then
            CLOUD_ISLAND_MENU()    
        elseif menuState.production then
            fastProduction()
        elseif menuState.yellowShop then
            YELLOW_SHOP_MENU()
        end
    end
    gg.sleep(100)
end 