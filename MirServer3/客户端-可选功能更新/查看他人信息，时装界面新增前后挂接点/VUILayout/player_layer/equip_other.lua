--------------------------------------------------------------
-- This file was automatically generated and called by F8.
--------------------------------------------------------------
local SL = _G["SL"]
local GUI = _G["GUI"]

local player_layer_equip_other = {}
----------------- ↓↓↓ local variables ↓↓↓ --------------------
local root
local ui

--"0#1#2#3#4#5#6#7#8#60#10#11#16#12#9#61#14#17#18#71#72#73",
-- key: 控件下标  value: 部位
local setPos = {
    [0]  = 0,  [1]  = 1,  [2]  = 2,  [3]  = 3,  [4]  = 4,
    [5]  = 5,  [6]  = 6,  [7]  = 7,  [8]  = 8,  [9]  = 60,
    [10] = 10, [11] = 11, [12] = 16, [13] = 12, [14] = 9,
    [15] = 61, [16] = 14, [17] = 17, [18] = 18, [19] = 71,
    [20] = 72, [21] = 73
}

local innerSetPos = {
    [101] = 0, [102] = 1, [103] = 4, [104] = 16,
}
----------------- ↓↓↓ event callback ↓↓↓ ---------------------
local events = {
    Attach              = SL:AddAttachEvent("player_layer/equip_other"),
    UnAttach            = SL:AddUnAttachEvent("player_layer/equip_other"),
    UpdateAttr          = SL:AddLuaEvent(LUA_EVENT_PLAYER_LOOK_RUSH_ATT),

    UpdateUIModel       = SL:AddLuaEvent(LUA_EVENT_INNER_EMBATTLE),          --特殊内观特效

    UpdateUI            = SL:AddLuaEvent(LUA_EVENT_LOOK_UPDATE) --更新所有UI
}
--------------------------------------------------------------

function player_layer_equip_other.Attach(layerRoot)
    root = layerRoot
    ui = GUI:ui_delegate(layerRoot)

    -------↓↓↓ player_layer_equip_other script ↓↓↓---- UTF-8
    SL:Print("player_layer/equip_other 打开了！")

    --添加挂节点
    SL:InitSUIComponetAttach(ui.Panel_1, 301)
    SL:InitSUIComponetAttach(ui.nd_button, 3002)

    -------↑↑↑ player_layer_equip_other script ↑↑↑----

    player_layer_equip_other._is_super_dress  = SL:GetMetaValue("SETTING_ENABLED", 105) == 1  --是否显示时装
    player_layer_equip_other._is_super_weapon = SL:GetMetaValue("SETTING_ENABLED", 105) == 1  --是否显示时装武器
    player_layer_equip_other._l_m_player_data = SL:GetMetaValue("L.M.PLAYER_DATA_R")

    for i=1,3 do
        GUI:setVisible(GUI:getChildByName(ui["Panel_btn_sel"], "Btn_sel_"..i), false)
    end

    -- 关闭
    -- GUI:addOnClickEvent(ui["Button_close"], function()
    --     GUI:CloseLayer("player_layer/equip_other")
    -- end)

    GUI:addOnClickEvent(ui["Button_attr"], function ()
        GUI:OpenLayer("player_layer/attr_other", {autoClose = true})
    end)

    player_layer_equip_other.UpdateName()

    player_layer_equip_other.UpdateLevel({currlevel=player_layer_equip_other._l_m_player_data.Level})
    
    player_layer_equip_other.UpdateExp({currexp=0})
    
    player_layer_equip_other.UpdateHPMP({
        curHP = SL:GetMetaValue("L.M.HP"),
        maxHP = SL:GetMetaValue("L.M.MAX_HP"),
        curMP = SL:GetMetaValue("L.M.MP"),
        maxMP = SL:GetMetaValue("L.M.MAX_MP"),
    })

    player_layer_equip_other.UpdateAttr()

    player_layer_equip_other.UpdateAllEquip( true )
end

function player_layer_equip_other.UnAttach()
    SL:RemoveSUIComponetAttach(301)
    SL:RemoveSUIComponetAttach(3002)

    root = nil
    ui = nil
end

function player_layer_equip_other.UpdateName()
    -- 玩家名字
    GUI:Text_setString(ui["Text_name"], SL:GetMetaValue("LOOK_USER_NAME"))
    -- 玩家行会
    local guildData = SL:GetMetaValue("L.M.GUILD_INFO_R")
    GUI:Text_setString(ui["Text_guild"], guildData.guildName or "")
    -- 玩家封号
    local leaderStr = ""
    if guildData.rankName and guildData.rankName ~= "" then
        leaderStr = string.format("【%s】", guildData.rankName)
    end
    GUI:Text_setString(ui["Text_leader"], leaderStr)

    -- 配偶名字
    local dearNameText = GUI:getChildByName(ui["Node_other"], "Text_dear_name")
    GUI:Text_setString(dearNameText, player_layer_equip_other._l_m_player_data.DearName or "")

    -- 师傅名字
    local siFuNameText = GUI:getChildByName(ui["Node_sifu"], "Text_sifu_name")
    GUI:Text_setString(siFuNameText, player_layer_equip_other._l_m_player_data.MasterName or "")
end

-- 刷新等级
function player_layer_equip_other.UpdateLevel( data )
    local levelItem = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_1")
    local nameText  = GUI:getChildByName(levelItem, "Text_z")
    GUI:Text_setString(nameText, "等级")
    local levelText = GUI:getChildByName(levelItem, "Text_bas")
    GUI:Text_setString(levelText,data.currlevel)
end

-- 刷新经验
function player_layer_equip_other.UpdateExp( data )
    local expItem   = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_2")
    local nameText  = GUI:getChildByName(expItem, "Text_z")
    GUI:Text_setString(nameText, "经验")
    local expText = GUI:getChildByName(expItem, "Text_bas")
    local curexp = math.max(SL:GetMetaValue("L.M.EXP"), 1)
    local maxexp = math.max(SL:GetMetaValue("L.M.MAX_EXP"), 1)
    local percent= curexp/maxexp*100
    local expStr = string.format("%.1f%%", percent)
    GUI:Text_setString(expText, expStr)
end

-- 刷新HP MP
function player_layer_equip_other.UpdateHPMP( data )
    local hpItem = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_3")
    local nameText  = GUI:getChildByName(hpItem, "Text_z")
    GUI:Text_setString(nameText, "生命")
    local hpText = GUI:getChildByName(hpItem, "Text_bas")

    local curHP = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.HP"))
    local maxHP = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.MAX_HP"))
    local hpStr  = string.format("%s/%s", curHP, maxHP)
    GUI:Text_setString(hpText, hpStr)

    local mpItem = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_4")
    local nameText  = GUI:getChildByName(mpItem, "Text_z")
    GUI:Text_setString(nameText, "魔法")
    local mpText = GUI:getChildByName(mpItem, "Text_bas")

    local curMP = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.MP"))
    local maxMP = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.MAX_MP"))
    local mpStr  = string.format("%s/%s", curMP, maxMP)
    GUI:Text_setString(mpText, mpStr)
end

-- 刷新属性
function player_layer_equip_other.UpdateAttr()
    player_layer_equip_other.UpdateLevel({currlevel=player_layer_equip_other._l_m_player_data.Level})
    
    player_layer_equip_other.UpdateExp({currexp=0})
    
    player_layer_equip_other.UpdateHPMP({
        curHP = SL:GetMetaValue("L.M.HP"),
        maxHP = SL:GetMetaValue("L.M.MAX_HP"),
        curMP = SL:GetMetaValue("L.M.MP"),
        maxMP = SL:GetMetaValue("L.M.MAX_MP"),
    })

    player_layer_equip_other.UpdateBaseAttr()
    player_layer_equip_other.UpdateOtherAttr()
    player_layer_equip_other.UpdateYuanSuAttr()
end

-- 刷新基础属性
function player_layer_equip_other.UpdateBaseAttr()
    -- 肩力属性
    local weightItem = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_5")
    local nameText   = GUI:getChildByName(weightItem, "Text_z")
    GUI:Text_setString(nameText, "肩力")
    local weightText = GUI:getChildByName(weightItem, "Text_bas")
    local weightStr  = string.format("%s/%s", SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Wear_Weight), SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Max_Wear_Weight))
    GUI:Text_setString(weightText, weightStr)

    -- 腕力属性
    local wearWeightItem = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_6")
    local nameText  = GUI:getChildByName(wearWeightItem, "Text_z")
    GUI:Text_setString(nameText, "腕力")
    local wearWeightText = GUI:getChildByName(wearWeightItem, "Text_bas")
    local wearWeightStr  = string.format("%s/%s", SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Hand_Weight), SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Max_Hand_Weight))
    GUI:Text_setString(wearWeightText, wearWeightStr)

    -- 准确
    local hitPointItem = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_7")
    local nameText  = GUI:getChildByName(hitPointItem, "Text_z")
    GUI:Text_setString(nameText, "准确")
    local hitPointText = GUI:getChildByName(hitPointItem, "Text_bas")
    GUI:Text_setString(hitPointText,  SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Hit_Point))

    -- 敏捷
    local speedPointItem = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_8")
    local nameText  = GUI:getChildByName(speedPointItem, "Text_z")
    GUI:Text_setString(nameText, "敏捷")
    local speedPointText = GUI:getChildByName(speedPointItem, "Text_bas")
    GUI:Text_setString(speedPointText, SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Speed_Point))

    -- 幸运
    local luckyItem = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_9")
    local nameText  = GUI:getChildByName(luckyItem, "Text_z")
    GUI:Text_setString(nameText, "幸运")
    local luckyText = GUI:getChildByName(luckyItem, "Text_bas")
    GUI:Text_setString(luckyText, SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Lucky))

    -- 攻速
    local hitSpeedItem = GUI:getChildByName(ui["ScrollView_att"], "Panel_att_item_10")
    local nameText  = GUI:getChildByName(hitSpeedItem, "Text_z")
    GUI:Text_setString(nameText, "攻速")
    local hitSpeedText = GUI:getChildByName(hitSpeedItem, "Text_bas")
    GUI:Text_setString(hitSpeedText, SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Hit_Speed))
end

-- 刷新其它属性
function player_layer_equip_other.UpdateOtherAttr()
    -- fix att position
    local function fixattTextPos(attText)
        local attStr = GUI:Text_getString(attText)
        if #attStr > 9 then
            GUI:setAnchorPoint(attText, 0, 0.5)
            GUI:setPositionX(attText, 37)
        else
            GUI:setAnchorPoint(attText, 0.5, 0.5)
            GUI:setPositionX(attText, 75)
        end
    end

    -- 破坏
    local atkItem = GUI:getChildByName(ui["Panel_att"], "pl_item_1")
    local nameText  = GUI:getChildByName(atkItem, "Text_z")
    GUI:Text_setString(nameText, "破坏")
    local atkText = GUI:getChildByName(atkItem, "Text_att")
    local curAtk = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Min_ATK))
    local maxAtk = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Max_ATK))
    local atkStr  = string.format("%s-%s", curAtk, maxAtk)
    GUI:Text_setString(atkText, atkStr)
    fixattTextPos(atkText)

    -- 防御
    local defItem = GUI:getChildByName(ui["Panel_att"], "pl_item_2")
    local nameText  = GUI:getChildByName(defItem, "Text_z")
    GUI:Text_setString(nameText, "防御")
    local defText = GUI:getChildByName(defItem, "Text_att")
    local curDef = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Min_DEF))
    local maxDef = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Max_DEF))
    local defStr  = string.format("%s-%s", curDef, maxDef)
    GUI:Text_setString(defText, defStr)
    fixattTextPos(defText)

    -- 自然
    local matItem = GUI:getChildByName(ui["Panel_att"], "pl_item_4")
    local nameText  = GUI:getChildByName(matItem, "Text_z")
    GUI:Text_setString(nameText, "自然")
    local matText = GUI:getChildByName(matItem, "Text_att")
    local curMat = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Min_MAT))
    local maxMat = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Max_MAT))
    local matStr  = string.format("%s-%s", curMat, maxMat)
    GUI:Text_setString(matText, matStr)
    fixattTextPos(matText)

    -- 灵魂
    local daoShuItem = GUI:getChildByName(ui["Panel_att"], "pl_item_5")
    local nameText  = GUI:getChildByName(daoShuItem, "Text_z")
    GUI:Text_setString(nameText, "灵魂")
    local daoShuText = GUI:getChildByName(daoShuItem, "Text_att")
    local curDaoShu = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Min_Daoshu))
    local maxDaoShu = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Max_Daoshu))
    local daoShuStr  = string.format("%s-%s", curDaoShu, maxDaoShu)
    GUI:Text_setString(daoShuText, daoShuStr)
    fixattTextPos(daoShuText)

    -- 魔御
    local mdfItem = GUI:getChildByName(ui["Panel_att"], "pl_item_6")
    local nameText  = GUI:getChildByName(mdfItem, "Text_z")
    GUI:Text_setString(nameText, "魔御")
    local mdfText = GUI:getChildByName(mdfItem, "Text_att")
    local curMd = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Min_MDF))
    local maxMd = player_layer_equip_other.SetFormatAtt(SL:GetMetaValue("L.M.ATTR_BY_ID", PShowAttType.Max_MDF))
    local mdfStr  = string.format("%s-%s", curMd, maxMd)
    GUI:Text_setString(mdfText, mdfStr)
    fixattTextPos(mdfText)
end

-- 刷新元素属性
function player_layer_equip_other.UpdateYuanSuAttr()
    local yuanSuAttrID = {}
    -- 攻击元素
    yuanSuAttrID[1] = {101,102,103,104,105,106,107}
    -- 强/弱元素
    yuanSuAttrID[2] = {111,112,113,114,115,116,117}

     local nodeIndex = 1
    for i,v in ipairs(yuanSuAttrID[1]) do
        local eleMes    = SL:GetMetaValue("L.M.ATTR_BY_ID", v)
        local attText   = GUI:getChildByName(ui["Panel_att_ele_1"], "Text_att_" .. nodeIndex)
        local attButton = GUI:getChildByName(ui["Panel_att_ele_1"], "btn_show_" .. nodeIndex)
        if eleMes and eleMes > 0 then
            GUI:Text_setString(attText, "+".. eleMes)
            GUI:Button_setBright(attButton, false)
        else
            GUI:Text_setString(attText, "")
            GUI:Button_setBright(attButton, true)
        end
        nodeIndex = nodeIndex + 1
    end

    nodeIndex = 1
    for i,v in ipairs(yuanSuAttrID[2]) do
        local eleMes     = SL:GetMetaValue("L.M.ATTR_BY_ID", v)
        local qAttText   = GUI:getChildByName(ui["Panel_att_ele_2"], "Text_att_" .. nodeIndex)
        local qAttButton = GUI:getChildByName(ui["Panel_att_ele_2"], "btn_show_" .. nodeIndex)
        local rAttText   = GUI:getChildByName(ui["Panel_att_ele_3"], "Text_att_" .. nodeIndex)
        local rAttButton = GUI:getChildByName(ui["Panel_att_ele_3"], "btn_show_" .. nodeIndex)
        if eleMes and eleMes > 0 then
            GUI:Text_setString(qAttText, "x".. math.abs(eleMes))
            GUI:Button_setBright(qAttButton, false)
        else
            GUI:Text_setString(qAttText, "")
            GUI:Button_setBright(qAttButton, true)
        end

        if eleMes and eleMes < 0 then
            GUI:Text_setString(rAttText, "x".. math.abs(eleMes))
            GUI:Button_setBright(rAttButton, false)
        else
            GUI:Text_setString(rAttText, "")
            GUI:Button_setBright(rAttButton, true)
        end
        nodeIndex = nodeIndex + 1
    end
end

-- 装备位相关
function player_layer_equip_other.UpdateAllEquip( isInit )
    for _nIndex,_pos in pairs(setPos) do
        local posPanel = ui["Panel_pos" .. _nIndex]
        if posPanel then
            GUI:removeAllChildren(GUI:getChildByName(posPanel,"Node_item"))

            if GUI:getVisible(posPanel) then
                local equipData = SL:GetMetaValue("L.M.EQUIP_DATA_R", _pos)
                if equipData then
                    local item = player_layer_equip_other.CreateEquipItem(equipData, _pos)
                    GUI:addChild(GUI:getChildByName(posPanel,"Node_item"), item)
                    local iconImage = GUI:getChildByName(posPanel, "Image_icon")
                    if iconImage then
                        GUI:setVisible(iconImage, false)
                    end
                end
            end

            -- 注册穿戴  移动事件
            if isInit then
                player_layer_equip_other.RegisterPanelEvent(posPanel, _nIndex, _pos)
            end
        end
    end

    if isInit then
        for _nIndex,_pos in pairs(innerSetPos) do
            local posPanel = ui["Panel_pos" .. _nIndex]
            if posPanel then
                player_layer_equip_other.RegisterPanelEvent(posPanel, _nIndex, _pos)
            end
        end
    end

    player_layer_equip_other.UpdatePlayerView()
end

function player_layer_equip_other.RegisterPanelEvent(equipPanel, nIndex, pos)
    if SL:GetMetaValue("WINPLAYMODE") then
        player_layer_equip_other.RegisterPanelEventWin32(equipPanel, nIndex, pos)
        return
    end
    player_layer_equip_other.RegisterPanelEventMobile(equipPanel, nIndex, pos)
end

function player_layer_equip_other.RegisterPanelEventWin32(equipPanel, nIndex, pos)
    GUI:addMouseMoveEvent(equipPanel, {
        onEnterFunc = function()
            player_layer_equip_other.ShowEquipItemTips(equipPanel, nIndex, pos)
        end,
        onLeaveFunc = function()
            SL:CloseItemTips()
        end,
        checkIsVisible = true,
    })
end

function player_layer_equip_other.RegisterPanelEventMobile(equipPanel, nIndex, pos)
    GUI:addOnTouchEvent(equipPanel, function(touch, eventType)
        if eventType == 2 then
            player_layer_equip_other.ShowEquipItemTips(equipPanel, nIndex, pos)
        end
    end)
end

function player_layer_equip_other.ShowEquipItemTips(equipPanel, nIndex, pos)
    if innerSetPos[nIndex] then
        if pos == 0 and player_layer_equip_other._is_super_dress then
            pos = 17
        elseif pos == 1 and player_layer_equip_other._is_super_weapon then
            pos = 18
        end
    end

    local bOnlyOne = nIndex == 4
    local equipData = SL:GetMetaValue("L.M.EQUIP_LIST_POS_DATAS", pos, bOnlyOne)
    if not equipData then
        if bOnlyOne then
            return
        end
        if pos == 17 then
            equipData = SL:GetMetaValue("L.M.EQUIP_LIST_POS_DATAS", 0)
        elseif pos == 18 then
            equipData = SL:GetMetaValue("L.M.EQUIP_LIST_POS_DATAS", 1)
        end

        if not equipData then 
            return
        end
    end

    local data = {}
    data.itemData  = equipData[#equipData]
    data.itemData2 = equipData[#equipData-1]
    data.itemData3 = equipData[#equipData-2]
    data.pos       = GUI:getWorldPosition(equipPanel)
    SL:OpenItemTips(data)
end

-- 创建equip item
function player_layer_equip_other.CreateEquipItem(data)
    local info = {}
    info.itemData = data
    info.index = data.Index
    info.noMouseTips = true
    info.from = 2                       --来源  内观装备界面
    info.showModelEffect = true
    if string.find(data.Name, "结婚戒指") then
        info.showShinyEffect = 4508
    end
    local goodItem = SL:CreateGoodsItem(info)
    goodItem:setPosition(0, 0)
    goodItem:setScale(0.8)
    GUI:setName(goodItem,"GOOD_ITEM")
    return goodItem
end

-- 更新内观
function player_layer_equip_other.UpdatePlayerView( notShowPos )
    local modelNode = ui["Node_playerModel"]
    GUI:removeAllChildren(modelNode)

    local function GetLooks( data )
        if not data then
            return {}
        end

        -- if not SL:GetMetaValue("IS_INNER_EQUIP_SHOW", data.StdMode) then
        --     return {}
        -- end

        local equipConfig = SL:GetMetaValue("ITEM_DATA_R", data.Index)

        local _, _, nEffect = SL:GetMetaValue("ITEM_CHANGED_LOOK", data.SMakeIndex, data.Index)

        return {
            look   = data.Looks,
            effect = nEffect or data.nEffect or equipConfig.nEffect,
            color  = data.ColorMask
        }
    end

    local clothShow     = GetLooks(SL:GetMetaValue("L.M.EQUIP_DATA_R", 0)) or {}             -- 衣服
    local weaponShow    = GetLooks(SL:GetMetaValue("L.M.EQUIP_DATA_R", 1)) or {}             -- 武器
    local headShow      = GetLooks(SL:GetMetaValue("L.M.EQUIP_DATA_R", 4)) or {}             -- 头盔
    local capShow       = GetLooks(SL:GetMetaValue("L.M.EQUIP_DATA_R", 13)) or {}           -- 斗笠
    local shieldShow    = GetLooks(SL:GetMetaValue("L.M.EQUIP_DATA_R", 16)) or {}           -- 盾牌
    
     -- 称号
    local tDressShow  = SL:GetMetaValue("PLAYER_GET_DRESS_LOOKS_BY_TYPE", 10004%10000, SL:GetMetaValue("L.M.SEX"), SL:GetMetaValue("L.M.PLAYER_DATA_R").Job)
    local tWeaponShow = SL:GetMetaValue("PLAYER_GET_DRESS_LOOKS_BY_TYPE", 10005%10000, SL:GetMetaValue("L.M.SEX"), SL:GetMetaValue("L.M.PLAYER_DATA_R").Job)

    local feature = {
        hairID          = SL:GetMetaValue("L.M.HAIR"),
        hairColor       = SL:GetMetaValue("L.M.PLAYER_DATA_R").HairColor,
        clothID         = clothShow.look,
        clothColor      = clothShow.color,
        clothEffectID   = clothShow.effect,
        weaponID        = weaponShow.look,
        weaponColor     = weaponShow.color,
        weaponEffectID  = weaponShow.effect,
        capID           = capShow.look,
        capEffectID     = capShow.effect,
        shieldID        = shieldShow.look,
        shieldEffectID  = shieldShow.effect,
        tDressID        = tDressShow.look,
        tDressEffectID  = tDressShow.effect,
        headID          = headShow.look,
        headColor       = headShow.color,
        headEffectID    = headShow.effect,
        tWeaponID       = tWeaponShow.look,
        tWeaponEffectID = tWeaponShow.effect,
    }

    -- 显示时装
    if player_layer_equip_other._is_super_dress then
        local superClothShow  = notShowPos ~= 0 and GetLooks(SL:GetMetaValue("L.M.EQUIP_DATA_R", 17)) or {}             -- 衣服
        if superClothShow and next(superClothShow) then
            feature.clothID         = superClothShow.look
            feature.clothColor      = superClothShow.color
            feature.clothEffectID   = superClothShow.effect
        end
    end

    -- 显示时装武器
    if player_layer_equip_other._is_super_weapon then
        local superWeaponShow  = notShowPos ~= 0 and GetLooks(SL:GetMetaValue("L.M.EQUIP_DATA_R", 18)) or {}             -- 武器
        if superWeaponShow and next(superWeaponShow) then
            feature.weaponID        = superWeaponShow.look
            feature.weaponColor     = superWeaponShow.color
            feature.weaponEffectID  = superWeaponShow.effect
        end
    end

    -- 特殊特效  TXT"UpdateEquipEffect"
    feature.embattlesID = SL:GetMetaValue("PLAYER_SHOW_EMBATTLE_LOOK")

    local modeUI         = SL:CreateStaticUIModel(SL:GetMetaValue("L.M.SEX"), feature)

    if modeUI then
        GUI:addChild(modelNode, modeUI)
    end
end

function player_layer_equip_other.SetFormatAtt(attStr)
    if SL:GetMetaValue("GAME_DATA", "attShowTips") == 2 or SL:GetMetaValue("GAME_DATA", "attShowTips") == 3 then
        return SL:AttNumberFormat(tonumber(attStr), SL:GetMetaValue("GAME_DATA", "attShowTips")) or attStr
    end
    return attStr
end

function player_layer_equip_other.UpdateUIModel()
    player_layer_equip_other.UpdatePlayerView()
end

function player_layer_equip_other.UpdateUI()
    player_layer_equip_other.Attach(root)
end

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
player_layer_equip_other.events = events
player_layer_equip_other.key = "player_layer_equip_other"
_G["player_layer_equip_other"] = player_layer_equip_other
return player_layer_equip_other