toast("在线版本0.2.7")
-----------------------私有部分--------------------------

function main()
    nowTime1 = os.time();
    -- go = go + 1
    -- tiaoShi("go:"..go)
    nowTime = os.time();
    nowDateTime = os.date("*t")
    today = tonumber(os.date("%w", os.time()))

    if version ~= "2.2.4" then
        if getBacklightLevel() ~= 0.5 then
            setBacklightLevel(0.5);
        end
    end
    bid = frontAppBid()
    -- tiaoShi(bid)
    if bid == apps1 then
        -- tiaoShi("apps1")
        APP = APP1
    elseif bid == apps2 then
        -- tiaoShi("apps2")
        APP = APP2
        -- elseif bid == appWeiXin and tmpWeiXinWeiHu ~= nil and isWeiXinWeiHu == false and nowDateTime.hour >= hourWeiXin and
        --     nowDateTime.min >= minWeiXin then

    else
        -- tiaoShi("哪个都没开")
        APP.isYiDengLu = 0
        runApp(apps1)
        APP = APP1
        mSleep(5000)
    end
    m_iRunCount = m_iRunCount + 1

    zongHe()
    zongHe_Mult()
    zongHe_Screen()
    muBiaoZhuanHuan() -- 公用
    doTarget()
    timeChongZhi()
    checkXXX()
    everyDayInit()
    resetIDLETimer();
    -- timeJianGe(debug.getinfo(1).currentline)
    -- nowTime2 = os.time();
    -- dialog(nowTime2 - nowTime1,0)
    -- lua_exit()
end
-- 变量及常量
function bianLiang()
    isLiZi = false -- 粒子
    isShengChan = true -- 生产标志
    isKillPirate = false -- 杀海盗
    isJiaSuProduce = false -- 加速生产
    isAutoNext = true -- 主动下一个建筑
    isJiDiXianKuangIntoProduce = false -- 从基地现况进入生产界面
    isJustBack = false -- 刚回基地
    isBug_LiZi = false -- bug 粒子

    numSearchLiZiSecond = 20
    numSearchLiZi = 0
    num5DaoJu = 0
    numDiaoXian = 0
    numChuHang = 1 -- 出航编号
    numSearch = 0 -- 搜索

    timeLiZi = nowTime - 3 * 60 -- 粒子在不在采集,3分钟检测一次
    timeYanJiu = nowTime - 60 -- 研究
    timeJiDi = nowTime - 10 * 60 -- 基地红点
    timeLianMengRenWu = nowTime - 60 * 60 -- 联盟任务
    timeKillPirate = nowTime - 60 * 10 -- 杀海盗
    timeXXX = nowTime -- 掉线检测
    timeInside = nowTime - 5 * 60
    timeLianMeng = nowTime - 60 * 60 * 2 -- 联盟
    timeShengChan = nowTime - 60 * 60 * 2 -- 生产

end
-- oncePlist
function oncePlist()
    -- 广告次数
    numGuangGao = loadPlist(luaMuLu .. xiangMu .. ".plist", "广告次数")
    if numGuangGao == nil then
        numGuangGao = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "广告次数", numGuangGao)
    end

    -- 传输次数
    numChuanShu = loadPlist(luaMuLu .. xiangMu .. ".plist", "传输次数")
    if numChuanShu == nil then
        numChuanShu = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "传输次数", numChuanShu)
    end

    -- 交易行
    isTrade = loadPlist(luaMuLu .. xiangMu .. ".plist", "交易行")
    if isTrade == nil then
        isTrade = false
        writePlist(luaMuLu .. xiangMu .. ".plist", "交易行", isTrade)
    end

    -- 每日5道具
    num5DaoJu = loadPlist(luaMuLu .. xiangMu .. ".plist", "每日5道具")
    if num5DaoJu == nil then
        num5DaoJu = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "每日5道具", num5DaoJu)
    end

    -- 增产
    numAddChangLiang = loadPlist(luaMuLu .. xiangMu .. ".plist", "增产")
    if numAddChangLiang == nil then
        numAddChangLiang = 0
        writePlist(luaMuLu .. xiangMu .. ".plist", "增产", numAddChangLiang)
    end

    -- 再次收获
    isAgainReward = loadPlist(luaMuLu .. xiangMu .. ".plist", "再次收获")
    if isAgainReward == nil then
        isAgainReward = false
        writePlist(luaMuLu .. xiangMu .. ".plist", "再次收获", isAgainReward)
    end

end
-- onceOther
function onceOther()
    tab_lizi1 = {"600c00fffffffff$1$40$12$5", "600e00fffffffff$1$41$12$5", "6003003fffffffff@1$1$43$13$5",
                 "3001c006003ffffffdffe$1$47$14$6", "6007003fffffffff@1$1$44$13$5", "3001c006003ffffffdfff$1$48$14$6",
                 "7003800e003ffffffffff$1$51$14$6", "7000e0038007ffefffffff@10$1$52$15$6",
                 "3000e001c007ffffffffffdfff@1$1$67$15$7", "7000e0038007ffffffffffdfff@1$1$68$15$7",
                 "70007000e000fffefffffffffffe$1$71$16$7"}
    index_lizi1 = addTSOcrDictEx(tab_lizi1)
    tab_lizi2 =
        {"ffffffffffffffffffffffffffffff3fffc7fff0fffe000fc001f8003fffffffffffffffffffffffffffffffff@1$1$313$19$19",
         "ffffffffffffffffffffffffffffffffffff87fff8ffff0007f0007f0007fffffffffffffffffffffffffffffffffff$1$334$20$19",
         "ffffffffffffffffffffffffffffffffffff8ffff0ffff0ffff0007f0007f0007ffffffffffffffffffffffffffffffffffffffff$1$370$20$21",
         "fffffffffffffffffffffffffffffffffffffffffff87fffc7fffc000fe0007f0003f8001fffffffffffffffffffffffffffffffffffff@1$1$378$21$21",
         "ffffffffffffffffffffffffffffffffffffff8ffff87fffc7fffe000ff0007f8003ffffffffffffffffffffffffffffffffffffffffff@1$1$392$21$21",
         "fffffffffffffffffffffffffffffffffffffffffff87fffc7fffc000fe0007f0003f8001fffffffffffffffffffffffffffffffffffff@1$1$378$21$21",
         "fffffffffffffffffffffffffffffffffffffffffffff87fffe1ffff0001fc0007f0001fc0007fffffffffffffffffffffffffffffffffffffffffffffffff@11$1$438$22$23",
         "fffffffffffffffffffffffffffffffffffffffffffffffc3ffff0ffffe1ffffc0007f8000ff0001fe0003ffffffffffffffffffffffffffffffffffffffffffffffffffff$1$480$23$24",
         "fffffffffffffffffffffffffffffffffffffffffffffffffc3ffffc3ffff87ffff8000ff8000ff8000ff8000fffffffffffffffffffffffffffffffffffffffffffffffffffffff$1$504$24$24",
         "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0fffff0fffff87ffff80007fc0003fe0001ff0000fffffffffffffffffffffffffffffffffffffffffffffffffffffffff@1$1$549$25$25",
         "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0fffff0fffff87ffff80003fc0001fe0000ff00007ffffffffffffffffffffffffffffffffffffffffffffffffffffffff@1$1$545$25$25",
         "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff87ffffc1fffff0fffffc0001ff00007fc0001ff00007ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff@11$1$569$26$25"}
    index_lizi2 = addTSOcrDictEx(tab_lizi2)
    -- 请自行更改参数

    haoLV = 0
    local tmpXiaoHao = string.find(zongHeXuanXiang2, "6") -- 小号
    local tmpChengPinHao = string.find(zongHeXuanXiang2, "5") -- 成品号
    local tmpDaHao = string.find(zongHeXuanXiang2, "4") -- 大号
    if tmpXiaoHao ~= nil then
        haoLV = 1
    end
    if tmpChengPinHao ~= nil then
        haoLV = 2
    end
    if tmpDaHao ~= nil then
        haoLV = 3
    end

    current_time = os.date("%m-%d_%H.%M", os.time());
    snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
    ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "PNG/")

end
-- 综合
function zongHe(...)
    if inside() then
        if isColor(33, 493, 0xffffff, 95) and isColor(21, 474, 0x5ea7e8, 95) then
            tiaoShi("free")
            touchClick(33, 493)
        end
        if isColor(335, 213, 0x2a6aab, 95) and isColor(335, 226, 0x2a6aab, 95) and haoLV >= 3 then
            tiaoShi("收缩任务栏")
            touchClick(335, 213)
        end
        if isColor(99, 212, 0x2a6aab, 95) and isColor(106, 219, 0x2a6aab, 95) and haoLV <= 2 then
            tiaoShi("展开任务栏")
            touchClick(107, 213)
        end

    end
    if isColor(180, 147, 0x215da6, 95) and isColor(202, 204, 0x4c92da, 95) and isColor(503, 515, 0x233341, 95) and
        isColor(741, 516, 0x2f2a33, 95) then
        tiaoShi("外太空玩家2")
        touchClick(511, 600, 0x0c0c0e)
        touchClick(571, 467, 0x05305c)
    end
    if isColor(158, 328, 0xf57508, 95) and isColor(771, 599, 0xf57508, 95) and isColor(561, 439, 0xf1fc6a, 95) then
        tiaoShi("基地加成")
        if muBiao == mb_CaiJi then
            touchClick(561, 439)
        else
            touchClick(20, 20)
        end
    end
    if isColor(143, 57, 0xe0e0e0, 95) and isColor(500, 164, 0xd4dc39, 95) and isColor(833, 184, 0x116eb9, 95) then
        tiaoShi("加成信息--采集道具--使用")
        if muBiao == mb_CaiJi then
            touchClick(833, 184, 0x116eb9)
            gaiMuBiao(2, mb_Reward, mm_Reward)
        else
            touchClick(511, 585, 0x0c0c0e)
        end
    end
    if isColor(474, 421, 0x1d6fbb, 95) and isColor(391, 306, 0x556c82, 95) and isColor(569, 304, 0x556c82, 95) then
        tiaoShi("移动坐标")
        touchClick(508, 464, 0x0c0c0e)
    end
    if isColor(1099, 35, 0x7c7c7c, 95) and isColor(1100, 41, 0xfafafa, 95) then
        tiaoShi("关广告--X,灰白色")
        touchClick(1099, 35, 0x7c7c7c)
    end
    if isColor(1088, 47, 0x202124, 95) and isColor(1088, 58, 0xfafafa, 95) and isColor(929, 50, 0x868686, 95) then
        tiaoShi("关广告--X,黑色")
        touchClick(1088, 47, 0x202124)
    end
    if isColor(1088, 48, 0xffffff, 95) and isColor(1088, 62, 0x3c4043, 95) and isColor(30, 599, 0xffffff, 95) == false then
        tiaoShi("关广告--X,白色")
        touchClick(1088, 47, 0x202124)
    end
    if isColor(1078, 57, 0xffffff, 95) and isColor(1087, 57, 0x101010, 95) and isColor(28, 604, 0xe6e6e6, 95) then
        tiaoShi("关广告--X,白色2")
        touchClick(1078, 57, 0x202124)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(792, 121, 0xe0b8ab, 95) and
        isColor(836, 102, 0xfab1cb, 95) then
        tiaoShi("奖励积分币")
        isJustBack = false
        x, y = findColorInRegionFuzzy(0xd78b01, 95, 71, 87, 1121, 587);
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            touchClick(x, y)
            -- 广告次数
            numGuangGao = numGuangGao + 1
            writePlist(luaMuLu .. xiangMu .. ".plist", "广告次数", numGuangGao)

        else
            touchClick(20, 20)
        end
    end
    if isColor(155, 144, 0xff6600, 95) and isColor(171, 137, 0xf8a901, 95) and isColor(345, 467, 0x1d6eba, 95) and
        isColor(600, 470, 0xd78b00, 95) then
        tiaoShi("掌握--达成满级")
        touchClick(514, 530, 0x0e0f12)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(1094, 39, 0xe8d9a3, 95) and
        isColor(1077, 19, 0xc07f20, 95) then
        tiaoShi("司令官技能--误开")
        touchClick(20, 20)
    end
    if isColor(463, 436, 0x114c8a, 95) and isColor(485, 455, 0x1c6dba, 95) and isColor(572, 323, 0xa19ba9, 95) and
        isColor(676, 330, 0x3ea3c9, 95) then
        tiaoShi("认证")
        touchClick(463, 436)
    end
    if isColor(635, 90, 0x126fba, 95) and isColor(805, 123, 0x075ea8, 95) and isColor(900, 120, 0xffffff, 95) then
        tiaoShi("云打码")
        snapshot("yudama.png", 222, 12, 596, 157)
        mSleep(2000)
        if isColor(635, 90, 0x126fba, 95) and isColor(805, 123, 0x075ea8, 95) and isColor(900, 120, 0xffffff, 95) then
            local strDaMa = yunDaMa()
            if strDaMa ~= false then
                inputText(strDaMa)
                mSleep(2000)
                touchClick(717, 104, 0x1270bb)
                mSleep(1000)
                touchClick(717, 104, 0x1270bb)
                mSleep(5000)
                x, y = findImage("yudama.png", 221, 11, 597, 158)
                if x ~= -1 and y ~= -1 then
                    closeApp(appXiangMu)
                end

            end
        end
        -- lua_exit();
        -- mSleep(10)
        -- mSleep(10)
        -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
        -- mSleep(10)
    end
    if isColor(269, 510, 0xc3841e, 95) and isColor(281, 128, 0xffffff, 95) and isColor(300, 121, 0x0c345b, 95) then
        tiaoShi("vip界面")
        if isColor(271, 394, 0x116eb9, 95) then
            tiaoShi("领取奖励--可领")
            touchClick(271, 394)
        elseif isColor(942, 120, 0x9e1111, 95) then
            tiaoShi("使用VIP点数--红点")
            touchClick(821, 135, 0x268465)
        elseif isColor(807, 264, 0x1c6dba, 95) then
            tiaoShi("可使用")
            touchClick(807, 264)
        else
            touchClick(510, 591, 0x0c0c0e)
        end
    end
    if isColor(457, 454, 0xf27c00, 95) and isColor(677, 453, 0xf2d600, 95) and isColor(513, 508, 0x1c6eba, 95) and
        isColor(308, 80, 0x0b4991, 95) then
        tiaoShi("100 vip点数")
        touchClick(556, 509, 0x1c6eba)
    end
    if isColor(498, 469, 0x1d6ebb, 95) and isColor(646, 470, 0x1d6fbc, 95) and isColor(574, 247, 0x7c4c3c, 95) then
        tiaoShi("100 vip点数 单数")
        touchClick(539, 475, 0x1c6ebb)
    end

    if isColor(273, 72, 0xf5a801, 95) and isColor(270, 85, 0xe0e0e0, 95) and isColor(506, 590, 0x3f5d81, 95) and
        isColor(275, 146, 0x436c9e, 95) then
        tiaoShi("奖励目录")
        if isColor(469, 517, 0x1eb585, 95) then
            touchClick(477, 507)
        else
            touchClick(511, 589, 0x0c0c0e)
        end
    end
    if isColor(170, 165, 0xa99280, 95) and isColor(214, 315, 0x56596a, 95) and isColor(354, 228, 0x246594, 95) then
        tiaoShi("每日联盟任务")
        if isColor(146, 511, 0x1d6eb9, 95) then
            touchClick(146, 511)
        else
            touchClick(512, 612, 0x0c0c0e)
        end
    end
    if isColor(921, 44, 0x116eb9, 95) and isColor(312, 146, 0x485743, 95) and isColor(83, 36, 0x30e4ff, 95) then
        tiaoShi("联盟星球")
        touchClick(877, 542)
        touchClick(511, 609, 0x3a597d)
    end
    if isColor(111, 106, 0x215da6, 95) and isColor(140, 71, 0xa9a9aa, 95) and isColor(345, 67, 0xd4d4d5, 95) then
        tiaoShi("援助联盟成员工作")
        if isColor(916, 82, 0x0d9098, 95) then
            touchClick(916, 82)
        else
            touchClick(511, 609, 0x3a597d)
        end
    end
    if isColor(126, 118, 0x00ace4, 95) and isColor(150, 109, 0xc0c0c0, 95) and isColor(313, 130, 0xe1e2e2, 95) then
        tiaoShi("联盟成员礼物")
        if isColor(902, 128, 0x0d9098, 95) then
            touchClick(902, 128)
        else
            touchClick(511, 590, 0x0c0c0e)
        end
    end
    if isColor(89, 35, 0x00ace4, 95) and isColor(91, 71, 0x215da6, 95) and isColor(125, 30, 0xc3bebe, 95) and
        isColor(231, 47, 0xafb1b4, 95) then
        tiaoShi("联盟任务")
        if isColor(218, 105, 0x9d1111, 95) and isColor(113, 143, 0x956b1a, 95) then
            tiaoShi("任务--红点--已选中")
            mSleep(100)
            if isColor(842, 524, 0x116eb9, 95) then
                tiaoShi("可更新")
                -- 红 0xb61d2c
                -- 橙 0xc56600
                -- 紫 0x7d079b
                -- 蓝 0x1050ac
                -- 绿 0x34b200
                if isColor(340, 171, 0xb61d2c, 95) then -- 左--红
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xb61d2c, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xb61d2c, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0xc56600, 95) then -- 左--橙
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xc56600, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xc56600, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x7d079b, 95) then -- 左--紫
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x7d079b, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x7d079b, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                    -- elseif isColor(340, 171, 0x1050ac, 95) then -- 左--蓝
                    --     touchClick(381, 452, 0x145ca8)
                    -- elseif isColor(594, 171, 0x1050ac, 95) then -- 中
                    --     touchClick(644, 450, 0xa3bfdd)
                    -- elseif isColor(848, 170, 0x1050ac, 95) then -- 右
                    --     touchClick(890, 450, 0xb4cbe4)
                    -- elseif isColor(340, 171, 0x34b200, 95) then -- 左--绿
                    --     touchClick(381, 452, 0x145ca8)
                    -- elseif isColor(594, 171, 0x34b200, 95) then -- 中
                    --     touchClick(644, 450, 0xa3bfdd)
                    -- elseif isColor(848, 170, 0x34b200, 95) then -- 右
                    --     touchClick(890, 450, 0xb4cbe4)
                else
                    touchClick(825, 532, 0x116eb9) -- 更新
                end
            else
                tiaoShi("不可更新")
                -- 红 0xb61d2c
                -- 橙 0xc56600
                -- 紫 0x7d079b
                -- 蓝 0x1050ac
                -- 绿 0x34b200
                if isColor(340, 171, 0xb61d2c, 95) then -- 左--红
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xb61d2c, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xb61d2c, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0xc56600, 95) then -- 左--橙
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xc56600, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xc56600, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x7d079b, 95) then -- 左--紫
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x7d079b, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x7d079b, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x1050ac, 95) then -- 左--蓝
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x1050ac, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x1050ac, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x34b200, 95) then -- 左--绿
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x34b200, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x34b200, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                else
                    touchClick(512, 607, 0x0c0c0e) -- 关闭
                end
            end
        elseif isColor(218, 169, 0x9d1111, 95) and isColor(199, 182, 0xa17316, 95) then
            tiaoShi("进行--红点--已选中")
            if isColor(311, 445, 0x1db687, 95) then
                touchClick(311, 445)
            elseif isColor(558, 443, 0x1db586, 95) then
                touchClick(558, 443)
            end
        elseif isColor(218, 241, 0x931012, 95) and isColor(204, 241, 0xa17316, 95) then
            tiaoShi("协助--红点--已选中")
            if isColor(303, 449, 0x1c6dba, 95) then
                touchClick(303, 449, 0x1c6dba)
            else
                touchClick(513, 606, 0x395679)
            end
        elseif isColor(225, 113, 0x9e1111, 95) and isColor(213, 113, 0x1b2b3e, 95) then
            tiaoShi("任务--红点--未选中")
            touchClick(171, 140, 0x283544)
        elseif isColor(218, 169, 0x9d1111, 95) and isColor(212, 178, 0x1b2b3e, 95) then
            tiaoShi("进行--红点--未选中")
            touchClick(171, 211, 0x283544)
        elseif isColor(218, 247, 0x931012, 95) and isColor(212, 247, 0x1a293c, 95) then
            tiaoShi("协助--红点--未选中")
            touchClick(166, 263, 0x855f15)

        elseif isColor(315, 448, 0x1db587, 95) then
            tiaoShi("分享")
            touchClick(315, 448)
        elseif isColor(186, 262, 0x876115, 95) and isColor(323, 448, 0x1d6ebb, 95) then
            tiaoShi("协助")
            touchClick(323, 448, 0x1d6ebb)
        else
            touchClick(176, 198, 0x886115)
            if isColor(313, 445, 0x1db687, 95) then
                tiaoShi("分享")
                touchClick(313, 445)
            else
                touchClick(510, 608)
            end
        end
    end
    if isColor(48, 44, 0x00ace4, 95) and isColor(72, 119, 0xa17316, 95) and isColor(94, 136, 0xffffff, 95) then
        tiaoShi("联盟技术研究界面")
        if isColor(336, 264, 0x767676, 95) then -- 1-1 
            touchClick(280, 193, 0xbc936a)
        elseif isColor(517, 264, 0x767676, 95) then -- 1-2
            touchClick(462, 187, 0x131410)
        elseif isColor(669, 264, 0x767676, 95) then -- 1-3
            touchClick(631, 177, 0x080a0d)
        elseif isColor(821, 263, 0x767676, 95) then -- 1-4
            touchClick(818, 184, 0x426674)
        elseif isColor(1031, 264, 0x767676, 95) then -- 1-5
            touchClick(1004, 196, 0x17160c)
        elseif isColor(336, 482, 0x767676, 95) then -- 2-1
            touchClick(276, 402, 0x30657a)
        elseif isColor(459, 482, 0x767676, 95) then -- 2-2
            touchClick(464, 408, 0x242c33)
        elseif isColor(640, 482, 0x767676, 95) then -- 2-3
            touchClick(637, 412, 0x525451)
        else
            touchClick(513, 603, 0x0c0c0e)
        end
    end
    if isColor(129, 66, 0xf5a801, 95) and isColor(146, 170, 0x30e5ff, 95) and isColor(159, 366, 0xac6c27, 95) then
        tiaoShi("研究")
        if isColor(858, 498, 0x1c6eba, 95) then -- 可研究
            if nowTime - timeYanJiu >= 60 then
                touchClick(858, 498, 0x1c6eba) -- 研究
                timeYanJiu = nowTime
            else
                touchClick(514, 597, 0x405b7c) -- 关闭
            end
        elseif isColor(806, 529, 0x1cb587, 95) then
            touchClick(806, 529, 0x1cb587) -- 加速
        elseif isColor(543, 207, 0x3e8fee, 95) then -- 缺少条件1
            touchClick(543, 207)
        elseif isColor(543, 242, 0x3e8fee, 95) then -- 缺少条件2
            touchClick(543, 242)
        elseif isColor(543, 51, 0x3e8fee, 95) then -- 缺少条件2
            touchClick(543, 251)
        else
            touchClick(512, 598, 0x0c0c0e)
        end
    end
    if isColor(679, 457, 0xd78b00, 95) and isColor(912, 177, 0x1c6eba, 95) and isColor(562, 198, 0x68defb, 95) then
        tiaoShi("招募公告")
        touchClick(679, 457, 0xd78b00)

    end
    if isColor(370, 469, 0x1c6db9, 95) and isColor(660, 477, 0xd78b00, 95) and isColor(368, 213, 0xabf4f7, 95) then
        tiaoShi("立即捐款")
        touchClick(370, 469, 0x1c6db9)
    end
    if isColor(380, 420, 0x1c6dba, 95) and isColor(651, 420, 0xd78b00, 95) and isColor(282, 175, 0xff6600, 95) and
        isColor(613, 409, 0x6b4500, 95) then
        tiaoShi("捐完了")
        touchClick(380, 420, 0x1c6dba) -- 取消
        touchClick(512, 541, 0x0c0c0e) -- 关闭
        touchClick(511, 528, 0x0c0c0e) -- 关闭
        touchClick(510, 602, 0x0c0c0e) -- 关闭
    end

    if isColor(69, 23, 0xff6600, 95) and isColor(92, 37, 0xb4c0ce, 95) and isColor(173, 44, 0x9eabbb, 95) then
        tiaoShi("基地现况界面--综合函数")
        local tmpDontProduce = string.find(zongHeXuanXiang2, "7")
        if isColor(814, 458, 0x9e1111, 95) then
            tiaoShi("资源--免费兑换--红点")
            touchClick(752, 488, 0x82a0c1)

        elseif isColor(557, 459, 0x9e1111, 95) then
            tiaoShi("签到奖励--红点")
            touchClick(519, 496, 0x306090)
        elseif isColor(686, 458, 0x9e1111, 95) then
            tiaoShi("补给太空船--红点")
            touchClick(624, 495, 0x306090)
        elseif isColor(1049, 364, 0x9e1111, 95) then
            tiaoShi("维修站--红点")
            touchClick(954, 398, 0x306090)
        elseif isColor(466, 175, 0x8a4c17, 95) then
            tiaoShi("攻击舰-完毕")
            touchClick(466, 175)
        elseif isColor(685, 174, 0x8a4c17, 95) then
            tiaoShi("高速舰-完毕")
            touchClick(685, 175)
        elseif isColor(471, 253, 0x8a4c17, 95) then
            tiaoShi("运输舰-完毕")
            touchClick(471, 253)
        elseif isColor(681, 257, 0x8a4c17, 95) then
            tiaoShi("防御舰-完毕")
            touchClick(685, 257)
        elseif isColor(466, 175, 0x306090, 95) and isShengChan == true and tmpDontProduce == nil then
            tiaoShi("攻击舰-休息")
            touchClick(466, 175)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(685, 174, 0x306090, 95) and isShengChan == true and tmpDontProduce == nil then
            tiaoShi("高速舰-休息")
            touchClick(685, 175)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(471, 253, 0x306090, 95) and isShengChan == true and tmpDontProduce == nil then
            tiaoShi("运输舰-休息")
            touchClick(471, 253)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(681, 257, 0x306090, 95) and isShengChan == true and tmpDontProduce == nil then
            tiaoShi("防御舰-休息")
            touchClick(685, 257)
            isJiDiXianKuangIntoProduce = true
            -- 474,257,0x8a4c17 完毕 
            -- 518,175,0x306090 休息中
        elseif muBiao == mb_ChuHang then
            tiaoShi("出航")
            touchClick(513, 611)
        elseif isColor(410, 490, 0x9d1111, 95) then
            tiaoShi("防卫工程--红点")
            touchClick(331, 537, 0x306090)
        elseif isColor(808, 314, 0x9d1111, 95) then
            tiaoShi("联盟协助--红点")
            touchClick(758, 362, 0x0c2037)
        elseif isColor(558, 321, 0x9e1111, 95) then
            tiaoShi("联盟研究--红点")
            touchClick(510, 357, 0x0c2037)
        elseif isColor(686, 321, 0x9e1111, 95) and nowTime - timeLianMengRenWu >= 60 * 60 then
            tiaoShi("联盟任务--红点")
            touchClick(638, 366, 0x0c2037)
            if isColor(1020, 546, 0x744218, 95) then
                tiaoShi("联盟任务不能做")
                timeLianMengRenWu = nowTime
                timeJiDi = nowTime
            end

        elseif muBiao1 == mb_WaKuang then

        else
            touchClick(20, 20)
        end
    end
    if isColor(553, 205, 0x345214, 95) and isColor(581, 188, 0x2a72ba, 95) then
        tiaoShi("个人活动--点数奖励")
        touchClick(512, 577, 0x0c0c0e)
    end
    if isColor(274, 160, 0xcda099, 95) and isColor(292, 81, 0x9badde, 95) and isColor(366, 330, 0x78551a, 95) then
        tiaoShi("签到奖励")
        x, y = findColorInRegionFuzzy(0x145e99, 100, 857, 133, 857, 539);
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            touchClick(x, y)
        else
            touchClick(508, 609)
        end
    end
    if isColor(141, 75, 0x406898, 95) and isColor(170, 67, 0xff6600, 95) and isColor(738, 504, 0xd78b01, 95) then
        tiaoShi("推荐礼包--广告")
        touchClick(471, 590)
        touchClick(907, 590)
    end
    if isColor(98, 288, 0xffffff, 95) and isColor(1036, 286, 0xffffff, 95) and isColor(493, 522, 0xd78b00, 95) and
        isColor(897, 587, 0x425f82, 95) then
        tiaoShi("广告画廊")
        touchClick(471, 590)
        touchClick(907, 590)
    end
    if isColor(1073, 32, 0xffffff, 95) and isColor(1058, 32, 0x808080, 95) and isColor(14, 625, 0x000000, 95) then
        tiaoShi("提示")
        touchClick(1073, 32)
    end
    if isColor(7, 23, 0xff9c00, 95) and isColor(17, 23, 0xffffff, 95) and isColor(73, 15, 0xe2e8ef, 95) and
        isColor(161, 29, 0xe1e7ed, 95) then
        tiaoShi("活动中心")
        if isColor(142, 164, 0x9e1111, 95) and isColor(121, 164, 0xa17316, 95) then
            tiaoShi("活动中心1--红点--已选")
            if isColor(1084, 83, 0x9e1111, 95) then
                tiaoShi("规则")
                touchClick(1032, 103, 0x0b7148)
            elseif isColor(783, 560, 0x5966f2, 95) and isColor(944, 558, 0x1a77f3, 95) then
                tiaoShi("STAKING")
                touchClick(944, 558, 0x1a77f3)
            elseif isColor(902, 175, 0x116eb9, 95) and isColor(1009, 176, 0x168961, 95) then
                tiaoShi("预定活动")
                touchClick(88, 182, 0x182637)
            end
        elseif isColor(142, 232, 0x9e1111, 95) and isColor(121, 232, 0xa17316, 95) then
            tiaoShi("活动中心2--红点--已选")
            if isColor(1084, 83, 0x9e1111, 95) then
                tiaoShi("规则")
                touchClick(1032, 103, 0x0b7148)
            elseif isColor(783, 560, 0x5966f2, 95) and isColor(944, 558, 0x1a77f3, 95) then
                tiaoShi("STAKING")
                touchClick(944, 558, 0x1a77f3)
            elseif isColor(902, 175, 0x116eb9, 95) and isColor(1009, 176, 0x168961, 95) then
                tiaoShi("预定活动")
                touchClick(88, 182, 0x182637)
            end
        elseif isColor(117, 304, 0xa17316, 95) and isColor(143, 300, 0x9e1111, 95) then
            tiaoShi("活动中心3--红点--已选")
            if isColor(1084, 83, 0x9e1111, 95) then
                tiaoShi("规则")
                touchClick(1032, 103, 0x0b7148)
            elseif isColor(783, 560, 0x5966f2, 95) and isColor(944, 558, 0x1a77f3, 95) then
                tiaoShi("STAKING")
                touchClick(944, 558, 0x1a77f3)
            elseif isColor(902, 175, 0x116eb9, 95) and isColor(1009, 176, 0x168961, 95) then
                tiaoShi("预定活动")
                touchClick(88, 182, 0x182637)
            end
        elseif isColor(140, 409, 0x9e1111, 95) and isColor(120, 409, 0xa17316, 95) then
            if isColor(1084, 83, 0x9e1111, 95) then
                tiaoShi("规则")
                touchClick(1032, 103, 0x0b7148)
            elseif isColor(783, 560, 0x5966f2, 95) and isColor(944, 558, 0x1a77f3, 95) then
                tiaoShi("STAKING")
                touchClick(944, 558, 0x1a77f3)
            elseif isColor(902, 175, 0x116eb9, 95) and isColor(1009, 176, 0x168961, 95) then
                tiaoShi("预定活动")
                touchClick(88, 182, 0x182637)
            end
        elseif isColor(140, 162, 0x9e1111, 95) and isColor(129, 162, 0x1b2b3f, 95) then
            tiaoShi("活动中心1--红点--未选")
            touchClick(129, 162)
        elseif isColor(142, 231, 0x9e1111, 95) and isColor(127, 231, 0x1b2b3f, 95) then
            tiaoShi("活动中心2--红点--未选")
            touchClick(127, 231)
        elseif isColor(142, 301, 0x9e1111, 95) and isColor(128, 301, 0x1b2b3e, 95) then
            tiaoShi("活动中心3--红点--未选")
            touchClick(128, 301)
        elseif isColor(142, 409, 0x9e1111, 95) and isColor(130, 409, 0x1c2b3f, 95) then
            tiaoShi("活动中心4--红点--未选")
            touchClick(130, 409)
        elseif isColor(135, 471, 0x9d1111, 95) and isColor(130, 482, 0x1b2a3d, 95) then
            tiaoShi("活动中心5--红点--未选")
            touchClick(94, 500, 0xc6c9cd)
        elseif isColor(926, 130, 0xff9c00, 95) and isColor(903, 174, 0x116eb9, 95) and isColor(1013, 176, 0x168961, 95) then
            tiaoShi("预定活动")
            touchClick(20, 20)
        else
            x, y = findColorInRegionFuzzy(0x931012, 95, 135, 75, 135, 612)
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                touchClick(78, y + 19)
            else
                touchMoveXY(79, 573, 79, 190)
                mSleep(1000)
                x1, y1 = findColorInRegionFuzzy(0x931012, 95, 135, 75, 135, 612)
                if x1 ~= -1 and y1 ~= -1 then -- 如果在指定区域找到某点符合条件
                    touchClick(78, y1 + 19)
                else
                    touchClick(20, 20)
                end
            end

        end
    end
    if isColor(207, 23, 0xff6600, 95) and isColor(221, 105, 0x34618e, 95) and isColor(612, 24, 0xff6600, 95) then
        tiaoShi("每日报告1")
        touchClick(510, 609)
    end
    if isColor(207, 23, 0xff6600, 95) and isColor(221, 105, 0x356290, 95) and isColor(618, 24, 0xff6600, 95) then
        tiaoShi("每日报告2")
        touchClick(510, 609)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(73, 17, 0xe2e8ef, 95) and
        isColor(159, 24, 0x97a9be, 95) then
        tiaoShi("奖励中心")
        if isColor(253, 219, 0xf90703, 95) and isColor(281, 314, 0xd6a691, 95) then
            tiaoShi("司令官界面")
            if isColor(1001, 197, 0xf18e07, 95) then
                tiaoShi("领取")
                touchClick(1001, 197)
            elseif isColor(714, 95, 0x9e1111, 95) then
                tiaoShi("新任司令官--红点")
                touchClick(714, 95)
            elseif isColor(905, 94, 0x9e1111, 95) then
                tiaoShi("成长基地--红点")
                touchClick(905, 94)
            elseif isColor(1095, 94, 0x9e1111, 95) then
                tiaoShi("内政强化")
                touchClick(1095, 94)
            elseif isColor(396, 154, 0x9e1111, 95) then
                tiaoShi("第1天")
                touchClick(428, 177)
            elseif isColor(437, 221, 0x9e1111, 95) then
                tiaoShi("第2天")
                touchClick(476, 248)
            elseif isColor(437, 358, 0x9e1111, 95) then
                tiaoShi("第4天")
                touchClick(471, 381)
            elseif isColor(396, 427, 0x9e1111, 95) then
                tiaoShi("第5天")
                touchClick(429, 454, 0xf0dfd3)
            else
                touchClick(20, 20)
            end
        elseif isColor(137, 103, 0x9e1111, 95) and isColor(117, 103, 0xa17316, 95) then
            tiaoShi("签到奖励--红点--已选")
            x, y = findColorInRegionFuzzy(0x145e99, 100, 972, 145, 972, 587);
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                touchClick(x, y)
            else
                touchClick(20, 20)
            end
        elseif isColor(136, 173, 0x9e1111, 95) and isColor(116, 173, 0xa17316, 95) then
            tiaoShi("欢迎礼物--红点--已选")
            x, y = findColorInRegionFuzzy(0x116eb9, 100, 196, 338, 664, 602)
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                touchClick(x, y)
            else
                touchClick(20, 20)
            end
        elseif isColor(137, 311, 0x9e1111, 95) and isColor(114, 311, 0xa17316, 95) then
            tiaoShi("航母活动--红点--已选")
            x, y = findColorInRegionFuzzy(0x116eb9, 100, 202, 349, 663, 599)
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                touchClick(x, y)
            else
                touchClick(20, 20)
            end
            -- elseif isColor(138, 380, 0x9e1111, 95) and isColor(114, 380, 0xa17316, 95) then
            --     tiaoShi("司令官任务--红点--已选")
            --     if isColor(1001, 197, 0xf18e07, 95) then
            --         tiaoShi("领取")
            --         touchClick(1001, 197)
            --     elseif isColor(714, 95, 0x9e1111, 95) then
            --         tiaoShi("新任司令官--红点")
            --         touchClick(714, 95)
            --     elseif isColor(905, 94, 0x9e1111, 95) then
            --         tiaoShi("成长基地--红点")
            --         touchClick(905, 94)
            --     elseif isColor(1095, 94, 0x9e1111, 95) then
            --         tiaoShi("内政强化")
            --         touchClick(1095, 94)
            --     elseif isColor(396, 154, 0x9e1111, 95) then
            --         tiaoShi("第1天")
            --         touchClick(428, 177)
            --     elseif isColor(437, 221, 0x9e1111, 95) then
            --         tiaoShi("第2天")
            --         touchClick(476, 248)
            --     elseif isColor(437, 358, 0x9e1111, 95) then
            --         tiaoShi("第4天")
            --         touchClick(471, 381)
            --     else
            --         touchClick(20, 20)
            --     end
        elseif isColor(137, 103, 0x9e1111, 95) and isColor(122, 107, 0x1b2a3d, 95) then
            tiaoShi("签到奖励--红点--未选")
            touchClick(137, 104)
        elseif isColor(137, 172, 0x9e1111, 95) and isColor(127, 189, 0x192738, 95) then
            tiaoShi("欢迎礼物--红点--未选")
            touchClick(137, 172)
        elseif isColor(137, 311, 0x9e1111, 95) and isColor(122, 311, 0x1b2b3f, 95) then
            tiaoShi("航母活动--红点--未选")
            touchClick(137, 311)
        elseif isColor(137, 380, 0x9e1111, 95) and isColor(124, 380, 0x1b2b3f, 95) then
            tiaoShi("司令官任务--红点--未选")
            touchClick(137, 380)
        else
            touchClick(20, 20)

        end
    end
    if isColor(312, 76, 0xf5a802, 95) and isColor(308, 98, 0x0b4992, 95) and isColor(457, 438, 0xf27c00, 95) and
        isColor(511, 504, 0x1c6db9, 95) then
        tiaoShi("道具信息--复数--使用")
        if muBiao == mb_5DaoJu then
            touchClick(458, 438, 0xf27c00) -- 1个 
            touchClick(511, 504)
            if num5DaoJu >= 5 then
                gaiMuBiao(2, mb_CaiJi, mm_CaiJi)
            end
        else
            if isColor(571, 191, 0x9fa0a0, 95) then -- 灰色全用
                touchClick(511, 504)
            else -- 其它用一半
                touchClick(570, 435)
                touchClick(511, 504)
                mSleep(2000)
            end
        end
    end
    if isColor(312, 116, 0xf5a801, 95) and isColor(307, 127, 0xe0e0e0, 95) and isColor(486, 436, 0x114c8a, 95) and
        isColor(490, 455, 0x1c6ebb, 95) then
        tiaoShi("道具信息--单数--使用")
        touchClick(490, 455, 0x1c6ebb)
        if muBiao == mb_5DaoJu then
            if num5DaoJu >= 5 then
                gaiMuBiao(2, mb_CaiJi, mm_CaiJi)
            end
        end
    end
    if isColor(89, 59, 0xf5a801, 95) and isColor(192, 250, 0x325270, 95) and isColor(300, 407, 0x8f4d14, 95) then
        tiaoShi("补充资源")
        if isColor(1028, 113, 0xffffff, 95) then
            tiaoShi("资源充足")
            touchClick(20, 20)
        elseif isColor(1028, 113, 0x081b33, 95) then
            tiaoShi("资源不足")
            -- ret = dmOcrText(dm_white, 836, 81, 1029, 93, "D8DADC,272523", 80)
            -- tiaoShi(ret)
            -- lua_exit();
            -- mSleep(10)
            -- mSleep(10)
            -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
            -- mSleep(10)
            touchClick(313, 420)

        end
    end

    if isColor(5, 25, 0xff6600, 95) and isColor(17, 25, 0xffffff, 95) and isColor(467, 518, 0x448db2, 95) then
        tiaoShi("舰长")
        if isColor(137, 102, 0x9e1111, 95) then
            tiaoShi("舰长--升级--左上角--红点--内")
            if isColor(1022, 547, 0x9e1111, 95) then
                tiaoShi("舰长--升级--右下角--红点--内")
                touchClick(1022, 547)
            elseif isColor(1023, 254, 0x116eb9, 95) then
                tiaoShi("舰长--使用")
                if isColor(819, 239, 0x00ace4, 95) then
                    tiaoShi("满")
                    touchClick(860, 261)
                else
                    touchClick(1022, 254)
                end
            else
                touchClick(20, 20)
            end
        elseif isColor(135, 167, 0x9e1111, 95) then
            tiaoShi("舰长--提升星级--红点")
            touchClick(99, 179, 0x9b6f15)
            if isColor(823, 572, 0xd88b00, 95) then
                touchClick(823, 572)
            else

                touchClick(20, 20)
            end

        else
            touchClick(20, 20)
        end
    end
    if isColor(7, 24, 0xff9c00, 95) and isColor(611, 73, 0xff7e00, 95) and isColor(1036, 114, 0x116eb9, 95) then
        tiaoShi("舰长列表")
        local bMultiColor = false
        for i = 0, 5, 1 do
            if zongHe_Mult() == true then
                bMultiColor = true
            end
            mSleep(100)
        end
        if bMultiColor == false then
            if isColor(1123, 95, 0x9e1111, 95) then
                tiaoShi("舰长--升级--红点--外")
                touchClick(1077, 116)
            else

                getOut()
            end
        end
    end
    if isColor(250, 135, 0xf5a801, 95) and isColor(247, 148, 0xe0e0e0, 95) and isColor(896, 504, 0x647e8f, 95) then
        tiaoShi("主专长")
        touchClick(512, 572)
    end
    if isColor(307, 126, 0xe0e0e0, 95) and isColor(312, 116, 0xf5a801, 95) and isColor(514, 457, 0x1c6db9, 95) and
        isColor(583, 291, 0x22d5c9, 95) then
        tiaoShi("租用无人机8小时")
        touchClick(514, 457)
    end
    if isColor(8, 24, 0xff9c00, 95) and isColor(63, 333, 0xffffff, 95) and isColor(323, 447, 0x0078fe, 95) then
        tiaoShi("联盟界面")
        local tmpXuanXiang = string.find(zongHeXuanXiang2, "2")
        if tmpXuanXiang ~= nil then
            tiaoShi("选中联盟任务")
            if isColor(781, 94, 0x931012, 95) then -- 1
                touchClick(735, 154)
            elseif isColor(937, 94, 0x931012, 95) then -- 2
                touchClick(893, 156)
            elseif isColor(1094, 94, 0x931012, 95) then -- 3
                touchClick(1052, 156)
                -- elseif isColor(781, 265, 0x931012, 95) then -- 4
                --     touchClick(727, 323)
            elseif isColor(937, 265, 0x931012, 95) then -- 5
                touchClick(883, 327)
            elseif isColor(1094, 265, 0x931012, 95) then -- 6
                touchClick(1057, 327)
            elseif isColor(781, 438, 0x931012, 95) then -- 7
                touchClick(714, 496)
            elseif isColor(937, 438, 0x931012, 95) then -- 8
                touchClick(900, 498)
            elseif isColor(1094, 438, 0x931012, 95) then -- 9
                touchClick(1057, 499)
            else
                touchClick(20, 20)

            end
        else
            touchClick(20, 20)
        end
    end

    if isColor(450, 467, 0xd68b01, 95) and isColor(687, 477, 0x1d6ebb, 95) and isColor(339, 117, 0xff6600, 95) then
        tiaoShi("请手动加入联盟")
        dialog("请手动加入联盟", 0);
        lua_exit();
        mSleep(10)
        mSleep(10)
        -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
        mSleep(10)
    end
    if isColor(17, 24, 0xffffff, 95) and isColor(4, 24, 0xff9c00, 95) and isColor(48, 208, 0x9d96a8, 95) then
        tiaoShi("平台界面")
        local bMultiColor = false
        for i = 0, 5, 1 do
            if zongHe_Mult() == true then
                bMultiColor = true
            end
            mSleep(100)
        end
        if bMultiColor == false then
            if isColor(29, 252, 0xffffff, 95) and isColor(36, 252, 0x8a8a8f, 95) then
                tiaoShi("金属平台为0")
                touchClick(36, 252)
                mSleep(1000)
                touchClick(317, 596)
            else
                touchClick(20, 20)
            end
        end
    end
    if isColor(288, 173, 0x0b4992, 95) and isColor(291, 161, 0xf5a801, 95) and isColor(491, 414, 0x45586c, 95) then
        tiaoShi("变更名称")
        touchClick(565, 272)
        mSleep(2000)
        inputText(randomString(8, 3))
        mSleep(2000)
        touchClick(960, 209)
        mSleep(2000)
        touchClick(571, 435)
        mSleep(1000)
    end
    if isColor(5, 25, 0xff9c00, 95) and isColor(104, 85, 0x30e3fe, 95) and isColor(618, 537, 0xbf7702, 95) then
        tiaoShi("传输室")
        if isColor(930, 141, 0xff6600, 95) then -- ad 0/1
            touchClick(903, 138, 0xff9900)
        elseif isColor(923, 571, 0xff0101, 95) == false then -- 有特殊传输
            touchClick(923, 571)
        elseif isColor(254, 571, 0xff9901, 95) then -- 有普通传输
            touchClick(452, 559)
        elseif isColor(205, 563, 0x07706c, 95) then -- 有免费传输
            touchClick(205, 563)
        else
            touchClick(20, 20)
            isJustBack = false
            numChuanShu = numChuanShu + 1
            writePlist(luaMuLu .. xiangMu .. ".plist", "传输次数", numChuanShu)
        end

    end

    if isColor(1100, 35, 0x7c7c7c, 95) and isColor(611, 599, 0xcecece, 95) then
        tiaoShi("广告--关闭")
        touchClick(1100, 35)
    end
    if isColor(1088, 51, 0xffffff, 95) and isColor(1135, 639, 0xd8366a, 95) then
        tiaoShi("广告--关闭")
        touchClick(1088, 51)
    end
    if isColor(435, 30, 0x1b68c8, 95) and isColor(515, 53, 0xbbbec1, 95) and isColor(626, 75, 0xb6b8bb, 95) and
        isColor(510, 617, 0x0c0c0e, 95) then
        tiaoShi("传输结果")
        touchClick(510, 623)
    end
    if isColor(48, 74, 0xff4545, 95) and isColor(993, 595, 0xd77400, 95) and isColor(962, 579, 0x0780fe, 95) then
        tiaoShi("海盗界面")
        touchClick(993, 595)
        isKillPirate = false -- 杀海盗
        timeKillPirate = nowTime

    end
    if isColor(6, 24, 0xff9c00, 95) and isColor(76, 113, 0xaa3d3d, 95) and isColor(866, 594, 0xd68b02, 95) then
        tiaoShi("海盗--出航")
        if isColor(813, 65, 0xfbfbfb, 95) or isColor(810, 66, 0xff9999, 95) or isColor(793, 63, 0xc80305, 95) then -- 不利
            touchClick(20, 20)
        else
            touchClick(866, 594)
            isKillPirate = false -- 杀海盗
            timeKillPirate = nowTime
        end
    end
    if isColor(282, 64, 0xff6600, 95) and isColor(476, 383, 0x116eb9, 95) and isColor(475, 539, 0xf18e07, 95) then
        tiaoShi("领取奖励")
        touchClick(476, 383)
    end
    if isColor(282, 64, 0xff6600, 95) and isColor(503, 386, 0x124067, 95) and isColor(475, 539, 0xf18e07, 95) then
        tiaoShi("领取奖励--未到时")
        touchClick(20, 20)
    end
    if isColor(16, 24, 0xffffff, 95) and isColor(4, 24, 0xff9c00, 95) and isColor(56, 217, 0x5dfe09, 95) then
        tiaoShi("建设界面")
        local bMultiColor = false;
        for i = 0, 3, 1 do
            if zongHe_Mult() == true then
                bMultiColor = true
            end
            mSleep(100)
        end
        if isColor(57, 216, 0x69ff1d, 95) and isColor(53, 190, 0xffffff, 95) then
            tiaoShi("升级界面")
            if haoLV >= 2 and isTrade == false and isColor(42, 331, 0x831c89, 95) then
                tiaoShi("点击交易所")
                touchClick(42, 331)
                return
            elseif haoLV >= 2 and numAddChangLiang <= 2 and isColor(30, 336, 0x01f520, 95) then
                tiaoShi("点击增产")
                touchClick(42, 331)
                return
            end
            if bMultiColor == false then
                -- if (m_pOp->isColor(365, 504, 0x1c6dbb, 0.95))//可升级
                if isColor(91, 625, 0xf27d12, 95) then
                    tiaoShi("正在生产战舰")
                    isShengChan = false
                    timeShengChan = nowTime
                    touchClick(48, 339, 0x060c27) -- 生产
                    isJiaSuProduce = true
                elseif isColor(431, 589, 0x1c6eba, 95) then
                    tiaoShi("可升级")
                    if isColor(246, 604, 0xfddb81, 95) and isColor(269, 612, 0xfad275, 95) then
                        tiaoShi("免费")
                        touchClick(246, 604)
                    else
                        tiaoShi("花钱升级")
                        touchClick(442, 592)
                    end
                elseif isColor(246, 604, 0xfddb81, 95) and isColor(270, 612, 0xf5c566, 95) then
                    tiaoShi("免费")
                    touchClick(246, 604)
                elseif isColor(421, 598, 0x1eb686, 95) then
                    tiaoShi("建设--加速")
                    touchClick(421, 598)
                    isAutoNext = false
                elseif isColor(652, 368, 0x3e8fee, 95) and isAutoNext == true then
                    tiaoShi("1蓝")
                    touchClick(1089, 356)
                elseif isColor(1104, 356, 0x1a406b, 95) and isAutoNext == true then
                    tiaoShi("1蓝")
                    touchClick(1089, 356)
                elseif isColor(652, 403, 0x3e8fee, 95) and isAutoNext == true then
                    tiaoShi("2蓝")
                    touchClick(843, 390)
                elseif isColor(1104, 390, 0x1a406b, 95) and isAutoNext == true then
                    tiaoShi("2蓝")
                    touchClick(843, 390)
                else
                    getOut()
                end
            end
        elseif isColor(61, 346, 0x0aacc4, 95) and isColor(60, 296, 0xffffff, 95) then
            tiaoShi("生产界面")
            if bMultiColor == false then
                if isColor(579, 617, 0x9f7249, 95) then
                    tiaoShi("T5 => T4")
                    touchClick(483, 603, 0x1e3248)
                    mSleep(1000)
                end
                if isColor(1090, 527, 0x1d6eba, 95) then -- 可生产
                    if isColor(851, 357, 0x15273f, 95) and isColor(851, 411, 0x15273f, 95) and
                        isColor(1087, 357, 0x15273f, 95) and isColor(1087, 411, 0x15273f, 95) then
                        -- 不缺材料
                        tiaoShi("不缺材料")
                        touchClick(1090, 527)
                    else
                        -- 缺材料
                        tiaoShi("缺少材料")
                        if haoLV == 3 then -- 大号
                            isShengChan = false
                            timeShengChan = nowTime
                            getOut()
                        elseif haoLV == 1 then -- 小号
                            touchClick(1090, 527)
                        end
                    end
                elseif isColor(913, 532, 0x15a567, 95) then
                    tiaoShi("可加速")
                    if haoLV == 1 then -- 小号加速
                        tiaoShi("小号加速")
                        touchClick(913, 532)
                    elseif isJiaSuProduce == true then -- 临时加速
                        tiaoShi("临时加速")
                        touchClick(913, 532)
                        isJiaSuProduce = false
                    elseif isJiDiXianKuangIntoProduce == true then
                        tiaoShi("正常进入,退出")
                        getOut()
                        isJiDiXianKuangIntoProduce = false
                    elseif isJiDiXianKuangIntoProduce == false then
                        tiaoShi("任务进入,加速")
                        touchClick(913, 532)
                    end

                elseif isColor(647, 548, 0xf27d12, 95) then
                    tiaoShi("升级中")
                    if haoLV == 3 then -- 大号
                        isShengChan = false
                        timeShengChan = nowTime
                        getOut()
                    elseif haoLV == 2 then -- 成品号
                        isAutoNext = false
                        touchClick(47, 230, 0x7b4c2e) -- 升级
                    end

                else
                    getOut()

                end
            end
        elseif isColor(41, 296, 0xffffff, 95) and isColor(36, 321, 0xc3952b, 95) and isColor(111, 108, 0x4c87ba, 95) then
            tiaoShi("维修界面")
            if isColor(1077, 527, 0x1eb686, 95) and isColor(993, 574, 0x237bc8, 95) then -- 重置
                tiaoShi("可修理--不缺少资源")
                touchClick(984, 589, 0x1d6ebb)
            elseif isColor(988, 525, 0x15a976, 95) and isColor(989, 588, 0x1f2830, 95) then
                tiaoShi("可修理--缺少资源")
                isReceiveEmail = true
                touchClick(20, 20)
                touchClick(698, 586, 0xb4cdf3) -- 打开邮件
            else
                touchClick(20, 20)
            end
        elseif isColor(41, 296, 0xffffff, 95) and isColor(36, 321, 0xc3952b, 95) and isColor(341, 601, 0xd77500, 95) then
            tiaoShi("指挥中心--维修界面")
            if isColor(793, 584, 0x155daa, 95) then
                touchClick(793, 584)
            else
                touchClick(48, 233, 0x325240)
            end
        elseif isColor(42, 357, 0xffe85d, 95) and isColor(43, 322, 0x0a57e4, 95) and isColor(45, 296, 0xffffff, 95) then
            tiaoShi("资源传输装置--兑换")
            if isColor(971, 427, 0x116eb9, 95) then -- 资源4
                touchClick(971, 427)
            elseif isColor(971, 322, 0x116eb9, 95) then -- 资源3
                touchClick(971, 322)
            else
                touchClick(20, 20)
            end
        elseif isColor(63, 340, 0x4d9e9c, 95) and isColor(49, 296, 0xffffff, 95) then
            if isColor(249, 162, 0xa9a9a9, 95) then
                tiaoShi("研究界面")
                touchClick(249, 162, 0xa9a9a9)
            elseif isColor(187, 149, 0xb2a3a3, 95) then
                tiaoShi("研究界面--资源")
                touchClick(150, 176, 0x868686)
            elseif isColor(153, 268, 0x32542c, 95) then
                tiaoShi("研究界面--开发")
            elseif isColor(164, 289, 0x4b9c88, 95) then
                tiaoShi("研究界面--战舰")
            elseif isColor(191, 242, 0xfe729c, 95) then
                tiaoShi("研究界面--精锐怪物")
            elseif isColor(194, 231, 0xc1dbf8, 95) then
                tiaoShi("研究界面--生产")
            elseif isColor(168, 301, 0x1abc1c, 95) then
                tiaoShi("研究界面--防御")

            end
        elseif isColor(60, 334, 0x52524c, 95) and isColor(41, 296, 0xffffff, 95) then
            tiaoShi("充电界面")
            if isColor(308, 153, 0x777777, 95) then
                touchClick(543, 597)
            else
                touchClick(20, 20)
            end
        elseif isColor(42, 331, 0x831c89, 95) and isColor(48, 296, 0xffffff, 95) then
            tiaoShi("交易界面")
            for i = 0, 1, 1 do
                for j = 0, 3, 1 do
                    if isColor(515 + j * 167, 342 + i * 238, 0x051788, 95) or
                        isColor(504 + j * 167, 353 + i * 238, 0x33323b, 95) then
                        touchClick(515 + j * 167, 342 + i * 238)
                        return
                    end
                end
            end
            if isColor(484, 101, 0x00ace4, 95) then -- 免费
                touchClick(484, 101, 0x00ace4)
            else

                touchClick(20, 20)
                isTrade = true
                writePlist(luaMuLu .. xiangMu .. ".plist", "交易行", isTrade)
            end
        elseif isColor(30, 336, 0x01f520, 95) and isColor(41, 296, 0xffffff, 95) then
            tiaoShi("金属资源地界面--增产")
            if numAddChangLiang <= 2 then
                touchClick(1004, 385, 0x1c6dba)
                touchClick(20, 20)
                numAddChangLiang = numAddChangLiang + 1
                writePlist(luaMuLu .. xiangMu .. ".plist", "增产", numAddChangLiang)
                isJustBack = false

            else
                touchClick(20, 20)
                isJustBack = false
            end

        else
            touchClick(20, 20)

        end
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(496, 470, 0x279fd5, 95) and isColor(469, 447, 0x8f4d14, 95) then
        tiaoShi("购买道具--矿物")
        touchClick(496, 470, 0x279fd5)
        mSleep(4000)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(494, 474, 0x9a95a3, 95) and isColor(469, 447, 0x8f4d14, 95) then
        tiaoShi("购买道具--金属")
        touchClick(496, 470, 0x279fd5)
        mSleep(4000)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(499, 476, 0x8644ed, 95) and isColor(469, 447, 0x8f4d14, 95) then
        tiaoShi("购买道具--粒子")
        touchClick(513, 552, 0x0c0c0e)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(494, 464, 0xf8eea7) and isColor(469, 447, 0x8f4d14, 95) then
        tiaoShi("购买道具--金币")
        touchClick(513, 552, 0x0c0c0e)
    end
    if isColor(217, 437, 0x67e5f5, 95) and isColor(399, 444, 0x837e8b, 95) and isColor(597, 444, 0xb1d272, 95) then
        tiaoShi("充电--第二步")
        touchClick(884, 187, 0x0b3466)
        touchClick(884, 271, 0x0b3466)
        touchClick(882, 349, 0x8b9fb7)
        touchClick(647, 504, 0x1a69b6)
    end

    if isColor(275, 58, 0xf5a801, 95) and isColor(737, 130, 0x0d9098, 95) and isColor(290, 225, 0xffffff, 95) and
        isColor(599, 501, 0x1a61a4, 95) then
        tiaoShi("使用道具界面")
        touchClick(599, 501)
    end
    if isColor(6, 24, 0xf59600, 95) and isColor(18, 24, 0xffffff, 95) and isColor(355, 86, 0x5195db, 95) then
        tiaoShi("司令官界面")
        touchClick(20, 20)
    end
    if isColor(291, 168, 0xf5a801, 95) and isColor(282, 175, 0xff6600, 95) and isColor(783, 235, 0x85baf9, 95) then
        tiaoShi("谷歌APP重置失败")
        touchClick(511, 497)
    end
    if isColor(567, 80, 0x99b5cb, 95) and isColor(567, 558, 0x99b5cb, 95) and isColor(567, 572, 0x536270, 95) then
        tiaoShi("剧情图片")
        touchClick(567, 308, 0x7b726d)
    end
    if isColor(430, 206, 0xf87808, 95) and isColor(439, 206, 0x583818, 95) and isColor(567, 269, 0x59271b, 95) then
        tiaoShi("完成章节")
        touchClick(556, 614, 0x262b33)
    end
    if isColor(69, 95, 0xf5a801, 95) and isColor(60, 119, 0xff6600, 95) and isColor(66, 157, 0xff6600, 95) then
        tiaoShi("第N章第N节")
        if isColor(103, 403, 0x0d9098, 95) then
            touchClick(97, 402)
        elseif isColor(256, 403, 0x0d9098, 95) then
            touchClick(256, 402)
        elseif isColor(413, 403, 0x0d9098, 95) then
            touchClick(413, 402)
        elseif isColor(566, 403, 0x0d9098, 95) then
            touchClick(566, 402)
        elseif isColor(716, 403, 0x0d9098, 95) then
            touchClick(716, 402)
        elseif isColor(891, 494, 0x1db586, 95) then
            touchClick(891, 494)
        else
            touchClick(511, 567, 0x0c0c0e)
        end
    end
    if isColor(7, 25, 0xff9c00, 95) and isColor(18, 25, 0xffffff, 95) and isColor(101, 166, 0xffb500, 95) and
        isColor(117, 166, 0x718d9f, 85) then
        tiaoShi("高级商店")
        if isColor(102, 77, 0x9e1111, 95) then -- 免费补给箱子
            touchClick(102, 77)
        else
            touchClick(20, 20)
        end
    end
    if isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and isColor(101, 75, 0xffb500, 95) then
        tiaoShi("背包界面")
        if muBiao == mb_5DaoJu and num5DaoJu <= 4 then
            for i = 0, 8, 1 do
                if isColor(215 + i * 100, 78, 0xa0a0a0, 95) or isColor(215 + i * 100, 78, 0x33a904, 95) then
                    touchClick(215 + i * 100, 117)
                    num5DaoJu = num5DaoJu + 1
                    writePlist(luaMuLu .. xiangMu .. ".plist", "每日5道具", num5DaoJu)

                    break
                end
            end
        else

            -- if isColor(137, 105, 0x9e1111, 95) then -- 资源
            --     touchClick(83, 129, 0x5c6571)
            -- end
            -- if isColor(137, 169, 0x9e1111, 95) then -- 加速
            --     touchClick(83, 191, 0x5c6571)
            -- end
            -- if isColor(137, 233, 0x9e1111, 95) then -- 战争
            --     touchClick(83, 258, 0x5c6571)
            -- end
            -- if isColor(137, 297, 0x9e1111, 95) then -- 材料
            --     touchClick(83, 325, 0x5c6571)
            -- end
            -- if isColor(137, 361, 0x9e1111, 95) then -- 装备
            --     touchClick(83, 383, 0x5c6571)
            -- end
            -- if isColor(137, 425, 0x9e1111, 95) then -- 其它
            --     touchClick(83, 449, 0x5c6571)
            -- end
            touchClick(20, 20, 449, 0x5c6571)
        end
    end
    if isColor(4, 23, 0xff9c00, 95) and isColor(17, 23, 0xffffff, 95) and isColor(1001, 25, 0x0d9098, 95) then
        tiaoShi("邮件界面")
        if isColor(119, 346, 0x9d1111, 95) then
            -- 报告
            touchClick(65, 377)
        elseif isColor(119, 98, 0x9d1111, 95) then
            -- 通知
            touchClick(68, 128, 0x233145)
        elseif isColor(119, 222, 0x9d1111, 95) then
            tiaoShi("战争")
            touchClick(67, 251, 0x949aa1)

        elseif isColor(119, 160, 0x9d1111, 95) then
            tiaoShi("活动--红点--未选中")
            touchClick(61, 192, 0x3f4c5c)
        elseif isColor(92, 172, 0x7c4f1e, 95) then
            tiaoShi("活动--红点--已选中")
            touchClick(1017, 25)
            mSleep(1000)
            touchClick(6, 23)
        else
            touchClick(1017, 25)
            mSleep(1000)
            touchClick(6, 23)
        end
    end

    if isColor(91, 156, 0xff6600, 95) and isColor(272, 156, 0x863f13, 95) then
        tiaoShi("任务界面")
        if muBiao == mb_Reward then
            touchClick(354, 135, 0xb0b0b0) -- 每日任务
        else

            if isColor(433, 111, 0x9d1111, 95) then -- 每日任务--红点
                touchClick(354, 135, 0xb0b0b0)
            elseif isColor(957, 226, 0xfaba00, 95) then -- 宝箱
                touchClick(985, 213)
            else
                touchClick(23, 29)
            end
        end
    end
    if isColor(272, 156, 0xff6600, 95) and isColor(267, 156, 0x843c10, 95) then
        tiaoShi("每日任务界面")
        if muBiao == mb_Reward then
            if isColor(124, 507, 0xf18e07, 95) then
                touchClick(124, 507)
            elseif isColor(299, 197, 0xc5f3f9, 95) then
                touchClick(299, 197)
            elseif isColor(482, 197, 0x8cfbfc, 95) then
                touchClick(482, 197, 0x8cfbfc)
            elseif isColor(672, 197, 0xc4f3f9, 95) then
                touchClick(672, 197, 0xc4f3f9)
            elseif isColor(859, 197, 0xb8f9f7, 95) then
                touchClick(859, 197, 0xb8f9f7)
            elseif isColor(1045, 197, 0xb8f9f7, 95) then
                touchClick(1045, 197)
            else
                touchClick(513, 574)
                gaiMuBiao(2, mm_Wu, mm_Wu)
                gaiMuBiao(1, mb_ZhuXian, mm_ZhuXian)
            end
        else

            if isColor(433, 111, 0x9d1111, 95) then -- 每日任务--红点
                touchClick(354, 135, 0xb0b0b0)
            else
                touchClick(23, 29)
            end
        end
    end
    if isColor(314, 113, 0xf6a801, 95) and isColor(311, 143, 0xe0e0e0, 95) and isColor(311, 142, 0x0b4992, 95) then
        tiaoShi("获得道具")
        touchClick(510, 549, 0x0c0c0e)
    end
    if multiColor({{287, 611, 0x4eabf0}, {844, 451, 0xff8a00}}) then
        tiaoShi("对话框1")
        touchClick(567, 540)
    end
    if multiColor({{286, 611, 0x4aa9f1}, {846, 449, 0xde8116}}) then
        touchClick(567, 540)
        tiaoShi("对话框2")
    end
    local tmpRed = false
    local tmpXuanXiang = string.find(zongHeXuanXiang2, "3")
    if tmpXuanXiang ~= nil then
        tmpRed = true
    end
    if tmpRed == false then
        if isColor(278, 283, 0x03f003, 95) and isColor(337, 287, 0x02ff00, 95) then
            tiaoShi("任务1已完成")
            touchClick(278, 283)
        end
        if isColor(278, 352, 0x02ff00, 95) and isColor(337, 354, 0x02ff00, 95) then
            tiaoShi("任务2已完成")
            touchClick(278, 352)
        end
        if isColor(109, 501, 0xf09006, 95) and isColor(228, 523, 0xf87808, 95) and isColor(984, 495, 0x106fb9, 95) and
            isColor(967, 494, 0x153557, 85) then
            tiaoShi("指引--任务--领取")
            touchClick(109, 501)
        end
    end
end
-- 综合--多点
function zongHe_Mult(...)
    x, y = findMultiColorInRegionFuzzy(0xffde8c, "-43|-3|0xbd834d,-1|-44|0xc68852", 90, 0, 0, 1136, 640, {
        orient = 5
    })
    if x ~= -1 then
        -- 右下
        tiaoShi("右下")
        touchClick(x + 20, y + 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdd85, "-1|-33|0xcfad66,-33|1|0xcc9856", 90, 0, 0, 1136, 640, {
        orient = 5
    })
    if x ~= -1 then
        tiaoShi("右下2")
        touchClick(x + 20, y + 20)
        return true

    end
    x, y = findMultiColorInRegionFuzzy(0xffdc83, "2|-41|0xe8b07c,40|-3|0xbe8e63", 90, 0, 0, 1136, 640, {
        orient = 8
    })
    if x ~= -1 then
        -- 左下
        tiaoShi("左下")
        touchClick(x - 20, y + 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdc87, "1|-36|0xc18349,41|0|0xc68551", 90, 0, 0, 1136, 640, {
        orient = 8
    })
    if x ~= -1 then
        -- 左下
        tiaoShi("左下2")
        touchClick(x - 20, y + 20)
        return true
    end
    -- x, y = findMultiColorInRegionFuzzy(0xffdc87, "-24|0|0xecb46c,0|22|0xe8b671", 90, 0, 0, 1136, 640, {
    --     orient = 2
    -- })
    -- if x ~= -1 then
    --     -- 右上
    --     tiaoShi("右上")
    --     touchClick(x + 20, y - 20)
    --     return true
    -- end
    x, y = findMultiColorInRegionFuzzy(0xffde8b, "3|41|0xc38f60,36|2|0xc4a174", 90, 0, 0, 1136, 640, {
        orient = 1
    })
    if x ~= -1 then
        -- 左上
        tiaoShi("左上")
        touchClick(x - 20, y - 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdc86, "1|44|0xb6855c,43|1|0xb27c4d", 90, 0, 0, 1135, 639, {
        orient = 1
    })
    if x ~= -1 then
        -- 左上
        tiaoShi("左上2")
        touchClick(x - 20, y - 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffde88, "-44|3|0xb98454,-4|44|0xb88456", 90, 0, 0, 1135, 639, {
        orient = 4
    })
    if x ~= -1 then
        tiaoShi("右上")
        touchClick(x + 20, y - 20)
        return true
    end
    return false
end
-- 综合--屏幕乱点
function zongHe_Screen()
    if isColor(18, 24, 0xafafaf, 95) and isColor(7, 24, 0xaf4600, 95) then
        screenClick(18, 24, 0xafafaf)
    end
end
-- 检查红点
function checkRed()
    -- 任务红点
    local tmpRed = false
    local tmpXuanXiang = string.find(zongHeXuanXiang2, "3")
    if tmpXuanXiang ~= nil then
        tmpRed = true
    end
    if isColor(448, 78, 0x33d6ff, 95) then
        tiaoShi("收资源1")
        touchClick(448, 78)
        return true
    elseif isColor(385, 129, 0x2ed4fc, 95) then
        tiaoShi("收资源2")
        touchClick(385, 129)
        return true
    elseif isColor(266, 171, 0x28cdf2, 95) then
        tiaoShi("收资源3")
        touchClick(266, 171)
        return true
    elseif isColor(175, 238, 0x25c9eb, 95) then
        tiaoShi("收资源4")
        touchClick(175, 238)
        return true
    elseif isColor(20, 297, 0x24c8e9, 95) or isColor(20, 295, 0x703a0d, 95) then
        tiaoShi("收资源5")
        touchClick(20, 297)
        return true
    elseif isColor(796, 191, 0x1ccbc8, 95) and isJustBack == true and numAddChangLiang == 0 and haoLV >= 2 then
        tiaoShi("准备增产1")
        touchClick(449, 105, 0x28171d)
        return true
    elseif isColor(796, 191, 0x1ccbc8, 95) and isJustBack == true and numAddChangLiang == 1 and haoLV >= 2 then
        tiaoShi("准备增产2")
        touchClick(387, 153, 0x203d5a)
        return true
    elseif isColor(796, 191, 0x1ccbc8, 95) and isJustBack == true and numAddChangLiang == 2 and haoLV >= 2 then
        tiaoShi("准备增产3")
        touchClick(37, 321, 0x257700)
        return true
    elseif isColor(796, 191, 0x1ccbc8, 95) and isJustBack == true and isTrade == false and haoLV >= 2 then
        tiaoShi("准备交易行")
        touchClick(320, 468, 0x6e1313)
        return true
    elseif isColor(796, 191, 0x1ccbc8, 95) and isJustBack == true and numGuangGao <= 9 and haoLV >= 2 then
        tiaoShi("看广告")
        touchClick(809, 221, 0x7aa0d8)
        return true
    elseif isColor(796, 191, 0x1ccbc8, 95) and isJustBack == true and numChuanShu <= 4 and haoLV >= 2 then
        tiaoShi("点传输")
        touchClick(623, 497, 0xffd4a1)
        return true
    elseif isColor(233, 100, 0x9e1111, 95) and isColor(210, 108, 0x6de4e9, 95) and nowTime - timeJiDi >= 10 * 60 then
        tiaoShi("基地现况--红点")
        touchClick(209, 111, 0x61d5e9)
        return true
    elseif isColor(1121, 110, 0x9e1111, 95) and isColor(1129, 102, 0x9e1111, 95) then
        tiaoShi("验证码--红点")
        touchClick(1096, 137, 0x191d1b)
        return true
    elseif isColor(295, 9, 0x9d1111, 95) and isColor(310, 24, 0x9d1111, 95) then
        tiaoShi("VIP--红点")
        touchClick(285, 42, 0x68401a)
        return true
    elseif isColor(75, 213, 0x961112, 95) and isColor(90, 228, 0x9d1111, 95) and tmpRed == false then
        if isColor(278, 286, 0x02ff00, 95) then -- 任务1完成
            touchClick(278, 286)
            return true
        elseif isColor(278, 351, 0x02ff00, 95) then -- 任务2完成
            touchClick(278, 351)
            return true
        elseif isColor(278, 414, 0x03f003, 95) then -- 任务3完成
            touchClick(278, 414)
            return true
        else
            touchClick(49, 187)
            return true
        end
    elseif isColor(728, 548, 0x9e1111, 95) and tmpRed == false then -- 邮件红点
        touchClick(693, 587)
        return true
        -- elseif isColor(999, 548, 0x9e1111, 95) then -- 背包红点
        --     touchClick(966, 589, 0x434641)
        -- return true
    elseif isColor(902, 541, 0x9d1111, 95) and nowTime - timeLianMeng >= 60 * 60 * 2 then -- 联盟红点
        timeLianMeng = nowTime
        touchClick(869, 582)
        return true
    elseif isColor(1124, 51, 0x9e1111, 95) then -- 右上角红点
        tiaoShi("右上角红点")
        touchClick(1106, 71, 0x111e2e)
        if isColor(730, 106, 0x9d1111, 95) then -- 1-1红点
            touchClick(684, 182, 0x445569)
        elseif isColor(858, 106, 0x9d1111, 95) then -- 1-2红点
            touchClick(810, 169, 0x1c2b3d)
        elseif isColor(993, 115, 0x9e1111, 95) then -- 1-3 红点
            touchClick(937, 187, 0x263649)
        elseif isColor(1120, 115, 0x9e1111, 95) then -- 1-4红点
            touchClick(1068, 182)
        elseif isColor(730, 247, 0x9d1111, 95) then -- 2-1红点
            touchClick(737, 254)
        elseif isColor(858, 247, 0x9d1111, 95) then -- 2-2红点
            touchClick(816, 321, 0x1e2635)
        elseif isColor(993, 254, 0x9d1111, 95) then -- 2-3红点
            touchClick(946, 299, 0x182738)

        end
        return true

    elseif isColor(712, 43, 0x9d1111, 95) and isColor(643, 74, 0x7b5aa3, 95) then
        tiaoShi("联盟帮忙红点")
        touchClick(662, 68)
        -- elseif isColor(902,541,0x9d1111,95) then
        --     tiaoShi("联盟红点")
        --     touchClick(881,594    )
        return true
    else
        return false
    end

end
-- 执行目标
function doTarget()
    tiaoShi("看看 : "..muBiao)
    mSleep(222)
    tiaoShi("看看2 : "..mb_ZhuXian)

    if muBiao == 0 then
        muBiao = mb_ZhuXian
        gaiMuBiao(1,mb_ZhuXian,mm_ZhuXian)
    elseif  muBiao == mb_Wu then
        muBiao = mb_ZhuXian
        gaiMuBiao(1,mb_ZhuXian,mm_ZhuXian)
    elseif  muBiao == false then
        muBiao = mb_ZhuXian
        gaiMuBiao(1,mb_ZhuXian,mm_ZhuXian)
    elseif  muBiao == mb_GuaJi then
        mSleep(333)
        tiaoShi("mb_GuaJi")
        if haoLV == 1 then
            gaiMuBiao(1, mb_ZhuXian, mm_ZhuXian)
        elseif haoLV >= 2 then
            gaiMuBiao(1, mb_EveryDay, mm_EveryDay)
        end
    elseif muBiao == mb_YouHua then
        mSleep(333)
        tiaoShi("mb_YouHua")
        task_JiDi()
    elseif muBiao == mb_ZhuXian then
        mSleep(333)
        tiaoShi("看看主线")
        task()
        zhuXian()
    elseif muBiao == mb_WaKuang then
        mSleep(333)
        tiaoShi("mb_WaKuang")
        waKuang()
    elseif muBiao == mb_ChuHang then
        mSleep(333)
        tiaoShi("mb_ChuHang")
        chuHang()
    elseif muBiao1 == mb_EveryDay then
        mSleep(333)
        tiaoShi("mb_EveryDay")
        everyDayTask()
    end

end
-- 日常
function everyDayTask()
    if muBiao2 == mb_Wu then
        gaiMuBiao(2, mb_5DaoJu, mm_5DaoJu)
    end
    if muBiao == mb_5DaoJu then
        everyDay5DaoJu()
    elseif muBiao == mb_CaiJi then
        task_CaiJi()
    elseif muBiao == mb_Reward then
        task_Reward()
    end
    if outside() then
        tiaoShi("回基地--日常")
        touchClick(1074, 582) -- 回基地
        chongZhiJiDiXianKuang()
    end
end
-- 只做基地
function task_JiDi()
    if inside() then
        if isColor(796, 191, 0x1ccbc8, 95) then -- 基地归位
            touchClick(583, 277, 0xffffff) -- 打开基地
        elseif isColor(17, 505, 0x3b6890, 95) then -- 1号建设中
            touchClick(44, 493, 0x3e342f)
        elseif isColor(108, 505, 0x3b6890, 95) then -- 2号建设中
            touchClick(133, 491, 0x52433d)
        else
            touchClick(1074, 582) -- 出基地
        end
    end
    if outside() then
        tiaoShi("回基地--只做基地")
        touchClick(1074, 582) -- 回基地
        chongZhiJiDiXianKuang()
    end
end
-- 收获
function task_Reward()
    if inside() then
        tiaoShi("收获")
        touchClick(45, 188, 0x060f0f)
    end
end
-- 采集任务
function task_CaiJi()
    if inside() then
        tiaoShi("采集任务")
        touchClick(1015, 71, 0x0d1a2c) -- 基地加成
    end
end
-- 每日5道具
function everyDay5DaoJu()
    if inside() then
        tiaoShi("打开背包")
        touchClick(963, 591, 0x373b37)
    end
end
-- 定时重置
function timeChongZhi()
    if isShengChan == false then
        if nowTime - timeShengChan >= 60 * 60 * 2 then
            isShengChan = true
            timeShengChan = nowTime
        end
    end
end
-- 5分钟不见某界面
function checkXXX(...)
    if isColor(1020, 545, 0x744218, 95) and isColor(1123, 619, 0x744218, 95) then -- 有右下角的灰色块
        timeXXX = nowTime
    end
    if isColor(69, 23, 0xff6600, 95) and isColor(59, 579, 0x00428c, 95) then -- 左上角有基地现况
        timeXXX = nowTime
    end
    if haoLV == 3 then
        if nowTime - timeXXX >= 5 * 60 then
            closeApp(appXiangMu)
            timeXXX = nowTime
            -- numDiaoXian = numDiaoXian + 1
            -- writePlist(luaMuLu .. xiangMu .. ".plist", "numDiaoXian", numDiaoXian)
            -- if numDiaoXian >= 6 then
            --     numDiaoXian = 0
            --     writePlist(luaMuLu .. xiangMu .. ".plist", "numDiaoXian", numDiaoXian)
            --     numDiaoXianDengDai = numDiaoXianDengDai + 1
            --     writePlist(luaMuLu .. xiangMu .. ".plist", "numDiaoXianDengDai", numDiaoXianDengDai)
            --     -- dialog("掉线6次,等一小时",60*60)
            -- end

        end
    else
        if nowTime - timeXXX >= 10 * 60 then
            closeApp(appXiangMu)
            timeXXX = nowTime
        end
    end
end
-- 任务
function task()
    if inside() == true then
        -- mSleep(1000)
        if checkRed() == false then
            if haoLV == 1 then
                -- 主任务
                tiaoShi("主任务")
                touchClick(161, 268)
                if isColor(962, 576, 0xe59b48, 95) then
                    -- if findRed() == true then
                    touchClick(38, 492)
                end
                return
            end
            if haoLV == 3 then
                gaiMuBiao(1, mb_WaKuang, mm_WaKuang)
                return
            end
            if haoLV == 2 then
                gaiMuBiao(1, mb_YouHua, mm_YouHua)
                -- tiaoShi("主任务")
                -- touchClick(161, 268)
                -- if isColor(962, 576, 0xe59b48, 95) then
                --     -- if findRed() == true then
                --     touchClick(38, 492)
                -- end
                return

            end

        end
    end
end
-- 重置基地现况
function chongZhiJiDiXianKuang()
    gaiMuBiao(3, mb_Wu, mm_Wu)
    timeInside = nowTime

    numSearch = 0
    isLiZi = false -- 粒子
    isJustBack = true
    numSearchLiZi = 0
    numSearchLiZiSecond = 20

    if isAgainReward == false then
        if nowDateTime.hour >= 22 and nowDateTime.min >= 0 then
            if muBiao == mb_WaKuang then
                gaiMuBiao(1, mb_EveryDay, mm_EveryDay)
                gaiMuBiao(2, mb_Reward, mm_Reward)

                isAgainReward = true
                writePlist(luaMuLu .. xiangMu .. ".plist", "再次收获", isAgainReward)
            end

        end
    end

end
-- 主线
function zhuXian()
    if outside() then
        mSleep(1000)
        -- if isColor(121, 78, 0x3bc6e8, 95) then
        --     tiaoShi("有体力")
        --     if nowTime - timeKillPirate >= 10 * 60 then
        --         isKillPirate = true -- 杀海盗
        --         timeKillPirate = nowTime
        --     end
        -- else
        --     tiaoShi("无体力")
        --     isKillPirate = false -- 不杀海盗

        -- end
        if isColor(387, 372, 0xa43b40, 95) and isColor(501, 389, 0xa43b40, 95) and isColor(109, 371, 0x00ace4, 95) then
            tiaoShi("粒子--左")
            numSearch = numSearch + 1
            touchClick(387, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                tiaoShi("粒子已在挖")
                isLiZi = true
                touchClick(172, 525) -- 搜索
            end
        elseif isColor(919, 373, 0xa43b40, 95) and isColor(1028, 386, 0xa43b40, 95) and isColor(643, 371, 0x00ace4, 95) then
            tiaoShi("粒子--右")
            numSearch = numSearch + 1
            touchClick(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                tiaoShi("粒子已在挖")
                isLiZi = true
                touchClick(172, 525) -- 搜索
            end
        elseif isColor(497, 383, 0x00798c, 95) and isColor(116, 377, 0x00ace4, 95) then
            tiaoShi("采集--左")
            numSearch = numSearch + 1
            touchClick(407, 383)
        elseif isColor(639, 378, 0x00ace4, 95) and isColor(1027, 380, 0x00798c, 95) then
            tiaoShi("采集--右")
            numSearch = numSearch + 1
            touchClick(1027, 383)
        elseif numSearch >= 10 then
            tiaoShi("回基地")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isColor(1022, 457, 0xffa100, 95) then -- 4队出完
            tiaoShi("4队出完")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        else
            touchClick(1074, 582) -- 回基地
        end
    end
    if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) then
        tiaoShi("搜索界面--主线")
        if isColor(466, 437, 0x0d67b2, 95) then -- 矿
            touchClick(466, 437)
        elseif isColor(593, 435, 0x116eb9, 95) then -- 金属
            touchClick(593, 435)
        elseif isColor(733, 428, 0x116eb9, 95) then -- 三氯气
            touchClick(733, 428)
        elseif isColor(878, 432, 0x116eb9, 95) then -- 新金属粒子
            touchClick(878, 432)
        elseif isColor(170, 430, 0x116eb9, 95) then -- 海盗
            touchClick(170, 430)
        elseif isColor(314, 429, 0x116eb9, 95) then -- 精英
            touchClick(314, 429)
        end
    end
    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and isColor(866, 599, 0xd78b00, 95) and
        isColor(116, 596, 0x517fad, 95) then
        tiaoShi("出航界面")
        if isColor(559, 122, 0x3e6b96, 95) then -- 航母
            touchClick(842, 594, 0xd78b02) -- 出航
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--是
                touchClick(504, 432, 0x1c6eba)
            end
            isLiZi = true -- 粒子
            timeLiZi = nowTime
        else -- 普通采集
            touchClick(842, 594, 0xd78b02) -- 出航
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--否 
                touchClick(512, 496, 0x0c0c0e)
                touchClick(20, 20)
            else

                numChuHang = numChuHang + 1 -- 出航编号
                if numChuHang >= 4 then
                    numChuHang = 1
                end
            end
        end

    end
end
--- 出航
function chuHang()
    if inside() then
        touchClick(1074, 582) -- 出基地
    end

    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and isColor(866, 599, 0xd78b00, 95) and
        isColor(116, 596, 0x517fad, 95) then
        tiaoShi("出航界面")
        if isColor(559, 122, 0x3e6b96, 95) then -- 航母
            touchClick(842, 594, 0xd78b02) -- 出航
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--是
                touchClick(504, 432, 0x1c6eba)
            end
            isLiZi = true -- 粒子
            timeLiZi = nowTime
        else -- 普通采集
            touchClick(842, 594, 0xd78b02) -- 出航
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--否 
                touchClick(512, 496, 0x0c0c0e)
                touchClick(20, 20)
            else
                numChuHang = numChuHang + 1 -- 出航编号
                if numChuHang >= 4 then
                    numChuHang = 1
                end
            end
        end
    end
    if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) then
        tiaoShi("搜索界面--出航")
        if isKillPirate == true then
            tiaoShi("有体力,杀海盗")
            touchClick(358, 537, 0xaecffa) -- 精英
            mSleep(1000)
            for i = 1, 10, 1 do
                touchClick(353, 432, 0x075ea8) -- 搜索
                mSleep(1000)
                if isColor(303, 431, 0x116eb9, 95) == false then
                    break
                end
                if i == 10 then
                    isKillPirate = false
                end
            end
        elseif isLiZi == false then
            touchClick(925, 561, 0x1f101d) -- 粒子
            mSleep(1000)
            for i = 1, 10, 1 do
                touchClick(925, 431, 0x075ea8) -- 搜索
                mSleep(1000)
                if isColor(876, 430, 0x116eb9, 95) == false then
                    break
                end
                if i == 10 then
                    -- isLiZi = true
                    isBug_LiZi = true -- bug 粒子
                    touchClick(20, 20)
                end
            end
        else
            if numChuHang == 1 then
                touchClick(643, 548) -- 金属
                mSleep(1000)
                touchClick(776, 365, 0xffffff) -- 加
                touchClick(639, 434) -- 搜索
                mSleep(1000)
                for i = 1, 2, 1 do
                    if isColor(369, 535, 0x39e3f6, 95) then
                        touchClick(501, 367, 0xe2e4e8) -- 减
                        touchClick(639, 434) -- 搜索
                        mSleep(1000)
                    else
                        break
                    end
                end
            elseif numChuHang == 2 then
                touchClick(783, 561, 0x1f101d) -- 三氯气
                mSleep(1000)
                touchClick(917, 365, 0xffffff) -- 加
                touchClick(783, 431, 0x075ea8) -- 搜索
                mSleep(1000)
                for i = 1, 2, 1 do
                    if isColor(369, 535, 0x39e3f6, 95) then
                        touchClick(644, 367, 0xe2e4e8) -- 减
                        touchClick(783, 431, 0x075ea8) -- 搜索
                        mSleep(1000)
                    else
                        break
                    end
                end
            elseif numChuHang == 3 then
                touchClick(500, 545) -- 矿物
                mSleep(1000)
                touchClick(633, 365, 0xffffff) -- 加
                touchClick(508, 431, 0x075ea8) -- 搜索
                mSleep(1000)
                for i = 1, 2, 1 do
                    if isColor(369, 535, 0x39e3f6, 95) then
                        touchClick(359, 367, 0xe2e4e8) -- 减
                        touchClick(508, 431, 0x075ea8) -- 搜索
                        mSleep(1000)
                    else
                        break
                    end
                end
            end
        end
    end
    if outside() then
        mSleep(1000)
        if isColor(147, 80, 0x37b8d8) then -- 20体力
        -- if isColor(210, 79, 0x39bfe1) then -- 70体力
            tiaoShi("有体力")
            if nowTime - timeKillPirate >= 10 * 60 then
                isKillPirate = true -- 杀海盗
                timeKillPirate = nowTime
            end
        else
            tiaoShi("无体力")
            isKillPirate = false -- 不杀海盗
        end
        if isColor(387, 372, 0xa43b40, 95) and isColor(501, 389, 0xa43b40, 95) and isColor(109, 371, 0x00ace4, 95) then
            tiaoShi("粒子--左")
            numSearch = numSearch + 1
            touchClick(387, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                tiaoShi("粒子已在挖")
                isLiZi = true
                touchClick(172, 525) -- 搜索
            end
        elseif isColor(919, 373, 0xa43b40, 95) and isColor(1028, 386, 0xa43b40, 95) and isColor(643, 371, 0x00ace4, 95) then
            tiaoShi("粒子--右")
            numSearch = numSearch + 1
            touchClick(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                tiaoShi("粒子已在挖")
                isLiZi = true
                touchClick(172, 525) -- 搜索
            end
        elseif isColor(497, 383, 0x00798c, 95) and isColor(116, 377, 0x00ace4, 95) then
            tiaoShi("采集--左")
            numSearch = numSearch + 1
            touchClick(407, 383)
        elseif isColor(639, 378, 0x00ace4, 95) and isColor(1027, 380, 0x00798c, 95) then
            tiaoShi("采集--右")
            numSearch = numSearch + 1
            touchClick(1027, 383)
        elseif numSearch >= 10 then
            tiaoShi("回基地")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isColor(1022, 457, 0xffa100, 95) then -- 4队出完
            tiaoShi("4队出完")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isBug_LiZi == true then
            searchLiZi()
        else
            if isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) then
                isRewardLiZi()
                touchClick(199, 522) -- 搜索
            elseif isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) == false then
                touchClick(570, 469, 0x4a6181)
            end

        end
    end
end
-- 判断是否有队伍在采集粒子
function isRewardLiZi()
    if nowTime - timeLiZi >= 3 * 60 then
        timeLiZi = nowTime
        if isColor(1115, 242, 0xfefefe, 95) then -- 1队有人
            touchClick(1058, 244, 0xdaa395)
            mSleep(3000)
            if isColor(154, 305, 0x6c1cde, 95) or isColor(687, 305, 0x6c1cde, 95) then
                isLiZi = true
                return true
            end
        end
        if isColor(1115, 304, 0xfefefe, 95) then -- 2队有人
            touchClick(1058, 300, 0xdaa395)
            mSleep(3000)
            if isColor(154, 305, 0x6c1cde, 95) or isColor(687, 305, 0x6c1cde, 95) then
                isLiZi = true
                return true
            end
        end
        if isColor(1115, 367, 0xfefefe, 95) then -- 3队有人
            touchClick(1058, 364, 0xdaa395)
            mSleep(3000)
            if isColor(154, 305, 0x6c1cde, 95) or isColor(687, 305, 0x6c1cde, 95) then
                isLiZi = true
                return true
            end
        end
    else
        isLiZi = true
        return true
    end
    return false
end
-- 搜索粒子
function searchLiZi()
    for i = 1, numSearchLiZiSecond, 1 do
        -- tiaoShi("搜索粒子")
        if isColor(6, 24, 0xf59600, 95) and isColor(18, 24, 0xffffff, 95) and isColor(355, 86, 0x5195db, 95) then
            tiaoShi("司令官界面")
            touchClick(20, 20)
        end
        if isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) == false then
            tiaoShi("外太空")
            touchClick(571, 467, 0x05305c)
        end
        if isColor(180, 147, 0x215da6, 95) and isColor(202, 204, 0x4c92da, 95) and isColor(503, 515, 0x233341, 95) and
            isColor(741, 516, 0x2f2a33, 95) then
            tiaoShi("外太空玩家1")
            touchClick(511, 600, 0x0c0c0e)
            touchClick(571, 467, 0x05305c)
        end
        local intX0 = 1
        for j = 1, 10, 1 do
            -- 1: 0,0,0,0 范围坐标，请自行修改
            -- 2: "FAC52A , 030303" 偏色,多组或单组.请在偏色列表中选择
            -- 3: 90 匹配精度 【0-100】
            -- x1, y1 = tsFindText(index_lizi2, "1", 123, 145, 535 + 20, 310 + 20, "FAC52A , 030303", 94)
            -- x2, y2 = tsFindText(index_lizi2, "1", 535 - 20, 145, 1020, 310 + 20, "FAC52A , 030303", 94)
            -- x3, y3 = tsFindText(index_lizi2, "1", 5, 310 - 20, 535 + 20, 492, "FAC52A , 030303", 94)
            -- x4, y4 = tsFindText(index_lizi2, "1", 535 - 20, 310 - 20, 1020, 531, "FAC52A , 030303", 94)
            -- x, y = tsFindText(index_lizi2, "1", 123, 145, 893, 474, "FAC52A , 030303", 94)
            -- x, y = tsFindText(index_lizi1, "1", 123, 145, 893, 474, "775D13 , 4D3D0F", 90)
            x, y = tsFindText(index_lizi2, "1", intX0, 100, 1020, 540, "FAC52A , 030303", 94) -- 竖着从左至右全屏扫
            if x ~= -1 then
                touchClick(x + 48, y - 23)
                mSleep(2000)
                -- x5, y5 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-105|0xd7d9dc", 90, 66, 14, 1126, 529)--红攻击 不抢
                -- x6, y6 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-106|0xd6d8db", 90, 66, 14, 1126, 529)--红攻击 不抢
                x1, y1 =
                    findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,-265|-70|0x7e42e0", 80, 66, 14, 1126, 529) -- 红攻击 抢
                x2, y2 =
                    findMultiColorInRegionFuzzy(0x00798c, "-195|-69|0x8446e5,-14|0|0x00ace4", 90, 66, 14, 1126, 529) -- 蓝采集
                if x1 ~= -1 then
                    tiaoShi("红色攻击")
                    touchClick(x1, y1)
                    isBug_LiZi = false
                    numSearchLiZi = 0
                    isLiZi = true
                    if isColor(490, 431, 0x1d6eb9, 95) then -- 抢
                        touchClick(490, 431)
                    end
                    return
                elseif x2 ~= -1 then
                    tiaoShi("蓝色采集")
                    touchClick(x2, y2)
                    isBug_LiZi = false
                    numSearchLiZi = 0
                    isLiZi = true
                    return
                elseif isColor(1106, 574, 0xd88b00, 95) then
                    tiaoShi("这是海盗,不是粒子")
                    mSleep(1000)
                    touchClick(20, 20)
                    mSleep(1000)
                else
                    touchClick(20, 20) -- 瞎点一下
                    mSleep(1000)
                    if isColor(9, 10, 0xff9c00, 95) then
                        tiaoShi("误开司令官")
                        touchClick(20, 20)
                        mSleep(1000)
                    end
                end
                intX0 = x + 10
            else
                if numSearchLiZi == 0 then -- 上
                    touchMoveXY(504, 101, 511, 603 - 100)
                elseif numSearchLiZi == 1 then -- 下
                    touchMoveXY(511, 530, 504, 25 + 100)
                elseif numSearchLiZi == 2 then -- 左
                    touchMoveXY(17, 297, 874 - 200, 282)
                elseif numSearchLiZi == 3 then -- 右
                    touchMoveXY(874, 282, 17 + 200, 297)
                elseif numSearchLiZi == 4 then -- 左上
                    touchMoveXY(107, 130, 983 - 200, 503 - 100)
                elseif numSearchLiZi == 5 then -- 右上
                    touchMoveXY(885, 117, 16 + 200, 478 - 100)
                elseif numSearchLiZi == 6 then -- 右下
                    touchMoveXY(983, 503, 107 + 200, 130 + 100)
                elseif numSearchLiZi == 7 then -- 左下
                    touchMoveXY(16, 478, 885 - 200, 117 + 100)
                end
                mSleep(1000)
                if i == numSearchLiZiSecond then
                    touchClick(568, 569, 0x0a0a0f) -- 归位
                    mSleep(1000)
                    numSearchLiZi = numSearchLiZi + 1
                    if numSearchLiZi == 7 then
                        numSearchLiZi = 0
                        isLiZi = true
                        isBug_LiZi = false
                    end
                end
                break
            end
        end
    end
end
-- 退出
function getOut()
    for i = 1, 10, 1 do
        if isColor(7, 24, 0xff9c00, 95) then
            touchClick(20, 20)
            mSleep(1000)
        else
            return
        end
    end
end
-- 找红图
function findRed()
    x, y = findImage("red.bmp", 355, 253, 403, 351); -- 在（0,0）到（w-1,h-1）寻找刚刚截图的图片
    if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某图片符合条件
        return true
    else -- 如果找不到符合条件的图片
        return false
    end
end
-- 挖矿
function waKuang()
    if inside() == true then
        mSleep(1000)
        if checkRed() == false then
            if isColor(212, 107, 0x5fe4e7, 95) then -- 有基地现况图标
                touchClick(213, 107)
            end
        end
    end
    if outside() then
        if muBiao == mb_ChuHang then

        else
            tiaoShi("目标挖矿,回基地")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        end
    end
    if isColor(69, 23, 0xff6600, 95) and isColor(92, 37, 0xb4c0ce, 95) and isColor(173, 44, 0x9eabbb, 95) then
        tiaoShi("基地现况界面--函数挖矿")
        if isColor(94, 325, 0x306090, 95) then -- 4号休息中
            tiaoShi("4号休息中,出航")
            touchClick(94, 325)
            if isColor(94, 325, 0x306090, 95) then -- 4号出航失败

            else
                gaiMuBiao(3, mb_ChuHang, mm_ChuHang)
            end
        elseif nowTime - timeInside >= 5 * 60 then
            touchClick(510, 608, 0x0c0c0e)
            timeInside = nowTime
        end
    end
end
-- 基地内
function inside(...)
    if isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and isColor(1031, 577, 0xffffff, 95) then
        -- tiaoShi("室内")
        return true
    else
        return false
    end
end
-- 基地外
function outside(...)
    if isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and isColor(1039, 574, 0xf0f0f1, 95) then
        -- tiaoShi("室外")
        if isColor(1053, 199, 0xffffff, 95) and isColor(1068, 193, 0xffffff, 95) then
            tiaoShi("收缩队伍")
            touchClick(1068, 193, 0xffffff)
        end
        return true
    else
        return false
    end
end
-- 每日重置
function everyDayInit(...)
    -- if nowDateTime.day ~= nowDayNight and nowDateTime.hour >= 23 and nowDateTime.min >= 55 then
    --     tiaoShi("晚重置")
    --     nowDayNight = nowDateTime.day
    --     writePlist(luaMuLu .. xiangMu .. ".plist", "日期晚", nowDayNight)
    --     numJiaoYi = 0
    --     writePlist(luaMuLu .. xiangMu .. ".plist", "交易次数", numJiaoYi)
    --     numJiaoYiChaoShi = 0
    --     writePlist(luaMuLu .. xiangMu .. ".plist", "交易超时", numJiaoYiChaoShi)
    -- end
    -- if numQuanShu ~= 0 then
    -- local tmpXuanXiang = string.find(duoXuan1, "1")
    -- if tmpXuanXiang ~= nil then
    if nowDateTime.day ~= nowDay then
        if nowDateTime.hour >= 8 and nowDateTime.min >= 0 then
            tiaoShi("8点0分重置")

            nowDay = nowDateTime.day
            writePlist(luaMuLu .. xiangMu .. ".plist", "日期", nowDay)

            numDay = numDay + 1
            writePlist(luaMuLu .. xiangMu .. ".plist", "第几天", numDay)

            numGuangGao = 0
            writePlist(luaMuLu .. xiangMu .. ".plist", "广告次数", numGuangGao)

            numChuanShu = 0
            writePlist(luaMuLu .. xiangMu .. ".plist", "传输次数", numChuanShu)

            isTrade = false
            writePlist(luaMuLu .. xiangMu .. ".plist", "交易行", isTrade)

            num5DaoJu = 0
            writePlist(luaMuLu .. xiangMu .. ".plist", "每日5道具", num5DaoJu)

            numAddChangLiang = 0
            writePlist(luaMuLu .. xiangMu .. ".plist", "增产", numAddChangLiang)

            isAgainReward = false
            writePlist(luaMuLu .. xiangMu .. ".plist", "再次收获", isAgainReward)

            if haoLV >= 2 then
                gaiMuBiao(1, mb_EveryDay, mm_EveryDay)
                gaiMuBiao(2, mb_Wu, mm_Wu)
                gaiMuBiao(3, mb_Wu, mm_Wu)
            end

            -- today = tonumber(os.date("%w",os.time()))
            -- if today == 1 then --如果是星期一
            --         if APP1.isZhuZhan == 2 then
            --                 APP1.isZhuZhan = 1
            --                 writePlist(luaMuLu..xiangMu..".plist","助战1",APP1.isZhuZhan)
            --         end
            --         if APP2.isZhuZhan == 2 then
            --                 APP2.isZhuZhan = 1
            --                 writePlist(luaMuLu..xiangMu..".plist","助战2",APP2.isZhuZhan)
            --         end
            --         if APP1.isJiFenDuiHuan == 1 then
            --                 APP1.isJiFenDuiHuan = 0
            --                 writePlist(luaMuLu..xiangMu..".plist","积分兑换1",APP1.isJiFenDuiHuan)
            --         end
            --         if APP2.isJiFenDuiHuan == 1 then
            --                 APP2.isJiFenDuiHuan = 0
            --                 writePlist(luaMuLu..xiangMu..".plist","积分兑换2",APP2.isJiFenDuiHuan)
            --         end
            -- end
            -- closeApp(appXiangMu)
            -- numJiaoSe = 0
            -- writePlist(luaMuLu .. xiangMu .. ".plist", "角色", numJiaoSe)
            -- huanJiaoSeChongZhi()
            -- timeMaiLan = nowTime
            -- writePlist(luaMuLu .. xiangMu .. ".plist", "timeMaiLan", timeMaiLan)

            -- isWeiXinWeiHu = false
            -- writePlist(luaMuLu .. xiangMu .. ".plist", "微信维护", isWeiXinWeiHu)
            -- hourWeiXin = random(10, 22)
            -- minWeiXin = random(1, 50)
            -- writePlist(luaMuLu .. xiangMu .. ".plist", "时", hourWeiXin)
            -- writePlist(luaMuLu .. xiangMu .. ".plist", "分", minWeiXin)

            -- gaiMuBiao(1, mb_YouHua, mm_YouHua)
        end
    end
    -- end
    -- end
end
