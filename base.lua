
-- 基础业务函数库

require("utils")

--[[
	@Desc 启动 应用
	@appid 应用id
	@postion 屏幕方向 0:竖屏 1:home右边 2:home左边
	@delay 休眠（毫秒）
	@isClearAppData 启动前是否清理应用数据 慎用 true-清理 false-不清理 
]]
function runApplication(...)
	appid,postion,delay,isClearAppData=...
	appid=appid or 'un'
	postion=postion or 0
	delay=delay or 0
	isClearAppData=isClearAppData or false
	if isClearAppData then
		cleanApp(appid)
		mSleep(delay)
	end
	runApp(appid)
	init(bid,postion)
	mSleep(delay)
	-- 获取屏幕分辩率
	width,height=getScreenSize()
	sysLog('ScreenSize:'..width..'x'..height)
	return width,height
end

--[[
	@desc 登录
	@account 账号
	@password 密码
]]
function login(account,password)




	sysLog('login:'..account..'--'..password)
--截图
	snapshot("test.png", 600, 200, 1300, 450);
--首次登录
	local tab = {
"08000000000400907c0a794020040000000000000000001002004809010000000000000000801012026048090120248480100200000040080500a0140282500a054008010000000000000000000000000000000000800000000000000000000000100030000000001$选择登录方式$71$11$76",
	}
	local index = addTSOcrDictEx(tab)
--1: 0,0,0,0 范围坐标，请自行修改
--2: "141414 , 151515 # 5C5C5C , 5D5D5D" 偏色,多组或单组.请在偏色列表中选择
--3: 90 匹配精度 【0-100】
	x, y = tsFindText(index, "选择登录方式", 600, 200, 1300, 450, "141414 , 151515 # 5C5C5C , 5D5D5D", 90)
	sysLog("pos - x:"..x.." , y:"..y)

	if (x==600 and y==232) or (x==639 and y==334) then
		click(550,450,30) 
--		toast("点击(550, 450)  ",2)
		sysLog("点击(550, 450)  ")
		-- 休眠 
		mSleep(30000)
		text = ocrText(720, 250, 750, 380, 0);
		sysLog("acount input "..text)
		if text=='ID' then
			-- 输入账号
			click(730, 300,30) 
			mSleep(1000)  
			inputData(account,true)

			-- 输入密码
			click(730, 500,30)
			mSleep(1000) 
			inputData(password);
		else
--	snapshot("btn_login.png", 730, 550, 1200, 700);
			-- 点击登录
			click(730, 570,30) 
			toast("点击登录",1)
		end
	else
		sysLog("error！！！")
	end

	-- 情况二 跳过了	

end

