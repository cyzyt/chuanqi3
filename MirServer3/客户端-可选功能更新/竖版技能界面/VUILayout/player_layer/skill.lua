--------------------------------------------------------------
-- This file was automatically generated and called by F8.
--------------------------------------------------------------
local SL = _G["SL"]
local GUI = _G["GUI"]

local player_layer_skill = {}
----------------- ↓↓↓ local variables ↓↓↓ --------------------
local root
local ui

local showJobSel = {{8},{1,2,3,4,7},{5,6,7,8}}

----------------- ↓↓↓ event callback ↓↓↓ ---------------------
local events = {
    Attach              = SL:AddAttachEvent("player_layer/skill"),
    UnAttach            = SL:AddUnAttachEvent("player_layer/skill"),
    ChangeHotKey        = SL:AddLuaEvent(LUA_EVENT_HOTKEY_TRIGGER),     --热键
    UpdateHotKey        = SL:AddLuaEvent(LUA_EVENT_HOTKEY_UPDATE),      --热键刷新
    UpdateSkillAdd      = SL:AddLuaEvent(LUA_EVENT_SKILL_ADD),          --新增技能
    UpdateSkillDel      = SL:AddLuaEvent(LUA_EVENT_SKILL_DEL),          --删除技能
    UpdateSkillUpdate   = SL:AddLuaEvent(LUA_EVENT_SKILL_UPDATE),       --刷新技能
}
--------------------------------------------------------------

function player_layer_skill.Attach(layerRoot, param)
    root = layerRoot
    ui = GUI:ui_delegate(layerRoot)

    -------↓↓↓ player_layer_skill script ↓↓↓---- UTF-8
    SL:Print("player_layer/skill 打开了！")
    
    --添加挂节点
    SL:InitSUIComponetAttach(ui.Panel_1, 6)
    -------↑↑↑ player_layer_skill script ↑↑↑----

    player_layer_skill._select_page_id      = nil   -- 选中的技能切页
    player_layer_skill._select_skill_id     = nil   -- 选中的技能
    player_layer_skill._select_skill_id_win = nil
    player_layer_skill._mouse_select_skill_id = nil --鼠标选中的技能

    --传入显示技能页
    if param and tonumber(param) then -- 技能分页下标
        player_layer_skill._select_page_id = tonumber(param)
    end

    GUI:setVisible(ui["Panel_btn"], false)
    GUI:setVisible(ui["Panel_skill"], false)

    GUI:addOnClickEvent(ui["Button_Set"], function()
        GUI:OpenLayer("skill_setting/ui_buttons")
    end)

    if SL:GetMetaValue("WINPLAYMODE") then
        GUI:setVisible(ui["Button_Set"], false)
        GUI:setPositionX(ui["img_line"], 190)
    end

    player_layer_skill.UpdateClearShowLevelLayer()
    player_layer_skill.UpdateDefJobSel()
end

function player_layer_skill.UnAttach()
    SL:RemoveSUIComponetAttach(6)
    
    root = nil
    ui = nil
    SL:SetMetaValue("SKILL_PAGE_CHANGE", 0)
    if player_layer_skill._effects then
        GUI:removeFromParent(player_layer_skill._effects)
        player_layer_skill._effects = nil
    end
    SL:CloseCommonDescTipsPop()
end

-- 刷新职业技能切页
function player_layer_skill.UpdateDefJobSel()
    GUI:removeAllChildren(ui["ListView_sel"])

    local job       = SL:GetMetaValue("JOB")
    local jobTab    = showJobSel[job+1] or {}
    local jobTabNum = math.max(#jobTab, 5)

    for i=1,jobTabNum do
        local button = GUI:Clone(ui["Panel_btn"])
        GUI:setName(button, "Panel_btn_" .. i)
        GUI:setVisible(button, true)
        local buttonUI = GUI:ui_delegate(button)
        if jobTab[i] then
            GUI:setTag(button,jobTab[i])
            --icon
            GUI:Image_loadTexture(buttonUI["Image_p_name"], string.format("res/custom/player_skill/skp%s_1.png", jobTab[i]))
            GUI:setIgnoreContentAdaptWithSize(buttonUI["Image_p_name"], true)
            GUI:Image_loadTexture(buttonUI["Image_btn_bg"], string.format("res/custom/player_skill/skicon%s.png", jobTab[i]))
            GUI:setIgnoreContentAdaptWithSize(buttonUI["Image_btn_bg"], true)
            GUI:setTag(buttonUI["Button_sel"],jobTab[i])
            GUI:addOnClickEvent(buttonUI["Button_sel"], function(sender, event)
                if player_layer_skill._select_page_id == GUI:getTag(sender) then return end
                player_layer_skill._select_page_id = GUI:getTag(sender)
                player_layer_skill._select_skill_id = nil
                player_layer_skill._select_skill_id_win = nil
                player_layer_skill.UpdateSelectSkillButtonChange(player_layer_skill._select_page_id)
                player_layer_skill.UpdateSelectSkillPage(player_layer_skill._select_page_id)
            end)
        else
            GUI:setTag(button, -99)
            GUI:Button_setBright(buttonUI.Button_sel, false)
            GUI:setVisible(GUI:getChildByName(button, "Image_p_name"), false)
            GUI:setVisible(GUI:getChildByName(button, "Image_btn_bg"), false)
        end
        GUI:ListView_pushBackCustomItem(ui["ListView_sel"], button)
    end

    player_layer_skill._select_page_id = player_layer_skill._select_page_id and jobTab[player_layer_skill._select_page_id] or jobTab[1]
    player_layer_skill.UpdateSelectSkillButtonChange(player_layer_skill._select_page_id)
    player_layer_skill.UpdateSelectSkillPage(player_layer_skill._select_page_id)
    player_layer_skill.OnEventSlider()
end

--- 刷新职业技能切页按钮
---@param pageId integer 职业技能切页
function player_layer_skill.UpdateSelectSkillButtonChange(pageId)
    local items = GUI:ListView_getItems(ui["ListView_sel"])

    for k,item in pairs(items) do
        local itemTag = GUI:getTag(item)
        if itemTag > 0 then
            local selButton = GUI:getChildByName(item, "Button_sel")
            local imgSelect = GUI:getChildByName(item, "btn_select")
            GUI:setTouchEnabled(selButton, pageId ~= itemTag)
            GUI:Button_setBright(selButton, pageId ~= itemTag)
            GUI:setVisible(imgSelect, pageId == itemTag)
            local imagName = pageId == itemTag and string.format("skp%s.png", itemTag) or string.format("skp%s_1.png", itemTag)
            GUI:Image_loadTexture(GUI:getChildByName(item, "Image_p_name"), "res/custom/player_skill/"..imagName)
        end
    end

end

--- 刷新职业技能切页内容
---@param pageId integer 职业技能切页
function player_layer_skill.UpdateSelectSkillPage(pageId)
    player_layer_skill.UpdateClearShowLevelLayer()
    
    GUI:setVisible(ui["Sv_show"], true)
    GUI:ScrollView_addMouseScrollPercent(ui["Sv_show"])

    GUI:removeAllChildren(ui["Sv_show"])

    SL:SetMetaValue("SKILL_PAGE_CHANGE", pageId)
    
    local skillList = player_layer_skill.GetSkillList()
    for i,v in ipairs(skillList) do
        player_layer_skill.AddSkillItemInPage(v)
    end

    if SL:GetMetaValue("WINPLAYMODE") then
        player_layer_skill.UpdateSkillShortcut()
    end
end

--- 获取排序后的技能
function player_layer_skill.GetSkillList()
    local skillList = {}
    local noSkillList = {}
    local config = SL:GetMetaValue("SKILL_ALL_CONFIG")
    for k, v in pairs(config) do
        local skillData = SL:GetMetaValue("SKILL_DATA", v.magicID)
        if v.sortID then
            if skillData then
                table.insert(skillList, v)
            else
                table.insert(noSkillList, v)
            end
        end
    end
    table.sort(skillList, function(a, b)
        return a.sortID < b.sortID
    end)
    table.sort(noSkillList, function(a, b)
        return a.sortID < b.sortID
    end)
    --排序后合一，学习技能在前，没学在后
    for i,v in ipairs(noSkillList) do
        table.insert(skillList, v)
    end
    return skillList
end

--- 内容技能
---@param data table 读取的技能配置数据
function player_layer_skill.AddSkillItemInPage(data)
    if not data then return end
    local job = SL:GetMetaValue("JOB")
    if data.job ~= 3 and data.job ~= job then return end
    if data.page ~= player_layer_skill._select_page_id then return end
    if not SL:IsFileExist(string.format("res/skill_icon_a/%s.png", data.icon)) then return end
    --技能数据
    local skillID = data.magicID
    local skillData = SL:GetMetaValue("SKILL_DATA", skillID)
    --创建iitem
    local skillItem = GUI:Clone(ui["Panel_skill"])
    local itemUI = GUI:ui_delegate(skillItem)
    GUI:setTag(skillItem, skillID)
    GUI:setTag(itemUI["iconA"], skillID)
    GUI:setVisible(skillItem,true)
    GUI:ListView_pushBackCustomItem(ui["Sv_show"], skillItem)
    --技能底图
    GUI:Image_loadTexture(itemUI["iconA"], string.format("res/skill_icon_a/%s.png", data.icon))
    --组件刷新
    player_layer_skill.UpdateWidgetShow(itemUI, data)
    --点击事件
    GUI:addOnClickEvent(itemUI["iconA"], function(sender, event)
        player_layer_skill._select_skill_id     = GUI:getTag(sender)
        player_layer_skill._select_skill_id_win = GUI:getTag(sender)
        player_layer_skill.OnSkillItemEvent(skillItem)
    end)
    --鼠标移入
    if SL:GetMetaValue("WINPLAYMODE") then
        GUI:addMouseMoveEvent(skillItem, {
            onEnterFunc = function()
                GUI:setVisible(itemUI["item_select"], true)
                player_layer_skill._mouse_select_skill_id = skillID
            end,
            onLeaveFunc = function()
                GUI:setVisible(itemUI["item_select"], false)
                player_layer_skill._mouse_select_skill_id = nil
            end,
        })
        GUI:addMouseMoveEvent(itemUI["iconA"], {
            onEnterFunc = function()
                GUI:setVisible(itemUI["item_select"], true)
                player_layer_skill._mouse_select_skill_id = skillID
                player_layer_skill.UpdateShowCommonDesc(skillItem)
            end,
            onLeaveFunc = function()
                GUI:setVisible(itemUI["item_select"], false)
                player_layer_skill._mouse_select_skill_id = nil
                SL:CloseCommonDescTipsPop()
            end,
        })
    end
end

--刷新道具显示
---@param itemUI userdata
---@param data userdata 技能数据
function player_layer_skill.UpdateWidgetShow(itemUI, data)
    if not itemUI or not next(itemUI) then return end
    --数据
    local skillID = data.magicID
    local skillData = SL:GetMetaValue("SKILL_DATA", skillID)
    --按钮显隐
    GUI:setVisible(itemUI["level_bg"], skillData ~= nil)
    GUI:setVisible(itemUI["iconL"], skillData ~= nil)
    GUI:setVisible(itemUI["exp_bg"], skillData ~= nil)
    GUI:setVisible(itemUI["shortcut_bg"], skillData ~= nil and SL:GetMetaValue("WINPLAYMODE"))
    GUI:setVisible(itemUI["Text_no_level"], skillData == nil)
    if skillData then
        --等级
        GUI:Text_setString(itemUI["Text_level"], skillData.Level or 0)
        --彩色技能
        GUI:Image_loadTexture(itemUI["iconL"], string.format("res/skill_icon/%s.png", data.icon))
        --技能熟练度
        local curExp = skillData.CurTrain or 0
        local maxExp = skillData["MaxTrain" .. (skillData.Level+1)] or 0
        if maxExp == -1 then
            GUI:LoadingBar_setPercent(itemUI["LoadingBar_exp"], 100)
            GUI:Text_setString(itemUI["Text_exp"], "Max")
        else
            GUI:LoadingBar_setPercent(itemUI["LoadingBar_exp"], curExp/maxExp*100)
            GUI:Text_setString(itemUI["Text_exp"], string.format("%s/%s", curExp, maxExp))
        end
    end
    --技能图片名/文字名
    local skillImagName = string.format("res/custom/player_skill/skill_name/%s.png", skillID)
    local isExist = SL:IsFileExist(skillImagName)
    GUI:setVisible(itemUI["Image_skill_name"], isExist)
    GUI:setIgnoreContentAdaptWithSize(itemUI["Image_skill_name"], isExist)
    GUI:Text_setString(itemUI["Text_name"], not isExist and data.magicName or "")
    if isExist then GUI:Image_loadTexture(itemUI["Image_skill_name"], skillImagName) end
    --图片是否灰色
    GUI:setGrey(itemUI["Image_skill_name"], not skillData and true or false)
    --文字技能颜色
    GUI:setColor(itemUI["Text_name"], skillData and SL:GetHexColorByStyleId(150) or SL:GetHexColorByStyleId(159))
    --快捷键图片
    local imgName = data.type == 1 and "img_tip2" or "img_tip4"
    local imgUrl = string.format("res/custom/player_skill/%s.png", imgName)
    GUI:Image_loadTexture(itemUI["img_tip2"], imgUrl)
    GUI:setIgnoreContentAdaptWithSize(itemUI["img_tip2"], true)
end

--- 内容技能按钮事件
---@param item userdata 技能按钮item
function player_layer_skill.OnSkillItemEvent(item)
    local skillID = player_layer_skill._select_skill_id
    local skillMes = global.skillManager:getSkillDataByID(skillID)
    local config = SL:GetMetaValue("SKILL_CONFIG", skillID)

    local skillData = SL:GetMetaValue("SKILL_DATA", skillID)

    SL:SetMetaValue("SKILL_SELECT_SKILL", skillID)

    local isPressEvent = true

    if skillData and skillData.Level and config then
        if isPressEvent then
            performWithDelay(ui["Sv_show"], function()
                player_layer_skill._select_skill_id = nil
            end, 0.3)
        end

        -- if config.type == 1 then
            -- player_layer_skill.ChangeSkillState(skillID) 
        -- end
    end

    player_layer_skill.UpdatePlaySelectSkillItemAnim(item)
    player_layer_skill.UpdateShowCommonDesc(item)

    player_layer_skill._select_skill_id = nil
end

--- 更改技能按钮状态
---@param skillID integer 技能id
function player_layer_skill.ChangeSkillState(skillID)
    if skillID and player_layer_skill._select_skill_id == skillID then
        player_layer_skill._select_skill_id = nil
        SL:HideAddSkill()

        local skillData = SL:GetMetaValue("SKILL_DATA", skillID)
        local oldKey    = SL:GetMetaValue("SKILL_KEY", skillID)
        local slot      = SL:GetMetaValue("SKILL_EMPTY_SLOT")
        local newKey    = (SL:GetMetaValue("SKILL_KEY_PAGE"))
        if slot then
            SL:SetMetaValue("SKILL_KEY", skillID, slot)
        else
            SL:SetMetaValue("SKILL_KEY", skillID, (SL:GetMetaValue("SKILL_KEY_PAGE")-1)*5+1)
        end
        
        if oldKey == 0 then  --恢复普攻键
            SL:SetMetaValue("SKILL_KEY", 0, 0)
        end
    else
        if player_layer_skill._skill_model == 1 then
            SL:ShowAddSkill(skillID)
        end
        player_layer_skill._select_skill_id     = skillID
        player_layer_skill._select_skill_id_win = skillID
    end

    -- if SL:GetMetaValue("WINPLAYMODE") then
    --     SL:SetMetaValue("SKILL_AUTO_ADD_SHORTCUT", skillID)
    --     return
    -- end
end

--- 刷新选中技能按钮动画
---@param item userdata 技能按钮item
function player_layer_skill.UpdatePlaySelectSkillItemAnim(item)
    if player_layer_skill._effects then
        GUI:removeFromParent(player_layer_skill._effects)
        player_layer_skill._effects = nil
    end

    player_layer_skill._effects = GUI:Effect_Create(item, "SKILL_EFFECTS", 6, -4, 0, 4422)
end

--- 刷新显示的技能描述
---@param item userdata 技能按钮item
function player_layer_skill.UpdateShowCommonDesc(item)
    local skillID = GUI:getTag(item)
    local config = SL:GetMetaValue("SKILL_CONFIG", skillID)
    if config and config.desc then
        local data = {
            str = config.desc,
            width = 400,
            -- worldPos = GUI:getTouchEndPosition(item),
            worldPos = GUI:getWorldPosition(GUI:getChildByName(item, "iconA")),
            anchorPoint = cc.p(0, 1),
            bg = "res/public/1900000677_2.png"
        }
        SL:OpenCommonDescTipsPop(data)
    end
end

--- 更新技能快捷
function player_layer_skill.UpdateSkillShortcut()
    local config  = SL:GetMetaValue("SKILL_ALL_CONFIG")
    for skillID,cfg in pairs(config) do
        local item = GUI:getChildByTag(ui["Sv_show"], skillID)
        if item then
            player_layer_skill.UpdateSkillShortcutItem(item, cfg)
        end
    end
end

--- 更新技能快捷item数据
---@param item userdata 快捷item
---@param data table    技能配置数据
function player_layer_skill.UpdateSkillShortcutItem(item, data)
    local itemUI = GUI:ui_delegate(item)
    local skillID = GUI:getTag(item)
    local shortcutDesc
    local slot = SL:GetMetaValue("SKILL_GET_SKILL_SLOT", skillID)
    if slot then
        local hotkeys = SL:GetMetaValue("SKILL_GET_SKILL_SLOT_HOT_KEY") or {}
        shortcutDesc = SL:GetMetaValue("SKILL_HOT_KEY_DESC_BY_ID", hotkeys[slot])
    end
    GUI:setVisible(itemUI["Text_shortcut"], shortcutDesc ~= nil)
    GUI:setVisible(itemUI["img_tip2"], shortcutDesc == nil)
    GUI:Text_setString(itemUI["Text_shortcut"], shortcutDesc or "")
end

--- 清理显示名字、等级、描述
function player_layer_skill.UpdateClearShowLevelLayer()
    SL:SetMetaValue("SKILL_SELECT_SKILL")
    if player_layer_skill._effects then
        GUI:removeFromParent(player_layer_skill._effects)
        player_layer_skill._effects = nil
    end
end

--- 刷新单个技能按钮item
---@param skillID integer 技能id
function player_layer_skill.UpdateSkillCell(skillID)
    if player_layer_skill._select_page_id then
        local config = SL:GetMetaValue("SKILL_CONFIG", skillID)
        local item = GUI:getChildByTag(ui["Sv_show"], skillID)
        if item then player_layer_skill.UpdateWidgetShow(GUI:ui_delegate(item), config) end
    end
    if SL:GetMetaValue("WINPLAYMODE") then
        player_layer_skill.UpdateSkillShortcut()
    end
end

--监听滚动条/列表容器
function player_layer_skill.OnEventSlider()
    -- 注册滚动改变滑动条
    local function RegisterScrollViewToSlider(chatScrollView, chatSlider)
        GUI:ListView_addOnScrollEvent(chatScrollView, function(sender, event)
            local scrollSize = GUI:getContentSize(sender)
            local innerSize  = GUI:ListView_getInnerContainerSize(sender)
            local percent    = 0
            if innerSize.height > scrollSize.height then
                local moveSize = GUI:ListView_getInnerContainerPosition(sender)
                local moveY    = innerSize.height - scrollSize.height - math.floor(math.abs(moveSize.y))
                percent        = moveY / (innerSize.height - scrollSize.height) * 100
            end
            GUI:Slider_setPercent(chatSlider, percent)
        end)
    end
    -- 注册滑动条改变滚动层
    local function RegisterSliderToScrollView(chatScrollView, chatSlider)
        GUI:Slider_addOnEvent(chatSlider, function(sender, event)
            local percent = GUI:Slider_getPercent(sender)
            GUI:ListView_scrollToPercentVertical(chatScrollView, percent, 0)
        end)
    end
    RegisterScrollViewToSlider(ui["Sv_show"], ui["Slider_1"])
    RegisterSliderToScrollView(ui["Sv_show"], ui["Slider_1"])
end
----------------------------------------handle event begin---------------------------
--- 热键监听
---@param hotkeyID integer 热键id
function player_layer_skill.ChangeHotKey(hotkeyID)
    if not SL:ISWIN32() then
        return
    end
    local cur_select_skill_id = player_layer_skill._mouse_select_skill_id or player_layer_skill._select_skill_id_win
    if not cur_select_skill_id then
        return
    end
    local config = SL:GetMetaValue("SKILL_CONFIG", cur_select_skill_id)
    local skillData = SL:GetMetaValue("SKILL_DATA", config.magicID)
    if not skillData or config.type == 0 then return end

    local slotToHokey = SL:GetMetaValue("SKILL_GET_SKILL_SLOT_HOT_KEY")
    for slot, id in pairs(slotToHokey) do
        if id == hotkeyID then
            local saveKey = SL:GetMetaValue("SKILL_SLOT_SKILL", slot)
            cur_select_skill_id = cur_select_skill_id == saveKey and 0 or cur_select_skill_id
            SL:SetMetaValue("SKILL_CHANGE_SLOT_SKILL", slot, cur_select_skill_id)
        end
    end
end

--- 刷新热键监听
function player_layer_skill.UpdateHotKey()
    player_layer_skill.UpdateSkillShortcut()
end

--- 添加技能监听
---@param data table 技能数据
function player_layer_skill.UpdateSkillAdd(data)
    player_layer_skill.UpdateSkillCell(data.id)
end

--- 删除技能监听
---@param data table 技能数据
function player_layer_skill.UpdateSkillDel(data)
    player_layer_skill.UpdateSkillCell(data.id)
end

--- 更新技能监听
---@param data table 技能数据
function player_layer_skill.UpdateSkillUpdate(data)
    player_layer_skill.UpdateSkillCell(data.id)
end
----------------------------------------handle event end-----------------------------

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
player_layer_skill.events = events
player_layer_skill.key = "player_layer_skill"
_G["player_layer_skill"] = player_layer_skill
return player_layer_skill