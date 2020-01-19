
-- 函数工具类

--[[ 

 @desc 点击事件
 @param x 横坐标
 @param y 纵坐标
 @param delay 延迟（毫秒） 
]]
function click(x,y,delay)
	touchDown(x, y)
	mSleep(delay)
	touchUp(x,y)
end

--[[
 @desc 输入信息
 @param str 待输入字符串
 @param isClear 输入前是否清楚 true:是 false:否,默认false  
]] 
function inputData(...)
	-- body
	str,isClear=...
	str=str
	isClear=isClear or false
	print(str.." "..isClear)

	if isClear then
		for var = 1,15 do
			--删除输入框中的文字（假设输入框中已存在文字）
			inputText("\b")
			--iOS 设备连续输入建议加下延时时间，否则可能因为速度太快导致输入错误
			mSleep(20)
		end
	end

	-- 输入账号
	inputText(str);

end

--[[
 @desc 缩放
 @flag 缩放标志 true：放 false:缩
 @x1 1指 x坐标
 @y1 1指 y坐标
 @x2 2指 x坐标 
 @y2 2指 y坐标 
 @offset 偏移量
 @step  步长
]]
function zoom(flag,x1,y1,x2,y2,offset,step)
	start,over,steps=1,offset,step
	if not(flag) then
		-- 缩
		start,over,steps=offset,1,-step
	end

	touchDown(1, x1, y1);                --手指 1 在坐标 (x1, y1) 按下
	touchDown(2, x2, y2);                --手指 2 在坐标 (300, 500) 按下
	mSleep(50);
	for i = start, over,steps do                --使用 for 循环使两只手指同时分离/靠近
		touchMove(1, x1 - i, y1 - i); 
		touchMove(2, x2 + i, y2 + i);
		mSleep(10);
	end
	touchUp(1, x1 - offset, y1 - offset);    --抬起手指 1
	touchUp(2, x2 + offset, y2 + offset);   --抬起手指 2




end



