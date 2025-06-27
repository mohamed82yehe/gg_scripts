-- options
local scriptName = [=====[Script for FamilyFarm 9.4.100]=====]
local scriptVersion = '1.0.0'
local scriptAuthor = 'User'
local startToast = ''
-- 0 - no check; 1 - check package only, 2 - check package and build
local checkTarget = 0

local targetName = [=====[FamilyFarm]=====]
local targetPkg = 'com.funplus.familyfarm'
local targetVersion = [=====[9.4.100]=====]
local targetBuild = 630

-- functions

-- init
gg.require('101.1', 16142)

if startToast ~= '' then startToast = '\n'..startToast end
gg.toast(scriptName..' v'..scriptVersion..' by '..scriptAuthor..startToast)

if checkTarget ~= 0 then
 local info = gg.getTargetInfo()
 local check = false
 local current = false
 if checkTarget >= 1 then
  check = targetPkg
  current = info.packageName
 end
 if checkTarget >= 2 then
  check = check..' '..targetVersion..' ('..targetBuild..')'
  current = current..' '..info.versionName..' ('..info.versionCode..')'
 end
 if check ~= current then
  gg.alert('This script for "'..targetName..'" ['..check..'].\nYou select "'..info.label..'" ['..current..'].\nNow script exit.')
  os.exit()
 end
end
local revert = nil

-- main code

gg.setVisible(false)
gg.clearResults()
gg.searchNumber("8245935277855761735", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("0", gg.TYPE_QWORD)

gg.clearResults()
gg.setVisible(false)
gg.searchNumber("1500;20", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("20", gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(100000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("999999", gg.TYPE_DOUBLE)
gg.clearResults()
