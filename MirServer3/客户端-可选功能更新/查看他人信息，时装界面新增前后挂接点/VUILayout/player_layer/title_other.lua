--------------------------------------------------------------
-- This file was automatically generated and called by F8.
--------------------------------------------------------------
local SL = _G["SL"]
local GUI = _G["GUI"]

local player_layer_title_other = {}
----------------- ↓↓↓ local variables ↓↓↓ --------------------
local root
local ui

----------------- ↓↓↓ event callback ↓↓↓ ---------------------
local events = {
    Attach              = SL:AddAttachEvent("player_layer/title_other"),
    UnAttach            = SL:AddUnAttachEvent("player_layer/title_other"),

    -- UpdateUI            = SL:AddLuaEvent(LUA_EVENT_LOOK_UPDATE) --更新所有UI
}
--------------------------------------------------------------

function player_layer_title_other.Attach(layerRoot)
    root = layerRoot
    ui = GUI:ui_delegate(layerRoot)

    -------↓↓↓ player_layer_title_other script ↓↓↓---- UTF-8
    SL:Print("player_layer/title_other 打开了！")
    
    player_layer_title_other._isPc = SL:GetMetaValue("WINPLAYMODE")
    player_layer_title_other._resPath = SLDefine.PATH_RES_PRIVATE .. "title_layer_ui/"
    player_layer_title_other.InitUI()
    -------↑↑↑ player_layer_title_other script ↑↑↑----
end

function player_layer_title_other.InitUI()
    local function showTips()
        local activateId = SL:GetMetaValue("L.M.ACTIVATE_TITLE")
        local data = {}
        data.id = activateId
        data.pos = GUI:getWorldPosition(ui.Button_curTitle)
        data.type = 2
        SL:OpenTitleTipsUI(data)
    end

    if player_layer_title_other._isPc then
        GUI:addMouseMoveEvent(ui.Button_curTitle, {
            onEnterFunc = function()
                if not SL:GetMetaValue("TOUCH_STATE") then
                    showTips()
                end
            end,
            onLeaveFunc = function()
                SL:CloseTitleTipsUI()
            end
        })
    else
        GUI:addOnClickEvent(ui.Button_curTitle, function()
            showTips()
        end)
    end
 
    player_layer_title_other.RefreshUI()
end

function player_layer_title_other.RefreshUI()
    local activateId = SL:GetMetaValue("L.M.ACTIVATE_TITLE")
    local titleListData = SL:GetMetaValue("L.M.TITLES")

    GUI:setTouchEnabled(ui.Button_curTitle, activateId ~= nil)
    local resPath = nil
    if activateId then
        resPath = SL:GetMetaValue("TITLE_IMAGE", activateId)
        GUI:Text_setString(ui.Text_curTitle, SL:GetMetaValue("ITEM_NAME", activateId))
        local colorHex = SL:GetHexColorByStyleId(SL:GetMetaValue("ITEM_NAME_COLORID", activateId))
        GUI:Text_setTextColor(ui.Text_curTitle, colorHex)
        GUI:Text_setFontSize(ui.Text_curTitle, player_layer_title_other._isPc and 16 or 18)
    else
        resPath = player_layer_title_other._resPath .. "title_3.png"
        GUI:Text_setString(ui.Text_curTitle, "")
    end
    GUI:Button_loadTextureNormal(ui.Button_curTitle, resPath)
    local size = GUI:getImageContentSize(resPath)
    if size.width > 0 then
        GUI:setContentSize(ui.Button_curTitle, size.width, size.height)
    end

    -- 称号列表
    local titleList = SL:HashToSortArray(titleListData, function(a, b)
       return a.index < b.index 
    end)

    titleList = titleList or {}
    local count = math.max(#titleList, 5)
    local listItemNums = GUI:ListView_getItemCount(ui.ListView_cells)

    local function showTips(widget)
        if not widget._data then
            return
        end
        local data = {}
        data.id = widget._data.id
        data.pos = GUI:getWorldPosition(widget)
        data.type = 1
        data.time = widget._data.name
        SL:OpenTitleTipsUI(data)
    end

    if listItemNums < count then
        for i = listItemNums + 1, count do
            local cell = player_layer_title_other.CreateTitleCell()
            GUI:ListView_pushBackCustomItem(ui.ListView_cells, cell)
            local cellUI = GUI:ui_delegate(cell)
            local buttonIcon = cellUI.Button_icon
            
            if player_layer_title_other._isPc then
                GUI:addMouseMoveEvent(buttonIcon, {
                    onEnterFunc = function()
                        if not SL:GetMetaValue("TOUCH_STATE") then
                            showTips(buttonIcon)
                        end
                    end,
                    onLeaveFunc = function()
                        SL:CloseTitleTipsUI()
                    end
                })
            else
                GUI:addOnClickEvent(buttonIcon, function()
                    showTips(buttonIcon)
                end)
            end
        end
    elseif listItemNums > count then
        for i = count, listItemNums - 1 do
            GUI:ListView_removeItemByIndex(ui.ListView_cells, i)
        end
    end

    for i = 1, count do
        local cell = GUI:ListView_getItemByIndex(ui.ListView_cells, i - 1)
        local cellUI = GUI:ui_delegate(cell)
        local buttonIcon = cellUI.Button_icon
        GUI:setTouchEnabled(buttonIcon, false)
        
        if titleList[i] then
            GUI:setTouchEnabled(buttonIcon, true)
            buttonIcon._data = titleList[i]
            local titleId = buttonIcon._data.id
            local time = buttonIcon._data.time
            local resPath = SL:GetMetaValue("TITLE_LIST_IMAGE", titleId)
            GUI:Button_loadTextureNormal(buttonIcon, resPath)
            GUI:Text_setString(cellUI.Text_name, SL:GetMetaValue("ITEM_NAME", titleId))
            local size = GUI:getImageContentSize(resPath)
            if size.width > 0 then
                GUI:setContentSize(buttonIcon, size.width, size.height)
            end

            GUI:Button_setGrey(buttonIcon, titleId == activateId)
            buttonIcon._doubleState = false
        else
            buttonIcon._data = nil
            local res = player_layer_title_other._resPath .. "title_4.png"
            GUI:Button_loadTextureNormal(buttonIcon, res)
            GUI:Text_setString(cellUI.Text_name, "")
            GUI:setContentSize(buttonIcon, GUI:getImageContentSize(res))
        end
    end
    
end

function player_layer_title_other.CreateTitleCell()
    local cell = GUI:CreateGUIExport("player_layer/title_cell")
    return cell
end

function player_layer_title_other.UnAttach()
    root = nil
    ui = nil
end

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
player_layer_title_other.events = events
player_layer_title_other.key = "player_layer_title_other"
_G["player_layer_title_other"] = player_layer_title_other
return player_layer_title_other