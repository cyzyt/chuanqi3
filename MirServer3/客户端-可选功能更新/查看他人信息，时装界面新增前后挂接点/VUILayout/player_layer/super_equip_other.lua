--------------------------------------------------------------
-- This file was automatically generated and called by F8.
--------------------------------------------------------------
local SL = _G["SL"]
local GUI = _G["GUI"]

local player_layer_super_equip_other = {}
----------------- ↓↓↓ local variables ↓↓↓ --------------------
local root
local ui

local posSetting = {
    17,18,20,21,22,23,24,25,26,27,28,29,43,45
}

----------------- ↓↓↓ event callback ↓↓↓ ---------------------
local events = {
    Attach              = SL:AddAttachEvent("player_layer/super_equip_other"),
    UnAttach            = SL:AddUnAttachEvent("player_layer/super_equip_other"),
}
--------------------------------------------------------------

function player_layer_super_equip_other.Attach(layerRoot)
    root = layerRoot
    ui = GUI:ui_delegate(layerRoot)

    -------↓↓↓ player_layer_super_equip_other script ↓↓↓---- UTF-8
    
    --添加挂节点
    SL:InitSUIComponetAttach(ui.Panel_1, 3901)
    SL:InitSUIComponetAttach(ui.nd_button, 3903)

    player_layer_super_equip_other._hideNodePos = {}
    player_layer_super_equip_other.playerJob = SL:GetMetaValue("L.M.JOB")
    
    player_layer_super_equip_other.InitEquipLayerEvent()
    player_layer_super_equip_other.InitEquipLayer()
    -------↑↑↑ player_layer_super_equip_other script ↑↑↑----
end

--初始化时装触发
function player_layer_super_equip_other.InitEquipLayerEvent()
    --根据装备位获取装备信息
    local function GetEquipDataByPos(equipPos, equipList)
        local equipItems = nil
        if equipList then
            equipItems = SL:GetMetaValue("L.M.EQUIP_LIST_POS_DATAS", equipPos)
        else
            equipItems = SL:GetMetaValue("L.M.EQUIP_DATA_R", equipPos, true)
        end
        return equipItems
    end

    for _,pos in pairs(posSetting) do
        local equipPanel = ui["Panel_pos"..pos]
        local posShow = SL:GetMetaValue("CHECK_EQUIP_CONDITION_BY_POS", pos)
        GUI:setVisible(equipPanel, posShow)
        --获取提示数据
        local function getTipsData()
            local itemData = GetEquipDataByPos(pos,true)
            local movingData = SL:GetMetaValue("CHECK_ITEM_MOVING_DATA")
            if movingData then return end
            if not itemData then return end
            local tipsData = {}
            tipsData.itemData = itemData[1]
            if #itemData == 2 then
                tipsData.itemData = itemData[2]
                tipsData.itemData2 = itemData[1]
            elseif #itemData == 3 then
                tipsData.itemData = itemData[3]
                tipsData.itemData2 = itemData[2]
                tipsData.itemData3 = itemData[1]
            end
            tipsData.lookPlayer = true
            tipsData.pos = GUI:getWorldPosition(equipPanel)
            tipsData.from = SL:GetMetaValue("ITEMFROMUI_ENUM_R").PALYER_EQUIP
            return tipsData
        end
        --装备提示触发
        if SL:ISWIN32() then
             --pc鼠标移入提示
            local data = {}
            data.onEnterFunc = function()
                if tolua.isnull(equipPanel) then return end
                local tipsData = getTipsData()
                if not tipsData then return end
                SL:OpenItemTips(tipsData)
            end
            data.onLeaveFunc = function()
                SL:CloseItemTips()
            end
            GUI:addMouseMoveEvent(equipPanel, data)
        else
            --手游点击显示
            GUI:addOnClickEvent(equipPanel, function()
                if tolua.isnull(equipPanel) then return end
                local tipsData = getTipsData()
                if not tipsData then return end
                SL:OpenItemTips(tipsData)
            end)
        end
    end
end

--初始化时装显示
function player_layer_super_equip_other.InitEquipLayer()
    local equipDataByPos = SL:GetMetaValue("L.M.EQUIP_POS_DATAS_R")
    for pos, data in pairs(equipDataByPos) do
        local equipPanel = ui["Panel_pos"..pos]
        if equipPanel then
            local itemNode = ui["Node_"..pos]
            if itemNode then
                itemNode:removeAllChildren()
            end
            if SL:GetMetaValue("CHECK_IS_EQUIP_ITEM", pos) then
                local item = SL:GetMetaValue("EQUIP_LOOK_DATA_BY_MAKEINDEX_R", data.SMakeIndex)
                if item then
                    local equipItems = player_layer_super_equip_other.CreateEquipItem(item)
                    if equipItems then
                        GUI:addChild(itemNode, equipItems)
                    end
                end
            end
        end
    end
    player_layer_super_equip_other.UpdatePlayerView(nil, true)
end

--创建装备显示
function player_layer_super_equip_other.CreateEquipItem(data)
    if not data or next(data) == nil then
        return nil
    end
    local ItemMoveProxy = global.Facade:retrieveProxy(global.ProxyTable.ItemMoveProxy)
    local info = {}
    info.itemData = data
    info.index = data.Index
    info.noStars = true
    info.noMouseTips = true
    info.showModelEffect = true
    local goodItem = SL:CreateGoodsItem(info)
    GUI:setPosition(goodItem, 0, 0)
    return goodItem
end

--创建角色模型
function player_layer_super_equip_other.UpdatePlayerView(noEquipType, init)
    local modelNode = ui["Node_playerModel"]
    GUI:removeAllChildren(modelNode)

    local equipDataByPos = SL:GetMetaValue("L.M.EQUIP_POS_DATAS_R")
    local equipTypeConfig = SL:GetMetaValue("EQUIP_TYPE")

    noEquipType = noEquipType or {}
    local showNakedMold = true --装备进行判断是否显示裸模  默认显示
    local showHead = true --是否显示头盔
    local isShowWeapon = true --是否显示武器

    local function GetLooks(equipType, need)
        local show = {
            look = nil,
            effect = nil,
            equip = nil,
        }
        if not need and equipType and equipDataByPos[equipType] then
            local SMakeIndex = equipDataByPos[equipType].SMakeIndex
            --移动中处理
            local movingData = SL:GetMetaValue("CHECK_ITEM_MOVING_DATA")
            if init and movingData and SMakeIndex == movingData.SMakeIndex then
                return show
            end
            
            local equipData = SL:GetMetaValue("EQUIP_LOOK_DATA_BY_MAKEINDEX_R", SMakeIndex)
            if equipType == equipTypeConfig.Equip_Type_Super_Dress then
                if showNakedMold and equipData and equipData.shonourSell and tonumber(equipData.shonourSell) == 1 then --xslm==1不显示裸模
                    showNakedMold = false
                end

                local articleType = SL:GetMetaValue("EQUIP_ARTICLE_TYPE")
                if SL:GetMetaValue("EQUIP_ARTICLE", equipData, articleType.TYPE_EQUIP_INSIDE_HEAD) then
                    showHead = false
                end
                if SL:GetMetaValue("EQUIP_ARTICLE", equipData, articleType.TYPE_EQUIP_INSIDE_WEAPON) then
                    isShowWeapon = false
                end
            end
            show.equip = equipData
            if equipData and equipData.Looks then
                show.look = equipData.Looks
            end
            if equipData and equipData.nEffect then
                show.effect = equipData.nEffect
            end
            show.color = equipData and equipData.ColorMask
            return show
        end
        return show
    end
    local hairID = SL:GetMetaValue("L.M.HAIR")
    local clothShow = GetLooks(equipTypeConfig.Equip_Type_Super_Dress, noEquipType.NoSuperDress)
    local weaponShow = GetLooks(equipTypeConfig.Equip_Type_Super_Weapon, noEquipType.NoSuperWeapon)
    local headShow = GetLooks(equipTypeConfig.Equip_Type_Super_Helmet, noEquipType.NoSuperHelmet)
    local capShow = GetLooks(equipTypeConfig.Equip_Type_Super_Cap, noEquipType.NoSuperCap)
    local shieldShow = GetLooks(equipTypeConfig.Equip_Type_Super_Shield, noEquipType.NoSuperShield)
    local veilShow = GetLooks(equipTypeConfig.Equip_Type_Super_Veil, noEquipType.NoSuperVeil)

    local modelData = {
        clothID = clothShow.look,
        clothColor = clothShow.color,
        clothEffectID = clothShow.effect,
        weaponID = weaponShow.look,
        weaponColor = weaponShow.color,
        weaponEffectID = weaponShow.effect,
        headID = headShow.look,
        headColor = headShow.color,
        headEffectID = headShow.effect,
        hairID = hairID,
        capID = capShow.look,
        capEffectID = capShow.effect,
        veilID = veilShow.look,
        shieldID = shieldShow.look,
        shieldEffectID = shieldShow.effect,
        notShowMold = not showNakedMold,
        notShowHair = not showNakedMold,
        showHead = showHead,
        isShowWeapon = isShowWeapon,
    }

    local sex = SL:GetMetaValue("L.M.SEX")
    local UiModel = SL:CreateStaticUIModel(sex, modelData)
    if UiModel then
        GUI:addChild(modelNode, UiModel)
    end
end

function player_layer_super_equip_other.UnAttach()
    SL:RemoveSUIComponetAttach(3901)
    SL:RemoveSUIComponetAttach(3903)

    root = nil
    ui = nil
end

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
player_layer_super_equip_other.events = events
player_layer_super_equip_other.key = "player_layer_super_equip_other"
_G["player_layer_super_equip_other"] = player_layer_super_equip_other
return player_layer_super_equip_other