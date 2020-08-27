function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) xgsl = xgsl + 1 end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) xgjg = true end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据") else gg.toast(qmnb[2]["name"] .. "开启失败") end end end end
--配置↑↑↑勿修改，调用方法   xqmnb(qmnb)
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, Loading1) for x = 1, #(Loading1) do xgpy = szpy + Loading1[x]["address"] xglx = Loading1[x]["flags"] xgsz = Loading1[x]["value"] xgdj = Loading1[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function LoadingQ(Loading) gg.setRanges(Loading[1]["memory"]) gg.searchNumber(Loading[3]["value"], Loading[3]["flags"]) if gg.getResultCount() == 0 then gg.toast(Loading[2]["Projects"] .. "Load失败❌") else gg.refineNumber(Loading[3]["value"], Loading[3]["flags"]) gg.refineNumber(Loading[3]["value"], Loading[3]["flags"]) gg.refineNumber(Loading[3]["value"], Loading[3]["flags"]) if gg.getResultCount() == 0 then gg.toast(Loading[2]["Projects"] .. "Load失败❌") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(Loading) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + Loading[v]["address"] pysz[1].flags = Loading[v]["flags"] szpy = gg.getValues(pysz) pdpd = Loading[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, Loading1) end end if xgjg == true then 
end end end end
function edit(orig,ret)_om=orig[1].memory or orig[1][1]_ov=orig[3].value or orig[3][1]_on=orig[2].name or orig[2][1]
gg.clearResults()gg.setRanges(_om)gg.searchNumber(_ov,orig[3].type or orig[3][2])sz=gg.getResultCount()if sz<1 then gg.toast(_on.." 开启失败")else sl=gg.getResults(50000)for i=1,sz do ist=true for v=4,#orig do if ist==true and sl[i].value==_ov then cd={{}}cd[1].address=sl[i].address+(orig[v].offset or orig[v][2])cd[1].flags=orig[v].type or orig[v][3]szpy=gg.getValues(cd)cdlv=orig[v].lv or orig[v][1]cdv=szpy[1].value if cdlv==cdv then pdjg=true ist=true else pdjg=false ist=false end end end if pdjg==true then szpy=sl[i].address for x=1,#(ret)do xgpy=szpy+(ret[x].offset or ret[x][2])xglx=ret[x].type or ret[x][3]xgsz=ret[x].value or ret[x][1]xgdj=ret[x].freeze or ret[x][4]xgsj={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xgsj[1].freeze=xgdj gg.addListItems(xgsj)else gg.setValues(xgsj)end end xgjg=true end end if xgjg==true then gg.toast(_on.." 开启成功")else gg.toast(_on.." 开启失败")end end end
local app = {}
--设置搜索模式
app.memorySearchMode = function(MEMORY) 
if (MEMORY == 2) then
gg.setRanges(gg.REGION_JAVA_HEAP | gg.REGION_C_HEAP | gg.REGION_C_ALLOC | gg.REGION_C_DATA | gg.REGION_C_BSS | gg.REGION_PPSSPP) 
end 
if (MEMORY == -1) then
gg.setRanges(gg.REGION_VIDEO) 
end 
if (MEMORY == -2) then 
gg.setRanges(gg.REGION_CODE_APP | gg.REGION_CODE_SYS)         
end 
if (MEMORY == 0) then 
gg.setRanges(gg.REGION_ANONYMOUS)
end        
end
function checkType(dataType)	local type 
if dataType =="D" or dataType == "D" then 
type = gg.TYPE_DWORD 
end 
if dataType == "F" then 
type = gg.TYPE_FLOAT 
end 
if dataType == "E" then 
type = gg.TYPE_DOUBLE 
end 
if dataType == "B" or dataType == "B" then 
type =  gg.TYPE_BYTE 
end 
if dataType == "W" or dataType == "W" then 
type = gg.TYPE_WORD os.exit() 
end	
return type 
end
app.memorySearch = function(pkgName, isNewSearch, address, tb, dataType)	
gg.clearResults() 
gg.setVisible(false)	local isSucess = gg.searchNumber(tb[1]["lv"], checkType(dataType), false, gg.SIGN_EQUAL, address, -1);	local t = gg.getResults(9999);	local tab = {}	local data = {}	for i=1, #t do	for j=2, #tb do	tab[j] = {} tab[j].address = t[i].address + tb[j]["offset"] if(tb[j]["type"] == nil) then tab[j].flags = t[i].flags else tab[j].flags = checkType(tb[j]["type"]) end tab = gg.getValues(tab)	if (tab[j].value == tb[j]["lv"]) then data[#data+1] = t[i].address end end	end gg.clearResults() return isSucess, data end app.memoryWrite = function(pkgName, address, value, dataType) gg.setVisible(false)	local t = {}	t[1] ={}	t[1].address = address	t[1].flags = checkType(dataType)	t[1].value = value	return gg.setValues(t) end
GG = {Read,Write} 
function GG.ReadWrite(Read,Writw)TZ = {} dataTZ = Read[1] offset = dataTZ[2] for i=1,#Read do TZA = Read[i] LV = {["lv"] = TZA[1],["offset"] = TZA[2]-offset} table.insert(TZ, i, LV) end app.memorySearchMode(Memory) isSuuess,TUG = app.memorySearch(pkgName, true, 0, TZ, Type) if TUG[1] == nil then  else for ii=1,#TUG do for iii=1,#Write do dataxg = Write[iii] value = dataxg[1] Deviant = dataxg[2] app.memoryWrite(pkgName,TUG[ii]+Deviant-offset,value,Type) end end gg.toast(ID.. "开启成功") end end
function SearchWrite(Search, Write, Type)
gg.clearResults()
gg.setVisible(false)
gg.searchNumber(Search[1][1], Type)
local t = gg.getResults(9999)
gg.clearResults()
if t ~= nil then
local r = {}
for j=2, #Search do
for i, v in ipairs(t) do
r[i] = {}
r[i].address = v.address + Search[j][2] - Search[1][2]
r[i].flags = v.flags
end
r = gg.getValues(r)
for i = #t, 1, -1 do
if (tostring(r[i].value) ~= tostring(Search[j][1]) ) then
table.remove(t, i)
table.remove(r, i)
end
end       
end
--写入数据
local r = {}
for i=1, #t do
for j=1, #Write do
r[#r+1] = {}
r[#r].address = t[i].address + Write[j][2] - Search[1][2]
r[#r].flags = t[i].flags
r[#r].value = Write[j][1]
r[#r].freeze = true--冻结的话修改后面加false
end
end
gg.setValues(r)
end
end
--gg.addListItems(r)
function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString)) break end nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len(szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) xgsl = xgsl + 1 end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) xgjg = true end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据") else gg.toast(qmnb[2]["name"] .. "开启失败") end end end end

if gg.PACKAGE  == 'com.hydsxi.rjr' then
else
gg.alert("Gunakan Game Guardian Versi ɢɢ SPJK untuk Menjalankan Script Ini\nUse My Game Guardian To Run Script", "[•] Download")
revo.goURL("https://t.me/spjkchannel")
os.exit()
while true do
end
end

HOME = 1
function HOME()
MENU = gg.multiChoice({
"📀 [Bypass_Lobby] Version_8 [Global/VN/KR]",
"🌐 Reset Client(OFF ON DATA)",
"💐 Wallhack & Collor [Island 1x]",
"🚧 Less Recoil [Game 1x]",
"🎯 Aimbot [Game]",
"🎯 Magic Bullet Only [Game 1x]",
"🎯 Headshot & Magic Bullet 50% [Game 1x]",
"♣️ Black Sky [Game]",
"🧘 Sit Scope [Game]",
"🏃 Speed Hack Micro [Game]",
"🙆 Antena [Game]",
"👣 High View [Game]",
"❌ ------≫ [EXIT SCRIPT]"
},nil,"▬▬▬▬▬▬▬▬▬[ TELEGRAM: @spjkchannel ]▬▬▬▬▬▬▬▬▬\n🇮🇩『SPJK』S PROJECT HACK [VIP]\n🇮🇩 PUBGM 0.19.0 UPDATED 17 Agustus 2020")
if MENU == nil then
else
if MENU [1] == true then bypass2() end
if MENU [2] == true then reset() end
if MENU [3] == true then wh() end 
if MENU [4] == true then less() end
if MENU [5] == true then aimbot() end
if MENU [6] == true then mb() end 
if MENU [7] == true then hs() end 
if MENU [8] == true then blacksky() end
if MENU [9] == true then sit() end
if MENU [10] == true then speed() end
if MENU [11] == true then antena() end
if MENU [12] == true then hv() end
if MENU [13] == true then exit() end
end
SPJKSC = -1
end

function aimbot()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("-1228926272664220957", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber(" -1228926272664220957", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("E00", -1, gg.TYPE_QWORD, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber("-1228926272664220957", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1401)
gg.editAll("-1228926276669014016", gg.TYPE_QWORD)
gg.clearResults()
gg.toast("TELEGRAM: @spjkchannel")
end

function sit()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-0.67914116382599;-0.20633073151112;-0.68966287374496;9.49029350281;0.0064272880554199", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
local t = gg.getResults(0)
gg.searchNumber("9.49029350281", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
local t = gg.getResults(500)
gg.editAll("124", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("TELEGRAM: @spjkchannel")
end

function bypass2()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("2.2958874e-41;16384D;16384D;16384D;16384D;16384D::24", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
if gg.getResultCount() == 0 then
gg.alert("Falue Not Found, Relogin dulu Bos")
os.exit()
else
gg.searchNumber("2.2958874e-41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
resultsCount = gg.getResultCount()
results = gg.getResults(resultsCount)
for _FORV_6_ = 1, resultsCount do
gg.addListItems({[1] = {address = results[_FORV_6_].address + 48,flags = 4,freeze = true,value = 70032}})
gg.addListItems({[1] = {address = results[_FORV_6_].address + 100,flags = 4,freeze = true,value = 4451}})
end
end
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("16610;8388646;8388805", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(50)
gg.editAll("30", gg.TYPE_DWORD)
gg.clearResults()
gg.searchNumber("257D;0~99999F;1D;0D::300", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResultsCount()
gg.searchNumber("0~9999", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("11,932;12,004;32,768;65,536", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
if gg.getResultCount() == 0 then
else
gg.searchNumber("11932", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
jg = gg.getResults(100)
sl = gg.getResultCount()
for _FORV_6_ = 1, sl do
dzy = jg[_FORV_6_].address
gg.addListItems({[1] = {address = dzy,flags = gg.TYPE_DWORD,freeze = true,value = "0"}})
end
gg.clearResults()
end
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("16,777,216;16,777,216;16,843,009;16,843,009", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
if gg.getResultCount() == 0 then
else
gg.searchNumber("16777", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
jg = gg.getResults(100)
sl = gg.getResultCount()
for _FORV_6_ = 1, sl do
dzy = jg[_FORV_6_].address
gg.addListItems({[1] = {address = dzy,flags = gg.TYPE_DWORD,freeze = true,value = "0"}})
end
gg.clearResults()
end
gg.clearResults()
gg.alert("📀[SPJK]_BYPASS_V8")
end

function flashoff()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-1296744153870237696", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(500)
gg.editAll("-1296744149883614555", gg.TYPE_QWORD)
gg.clearResults()
gg.searchNumber("-1904987454002165247", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(500)
gg.editAll("-1904987454010553855", gg.TYPE_QWORD)
gg.clearResults()
end

function mb()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('1.5584387e28', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll('0', gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('1D;0.05000000075F;0.10000000149F;0.55000001192F;9.5F;15.0F', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber('1', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(800)
gg.editAll('0', gg.TYPE_DWORD)
gg.toast("TELEGRAM: @spjkchannel")
end

function flash()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-1296744149883614555", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(500)
gg.editAll("-1296744153870237696", gg.TYPE_QWORD)
gg.clearResults()
gg.searchNumber("-1904987454010553855", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(500)
gg.editAll("-1904987454002165247", gg.TYPE_QWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("50000~100000;0;1;5D~100D::13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1) 
if gg.getResultCount() == 0 then else
gg.searchNumber("50000~100000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(210)
gg.editAll("35125", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("TELEGRAM: @spjkchannel")
end
end

function hv()
gg.setRanges(32)
gg.clearResults()
gg.searchNumber("220;178;15 ", 16, false, 536870912, 0, -1)
gg.searchNumber("220", 16, false, 536870912, 0, -1)
gg.getResults(300)
gg.editAll("400", 16)
gg.clearResults()
gg.toast("TELEGRAM: @spjkchannel")
end

function hs2()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.20161819458;23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResultsCount()
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("180", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("TELEGRAM: @spjkchannel")
end

function antena()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('88.50576019287F;87.27782440186F;-100.91194152832F;1F::13', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber('88.50576019287F;87.27782440186F;1F', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(6)
gg.editAll('1.96875;1.96875;999;1.96875;1.96875;999', gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("TELEGRAM: @spjkchannel")
end

function reset()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA | gg.REGION_CODE_APP)
gg.searchNumber("35651585", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineAddress("91C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll("0", gg.TYPE_DWORD)
gg.sleep(4949)
gg.editAll("35651585", gg.TYPE_DWORD)
gg.refineAddress("SrD", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
gg.clearResults()
gg.toast("Tap OK and Enter match Again")
end

function less()
gg.clearResults()
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("-2.975618345796234E20", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(20)
gg.editAll("100", gg.TYPE_FLOAT)
gg.toast("TELEGRAM: @spjkchannel")
end

function hs()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("9.20161819458;23;25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResultsCount()
gg.searchNumber("25;30.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(10)
gg.editAll("130", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("TELEGRAM: @spjkchannel")
end

function blacksky()
gg.clearResults()
gg.setRanges(131072)
gg.clearResults()
gg.searchNumber("100F;1F;1,008,981,770D:99", 16, false)
gg.searchNumber("100", 16, false)
gg.getResults(100)
gg.editAll("-90", 16)
gg.clearResults()
gg.toast("TELEGRAM: @spjkchannel")
end

function speed()
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("1;1;1;0.0001;20;0.0005;0.4::50", 16, false, 536870912, 0, -1)
gg.searchNumber("1", 16, false, 536870912, 0, -1)
gg.getResults(300)
gg.editAll("1.07", 16)
gg.clearResults()
gg.toast("TELEGRAM: @spjkchannel")
end


function wh()
      MN1 = gg.multiChoice({
        ' ---≫ Wallhack SD400',
        ' ---≫ Wallhack SD410',
        ' ---≫ Wallhack SD415',
        ' ---≫ Wallhack SD425',
        ' ---≫ Wallhack SD430',
        ' ---≫ Wallhack SD435',
        ' ---≫ Wallhack SD450',
        ' ---≫ Wallhack SD615',
        ' ---≫ Wallhack SD625',
        ' ---≫ Wallhack SD626',
        ' ---≫ Wallhack SD636',
        ' ---≫ Wallhack SD653',
        ' ---≫ Wallhack SD660',
        ' ---≫ Wallhack SD665',
        ' ---≫ Wallhack SD670',
        ' ---≫ Wallhack SD710',
        ' ---≫ Wallhack SD712',
        ' ---≫ Wallhack SD800/801',
        ' ---≫ Wallhack SD820/821',
        ' ---≫ Wallhack SD835',
        ' ---≫ Wallhack SD845',
        ' ---≫ Wallhack SD855',
        ' ---≫ Wallhack All Snapdragon',
        ' ---≫ Colour Red HDR',
        ' ---≫ Colour Yellow HDR',
        ' ---≫ Colour Blue HDR',
        ' ---≫ Colour Purple HDR',
        ' ---≫ Colour Red',
        ' ---≫ Colour Pluto',
        ' ---≫ Colour Blue',
        ' ---≫ Colour Yellow',
        ' ---≫ Colour Green',
        ' ---≫ Colour Pink',
        ' ---≫ Colour Purple',
        ' ---≫ Colour Mix',
        ' ---≫ Colour Rainbow',
        ' ---≫ Colour Purple 410',
        ' ---≫ Colour SD400/410 Green',
        ' ---≫ Colour SD400+ Yellow',
        ' ---≫ Colour SD425 Red',
        ' ---≫ Colour SD425 Yellow',
        ' ---≫ Colour SD425 Green',
        ' ---≫ Colour SD425 Mix',
        ' ---≫ Colour SD425 Purple',
        ' ---≫ Colour SD615 Yellow',
        ' ---≫ Colour SD615 Green',
        ' ---≫ Colour SD615 Blue',
        ' ---≫ Colour SD636 Yellow',
        ' ---≫ Colour SD660 Red',
        ' ---≫ Colour SD660 Yellow',
        ' ---≫ Colour SD660 Green',
        ' ---≫ Colour SD665 Yellow',
        ' ---≫ Colour SD665 Green',
        ' ---≫ Colour SD665 Blue',
        ' ---≫ Colour SD712 Red',
        ' ---≫ Colour SD845 Red',
        ' ---≫ Colour SD845 Yellow',
        ' ---≫ Colour SD845 Green',
        ' ---≫ Colour SD845 Blue',
        ' ---≫ Colour SD855 Green',
        ' ---≫ Colour SD855 Yellow',
        ' ---≫ Colour SD855 Red',
        ' ---≫ Colour SD855 Blue',
        '↩ BACK '
      }, nil, '▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬\n『SPJK』S PROJECT HACK 📀 『S13-VIP』\n▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬')
      if MN1 == nil then
      else
        if MN1[1] == true then
          WH400()
        end
        if MN1[2] == true then
          WH410()
        end
        if MN1[3] == true then
          WH415()
        end
        if MN1[4] == true then
          WH425()
        end
        if MN1[5] == true then
          WH430()
        end
        if MN1[6] == true then
          WH435()
        end
        if MN1[7] == true then
          WH450()
        end
        if MN1[8] == true then
          WH615()
        end
        if MN1[9] == true then
          WH625()
        end
        if MN1[10] == true then
          WH626()
        end
        if MN1[11] == true then
          WH636()
        end
        if MN1[12] == true then
          WH653()
        end
        if MN1[13] == true then
          WH660()
        end
        if MN1[14] == true then
          WH665()
        end
        if MN1[15] == true then
          WH670()
        end
        if MN1[16] == true then
          WH710()
        end
        if MN1[17] == true then
          WH712()
        end
        if MN1[18] == true then
          WH800()
        end
        if MN1[19] == true then
          WH820()
        end
        if MN1[20] == true then
          WH835()
        end
        if MN1[21] == true then
          WH845()
        end
        if MN1[22] == true then
          WH855()
        end
        if MN1[23] == true then
          WHALL()
        end
        if MN1[24] == true then
          REDHDR()
        end
        if MN1[25] == true then
          YELLOWHDR()
        end
        if MN1[26] == true then
          BLUEHDR()
        end
        if MN1[27] == true then
          PURPLEHDR()
        end
        if MN1[28] == true then
          CRED()
        end
        if MN1[29] == true then
          CPLUTO()
        end
        if MN1[30] == true then
          CBL()
        end
        if MN1[31] == true then
          CYLW()
        end
        if MN1[32] == true then
          CGRN()
        end
        if MN1[33] == true then
          CPINK()
        end
        if MN1[34] == true then
          CPLE()
        end
        if MN1[35] == true then
          CMIX()
        end
        if MN1[36] == true then
          CRBW()
        end
        if MN1[37] == true then
          PURPLE410()
        end
        if MN1[38] == true then
          GRN400()
        end
        if MN1[39] == true then
          YLLW400()
        end
        if MN1[40] == true then
          RED425()
        end
        if MN1[41] == true then
          YELLOW425()
        end
        if MN1[42] == true then
          GRN425()
        end
        if MN1[43] == true then
          MIX425()
        end
        if MN1[44] == true then
          PLE425()
        end
        if MN1[45] == true then
          YLW615()
        end
        if MN1[46] == true then
          GRN615()
        end
        if MN1[47] == true then
          BLUE615()
        end
        if MN1[48] == true then
          YLLW636()
        end
        if MN1[49] == true then
          RED660()
        end
        if MN1[50] == true then
          YLW660()
        end
        if MN1[51] == true then
          GRN660()
        end
        if MN1[52] == true then
          YLLW665()
        end
        if MN1[53] == true then
          GRN665()
        end
        if MN1[54] == true then
          BLUE665()
        end
        if MN1[55] == true then
          RED712()
        end
        if MN1[56] == true then
          RED845()
        end
        if MN1[57] == true then
          YLW845()
        end
        if MN1[58] == true then
          GRN845()
        end
        if MN1[59] == true then
          BLUE845()
        end
        if MN1[60] == true then
          GREEN855()
        end
        if MN1[61] == true then
          YELLOW855()
        end
        if MN1[62] == true then
          RED855()
        end
        if MN1[63] == true then
          BLUE855()
        end
        if MN1[64] == true then
          HOME()
        end
      end
      SPJKSC = -1
    end
    
    function WH400()
    gg.clearResults()
    gg.setRanges(4)
    gg.searchNumber('228;1,073,741,824;1,073,741,824;229;-1,082,130,432:29', 4, false, 536870912, 0, -1)
    gg.searchNumber('1,073,741,824', 4, false, 536870912, 0, -1)
    gg.getResults(30)
    gg.editAll('1,123,024,896', 4)
    gg.clearResults()
    gg.setRanges(4)
    gg.searchNumber('3.3631163e-44;2.0;3.5032462e-44;-1.0;3.643376e-44;3.7835059e-44;-1.0;3.9236357e-44;4.0637655e-44;1.0;-127.0:129', 16, false, 536870912, 0, -1)
    gg.searchNumber('2', 16, false, 536870912, 0, -1)
    gg.getResults(100)
    gg.editAll('120', 16)
    gg.clearResults()
    gg.toast('Wallhack SD400  SPJK')
    end
    
    function WH410()
    gg.clearResults()
    gg.setRanges(1)
    gg.searchNumber('3.1949605e-43;3.1809475e-43;2.0;3.2089735e-43', 16, false, 536870912, 0, -1)
    gg.searchNumber('2', 16, false, 536870912, 0, -1)
    gg.getResults(100)
    gg.editAll('150', 16)
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('8204;8205;1,194,344,451', 4, false, 536870912, 0, -1)
    gg.searchNumber('8204', 4, false, 536870912, 0, -1)
    gg.getResults(100)
    gg.editAll('15', 4)
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('1,669,693,440;8205', 4, false, 536870912, 0, -1)
    gg.searchNumber('8205', 4, false, 536870912, 0, -1)
    gg.getResults(100)
    gg.editAll('8204', 4)
    gg.clearResults()
    gg.toast('Wallhack SD410  SPJK')
    end
    
    function WH415()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_HEAP)
    gg.searchNumber('228;1,073,741,824;1,073,741,824;229;-1,082,130,432:29', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('1,073,741,824', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('1,123,024,896', gg.TYPE_DWORD)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_HEAP)
    gg.searchNumber('3.3631163e-44;2.0;3.5032462e-44;-1.0;3.643376e-44;3.7835059e-44;-1.0;3.9236357e-44;4.0637655e-44;1.0;-127.0:129', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('3.1809475e-43;3.1949605e-43;2.0;3.2089735e-43:53', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD415  SPJK')
    end
    
    function WH425()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber('2.9427268e-44;2.0;3.0828566e-44;-1.0;3.2229865e-44;3.3631163e-44;3.643376e-44:97', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('3.1529215e-43;2.0F;3.1669345e-43F;3.1809475e-43:49', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD425  SPJK')
    end
    
    function WH430()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('5.8013756e-42F;-5.5695588e-40F;2.0F::100', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;-127.0F::520', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(20)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('4,141D;4.7408155e21;-5.5693206e-40;4.814603e21;3.7615819e-37;2:', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(4)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD430  SPJK')
    end
    
    function WH435()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber('3.2229865e-43F;2.0F;-1.0F;-1.0F;2.0F:145', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(360)
    gg.editAll('150', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber('27;15;26;23;1,073,741,824;24;-1,082,130,432:61', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('1,073,741,824', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('1,123,024,896', gg.TYPE_DWORD)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('2;3.7615819e-37;4.814603e21;4.7408149e21', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(20)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('2;3.7615819e-37;1.3912552e-19;4.9252829e21', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(20)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;1.0F;-127.0F;0.00999999978F::200', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(20)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD435 SPJK')
    end
    
    function WH450()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('135,215D;4,140D;3.7615819e-37;2::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('194D;3.7615819e-37;2;-1;1;-127::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('1.1202013e-19;1.1202017e-19;2::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1)
    gg.editAll('9999', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('2.718519e-43F;3.7615819e-37F;2.0F;0.00999999978F::200', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('150', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('5.8013756e-42F;-5.5695588e-40F;2.0F::100', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('150', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('4.7961574e21;3.7615819e-37;2::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('150', gg.TYPE_FLOAT)
    gg.toast('Wallhack SD450  SPJK')
    end
    
    function WH615()
    gg.toast("Activate again if it doesn't work!")
    gg.setRanges(gg.REGION_C_HEAP)
    gg.searchNumber('3.2229865e-43;2.0;-1.0;-1.0;2.0:145', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('122', gg.TYPE_FLOAT)
    gg.toast('Wallhack SD615 SPJK')
    end
    
    function WH625()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('135,215D;4,140D;3.7615819e-37;2::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('194D;3.7615819e-37;2;-1;1;-127::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD625  SPJK')
    end
    
    function WH626()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('5.1097599e21;2.0;1.6623071e-19;3.6734297e-39;1.66433e10::17', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('2.0;-1.0;0.0;1.0;-127.0::17', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD626  SPJK')
    end
    
    function WH636()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('2.718519e-43F;3.7615819e-37F;2.0F;-1.0F;1.0F;-127.0F;0.00999999978F::200', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('5.8013756e-42F;-5.5695588e-40F;2.0F::100', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('WH636 Active SPJK')
    end
    
    function WH653()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.clearResults()
    gg.searchNumber('2.718519e-43F;3.7615819e-37F;2.0F;0.00999999978F::200', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('5.8013756e-42F;-5.5695588e-40F;2.0F::100', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD653  SPJK')
    end
    
    function WH660()
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('135,215D;4,140D;3.7615819e-37;2::', 16, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', 16, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('130', 16)
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('194D;3.7615819e-37;2;-1;1;-127::', 16, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', 16, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('130', 16)
    gg.clearResults()
    gg.toast('Wallhack SD660  SPJK')
    end
    
    function WH665()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('95D;2;9.2194229e-41::100', gg.POINTER_WRITABLE, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
    gg.searchNumber('2', gg.POINTER_WRITABLE, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('120', gg.POINTER_WRITABLE)
    gg.clearResults()
    gg.searchNumber('2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::30', gg.POINTER_WRITABLE, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
    gg.searchNumber('2', gg.POINTER_WRITABLE, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('120', gg.POINTER_WRITABLE)
    gg.clearResults()
    gg.toast('Wallhack SD665  SPJK')
    end
    
    function WH670()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('200')
    gg.getResults(999)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('930')
    gg.getResults(999)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD670  SPJK')
    end
    
    function WH710()
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('95D;2;9.2194229e-41', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(15)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('206D;3.7615819e-37;2;-1;1', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('WH710 Active SPJK')
    end
    
    function WH712()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('274,677,779D;2.25000452995;2;1.6623054e-19', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(20)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('218D;3.7615819e-37;2;-1;1', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('95D;2;9.2194229e-41', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(15)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('206D;3.7615819e-37;2;-1;1', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('130', gg.TYPE_FLOAT)
    gg.toast('WH712 Active SPJK')
    end
    
    function WH800()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('5.1097599e21;2.0;1.6623071e-19;3.6734297e-39;1.66433e10::17', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('2.0;-1.0;0.0;1.0;-127.0::17', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD800/801  SPJK')
    end
    
    function WH820()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('2;1.8947657e-40;5.8013756e-42', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('2.718519e-43;3.7615819e-37;2;-1;1;-127', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD820/821  SPJK')
    end
    
    function WH835()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('2.718519e-43F;3.7615819e-37F;2.0F;0.00999999978F::200', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('5.8013756e-42F;-5.5695588e-40F;2.0F::100', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber(2, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('7.1746481e-43;1.0842022e-19;94.015625;7.0776718e-15;2::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('9999', gg.TYPE_FLOAT)
    gg.toast('Wallhack SD835 SPJK')
    end
    
    function WH845()
    gg.clearResults()
    gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('200', -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(25)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('930', -1, gg.TYPE_FLOAT, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(25)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast(' WallHack SD845 SPJK')
    end
    
    function WH855()
    gg.clearResults()
    gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
    gg.searchNumber('95D;2;9.2194229e-41::100', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.searchNumber('2;-1;0;1;-127;0.24022650719;0.69314718246;0.00999999978::30', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('2', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Wallhack SD855  SPJK')
    end
    
    function WHALL()
    gg.setRanges(131072)
    gg.searchNumber('5.6447121e21;-8.3252823e-40;4.9252852e21::', 16, false, 536870912, 0, -1)
    gg.searchNumber('-8.3252823e-40', 16, false, 536870912, 0, -1)
    gg.getResults(100)
    gg.editAll('6444', 16)
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('4.9068373e21;-3.5875931e-39;4.8699618e21::', 16, false, 536870912, 0, -1)
    gg.searchNumber('-3.5875931e-39', 16, false, 536870912, 0, -1)
    gg.getResults(100)
    gg.editAll('6444', 16)
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('5.0544113e21;-3.4039221e-39;4.8699607e21::', 16, false, 536870912, 0, -1)
    gg.searchNumber('-3.4039221e-39', 16, false, 536870912, 0, -1)
    gg.getResults(100)
    gg.editAll('6444', 16)
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('5.6447206e21;-1.0161992e-39;4.9068396e21::', 16, false, 536870912, 0, -1)
    gg.searchNumber('-1.0161992e-39', 16, false, 536870912, 0, -1)
    gg.getResults(100)
    gg.editAll('6444', 16)
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('4.7223665e21;-8.3246237e-40;4.8330515e21::', 16, false, 536870912, 0, -1)
    gg.searchNumber('-8.3246237e-40', 16, false, 536870912, 0, -1)
    gg.getResults(100)
    gg.editAll('6444', 16)
    gg.clearResults()
    gg.setRanges(131072)
    gg.searchNumber('4.7408149e21;-5.5695588e-40;4.814603e21::', 16, false, 536870912, 0, -1)
    gg.searchNumber('-5.5695588e-40', 16, false, 536870912, 0, -1)
    gg.getResults(6)
    gg.editAll('6444', 16)
    gg.toast('Wallhack All Snapdragon  SPJK')
    end
    
    function REDHDR()
    gg.clearResults()
    gg.searchNumber('8,196D;8,192D;8,200D::', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('7', gg.TYPE_DWORD)
    gg.toast('Colour Red HDR  SPJK')
    end
    
    function YELLOWHDR()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('856128', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(4)
    gg.editAll('856140', gg.TYPE_DWORD)
    gg.clearResults()
    gg.searchNumber('196610;1280;196608:25', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('196608', gg.TYPE_DWORD, false)
    gg.getResults(10)
    gg.editAll('9999', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Yellow HDR  SPJK')
    end
    
    function BLUEHDR()
    gg.setRanges(gg.REGION_BAD)
    gg.clearResults()
    gg.searchNumber('1,661,337,615D;8,200D;1,194,380,049D:9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('66', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Blue HDR  SPJK')
    end
    
    function PURPLEHDR()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8,196D; 256D; 8,204D; 256D; 8,200D', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8,200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(12)
    gg.editAll('16', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Purple HDR  SPJK')
    end
    
    function CRED()
    gg.clearResults()
    gg.searchNumber('8,196D;8,192D;8,200D::', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('7', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Red  SPJK')
    end
    
    function CPLUTO()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8,192D;256D;8200D', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(20)
    gg.editAll('4', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Color Pluto')
    end
    
    function CBL()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('1.3912525e-19F;8200;96', gg.TYPE_DWORD, false)
    gg.searchNumber('8200', gg.TYPE_DWORD, false)
    gg.getResults(10)
    gg.editAll('8202', gg.TYPE_DWORD)
    gg.toast('Color Blue')
    end
    
    function CYLW()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('128;786,441;8,200;786,443:25', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('6', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Yellow Color Activated')
    end
    
    function CGRN()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('32,769;-2,134,900,724:21', gg.TYPE_DWORD, false)
    gg.searchNumber('32,769', gg.TYPE_DWORD, false)
    gg.getResults(10)
    gg.editAll('32780', gg.TYPE_DWORD)
    gg.toast('Colour Green  SPJK')
    end
    
    function CPINK()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('69,778D;1,669,332,992D;10D', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('10', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(21)
    gg.editAll('32777', gg.TYPE_DWORD)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('69,778D;1,669,332,992D;12D', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('12', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(21)
    gg.editAll('32777', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Pink!')
    end
    
    function CPLE()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('32769;768;-2134900730', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('32769', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('51781', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Purple  SPJK')
    end
    
    function CMIX()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('1.3912525e-19F;8200;96', gg.TYPE_DWORD, false)
    gg.searchNumber('8200', gg.TYPE_DWORD, false)
    gg.getResults(10)
    gg.editAll('8205', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Mix  SPJK')
    end
    
    function CRBW()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('1.1490647e-41;1.0863203e-19::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('1.0863203e-19', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('1.0863203e-25', gg.TYPE_FLOAT)
    gg.toast('Colour Rainbow  SPJK')
    end
    
    function PURPLE410()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('1.1490647e-41;1.0863203e-19::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('1.0863203e-19', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(30)
    gg.editAll('1.0863203e-25', gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast('Purple Sd 410')
    end
    
    function GRN400()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8,201;8,202;538,968,081:29', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8202', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1)
    gg.editAll('8', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Color GRN SD400  SPJK')
    end
    
    function YLLW400()
    gg.setRanges(gg.REGION_BAD)
    gg.setRanges(131072)
    gg.searchNumber('856128', 4, false, 536870912, 0, -1)
    gg.getResults(4)
    gg.editAll('856118', 4)
    gg.clearResults()
    gg.searchNumber('196610;1280;196608:25', 4, false, 536870912, 0, -1)
    gg.searchNumber('196608', 4, false)
    gg.getResults(10)
    gg.editAll('9999', 4)
    gg.clearResults()
    gg.toast('Color 400+ Yellow')
    end
    
    function RED425()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('200,761;92;8,204;856,124;108;196,610:409', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber('8204', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(3)
    gg.editAll('8203', gg.TYPE_DWORD)
    gg.toast('Wallhack Color Red  SPJK')
    end
    
    function YELLOW425()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('856128', gg.TYPE_DWORD, false, gg.SIGN_FUZZY_EQUAL, 0, -1)
    gg.getResults(4)
    gg.editAll('856118', gg.TYPE_DWORD)
    gg.clearResults()
    gg.searchNumber('196610;1280;196608:25', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('196608', gg.TYPE_DWORD, false, gg.SIGN_EQUA, 0, -1)
    gg.getResults(10)
    gg.editAll('9999', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Yellow SD425  SPJK')
    end
    
    function GRN425()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('856,128', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResultsCount()
    gg.getResults(3)
    gg.editAll('856095', gg.TYPE_DWORD)
    gg.clearResults()
    gg.searchNumber('196,610;1,280;196,608::25', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('196608', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('9999', gg.TYPE_DWORD)
    gg.toast('Colour Green SD425  SPJK ')
    end
    
    function MIX425()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('856128', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(4)
    gg.editAll('99', gg.TYPE_DWORD)
    gg.clearResults()
    gg.searchNumber('200761;92;8204;856124;108;196610:409', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber('8204', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
      revert = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll('1', gg.TYPE_DWORD)
    gg.toast('Colour Mix')
    end
    
    function PLE425()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('856128', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(4)
    gg.editAll('99', gg.TYPE_DWORD)
    gg.clearResults()
    gg.searchNumber('200761;92;8204;856124;108;196610:409', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber('8204', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
    gg.editAll('5555', gg.TYPE_DWORD)
    gg.toast('Aktif')
    end
    
    function YLW615()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8,192D;256D;65,540D;12D;8200D', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('6', gg.TYPE_DWORD)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8,192D;256D;65,540D;12D;8200D', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('6', gg.TYPE_DWORD)
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8,192D;256D;65,540D;12D;8200D', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('6', gg.TYPE_DWORD)
    gg.toast('Colour SD615 Yellow  SPJK')
    end
    
    function GRN615()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8.201D;8.202D;538.968.081D:29')
    gg.searchNumber('8201;8202;538968081')
    gg.getResults(5)
    gg.editAll('8', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Green SD615  SPJK')
    end
    
    function BLUE615()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('1D;2D;91D:25', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('1;2;91', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('5', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Blue SD615  SPJK')
    end
    
    function YLLW636()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('128;786,441;8,200;786,443:25', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('6', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Yelow Color SD 636')
    end
    
    function RED660()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8196D;8192D;8200D', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('8199', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Red SD660  SPJK')
    end
    
    function YLW660()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0B0', -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(228)
    gg.editAll('8198', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Yellow SD660 SPJK')
    end
    
    function GRN660()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('32769', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber('32769', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('518')
    gg.getResults(9999)
    gg.editAll('32772', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Colour Green SD660  SPJK')
    end
    
    function YLLW665()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8200;8201;8202;8203;8204', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200;8201;8203', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('7;7;10', gg.TYPE_DWORD)
    gg.toast(' Color YELLOW SD 665 ')
    gg.clearResults()
    end
    
    function GRN665()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8200;8201;8202;8203;8204', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8201;8203', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('7;10', gg.TYPE_DWORD)
    gg.toast(' Color Green SD 665 ')
    gg.clearResults()
    end
    
    function BLUE665()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8200;8201;8202;8203;8204', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8201;8202;8203', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(100)
    gg.editAll('7;7;10', gg.TYPE_DWORD)
    gg.toast(' Color Blue SD 665')
    gg.clearResults()
    end
    
    function RED712()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8,192D;256D;8200D', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(20)
    gg.editAll('6', gg.TYPE_DWORD)
    gg.toast('Color Red SD 625 & 712 & 835 SPJK')
    end
    
    function RED845()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('1,661,566,999;96;539,246,604;8200::', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(10)
    gg.editAll('7', gg.TYPE_DWORD)
    gg.toast('Color Red 845 Activated')
    end
    
    function YLW845()
    gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0A8', -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('7', gg.TYPE_DWORD)
    gg.clearResults()
    gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
    gg.searchNumber('8201', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0B0', -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('7', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('COLOR 845 YELLOW')
    end
    
    function GRN845()
    gg.clearResults()
    gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
    gg.searchNumber('8201', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0B0', -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('7', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('COLOR 845 GREEN')
    end
    
    function BLUE845()
    gg.clearResults()
    gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
    gg.searchNumber('8201', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0B0', -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('6', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('COLOR 845 BLUE')
    end
    
    function GREEN855()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8201', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0A0')
    gg.getResults(10)
    gg.editAll('8199', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Color SD 855 Green Activated')
    end
    
    function YELLOW855()
    gg.clearResults()
    gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0A8', -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll('8198', gg.TYPE_DWORD)
    gg.clearResults()
    gg.searchNumber('8201', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0B0', -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(1000)
    gg.editAll('8199', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Color SD 855 Yellow Aktif')
    end
    
    function RED855()
    gg.clearResults()
    gg.setRanges(gg.REGION_VIDEO or gg.REGION_BAD)
    gg.searchNumber('8200', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0A8', -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1)
    gg.getResults(5)
    gg.editAll('7', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Color SD855 Red Activated')
    end
    
    function BLUE855()
    gg.clearResults()
    gg.setRanges(gg.REGION_BAD)
    gg.searchNumber('8201', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineAddress('0A0')
    gg.getResults(10)
    gg.editAll('8198', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast('Color SD855 Blue Body Activated')
    end
    
function exit() 
gg.alert("『SPJK』S PROJECT HACK 📀 『VIP』\n▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬\n ๛ YouTube: S PROJECT HACK       🇮🇩\n ๛ Telegram: @spjkchannel             🇮🇩\n▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ")
os.exit() 
end 
while true do
if gg.isVisible(true) then SPJKSC = 1
gg.setVisible(false)
end
gg.clearResults()
if SPJKSC == 1 then HOME() end
end