--------------------------------------------------------------
-- This file was automatically generated and called by F8.
--------------------------------------------------------------
local SL = _G["SL"]
local GUI = _G["GUI"]

local main_ui_win32_chat_win32 = {}
----------------- ↓↓↓ local variables ↓↓↓ --------------------
local root
local ui

-- 聊天按钮资源
local CHANNEL_RES = {
    -- [0] = "font_total.png",    -- 综合
    -- [1] = "font_system.png",    -- 系统
    [2] = "font_shout.png",    -- 喊话
    [3] = "font_person.png",    -- 私聊
    [4] = "font_guild.png",    -- 行会
    [5] = "font_team.png",    -- 组队
    [6] = "font_around.png",    -- 附近
    [7] = "font_world.png",    -- 传音?世界
    --[8] = "font_guild.png", -- 行会通知
}

-- 聊天按钮控件名
local CHANNEL_IMG_BTN = {
    -- [0] = "Image_common",    -- 综合
    -- [1] = "Image_system",    -- 系统
    [2] = "Image_shout",    -- 喊话
    [3] = "Image_private",    -- 私聊
    [4] = "Image_guild",    -- 行会
    [5] = "Image_team",    -- 组队
    [6] = "Image_near",    -- 附近
    [7] = "Image_world",    -- 传音?世界
    -- [8] = "Image_drop", -- 掉落
}

--大聊天框频道显示
local FILTER_BTN = {
    [0] = "Image_common",   -- 综合
    [1] = "Image_system",   -- 系统
    [2] = "Image_shout",    -- 喊话
    [3] = "Image_private",  -- 私聊
    [4] = "Image_guild",    -- 行会
    [5] = "Image_team",     -- 组队
    [6] = "Image_near",     -- 附近
    [7] = "Image_world",    -- 传音?世界
    [8] = "Image_drop",     -- 掉落
}

-- 提示
local CHANNEL_TIPS = {
    [0] = "〖提示〗综合聊天模式",    -- 综合
    [1] = "〖提示〗系统聊天模式",    -- 系统
    [2] = "〖提示〗喊话聊天模式",    -- 喊话
    [3] = "〖提示〗私聊聊天模式",    -- 私聊
    [4] = "〖提示〗行会聊天模式",    -- 行会
    [5] = "〖提示〗组队聊天模式",    -- 组队
    [6] = "〖提示〗附近聊天模式",    -- 附近
    [7] = "〖提示〗世界聊天模式",    -- 传音?世界
    -- [8] = "行会聊天模式",           -- 行会通知
}

local RAINBOW_IMG_NAME = { --地图类型对应彩虹图片id
    ["SAFE"]   = 4,
    ["FIGHT"]  = 3,
    ["FIGHT2"] = 1,
    ["FIGHT3"] = 1,
    ["FIGHT4"] = 1,
    ["FIGHT5"] = 3,
    ["other"]  = 2
}

local ADAPTER_MODE = 
{
    stab = 1,
    dynamic = 2,
}

local SHOW_MODE = {
    large = 1,
    mini  = 2,
    ex = 3, -- 置顶聊天
}

local SPEED_LEVEL = {2000, 1800, 1600, 1400, 1200, 1000, 800}

local YS_NAME = {"FireMAC","IceMAC","LightMAC","WindMAC","HolyMAC","DarkMAC","PhantomMAC"}

local IMAGE_PATH = "res/private/main_win32/chat/"

local IMAGE_SIZE = GUI:Size(84, 94)
----------------- ↓↓↓ event callback ↓↓↓ ---------------------
local events = {
    Attach                          = SL:AddAttachEvent("main_ui_win32/chat_win32"),
    UnAttach                        = SL:AddUnAttachEvent("main_ui_win32/chat_win32"),
    HandlerUpdateActorMouseIn       = SL:AddLuaEvent(LUA_EVENT_ACTOR_MOUSE_IN),      --鼠标移入actor监听
    HandlerUpdateActorMouseOut      = SL:AddLuaEvent(LUA_EVENT_ACTOR_MOUSE_OUT),     --鼠标移出actor监听
    HandlerUpdateLevelChange        = SL:AddLuaEvent(LUA_EVENT_LEVELCHANGE),         --等级变化监听
    HandlerUpdateChatEmojiInput     = SL:AddLuaEvent(LUA_EVENT_CHAT_EMOJI_INPUT),    --表情输入监听
    HandlerUpdateChatReplaceInput   = SL:AddLuaEvent(LUA_EVENT_CHAT_REPLACE_INPUT),  --历史替换监听
    HandlerUpdateChatEnterSend      = SL:AddLuaEvent(LUA_EVENT_CHAT_ENTER_SEND),     --发送监听
    HandlerUpdateChatExtent         = SL:AddLuaEvent(LUA_EVENT_CHAT_EXTENT),         --置顶监听
    HandlerUpdateHistoryBack        = SL:AddLuaEvent(LUA_EVENT_CHAT_HISTORY_BACK),   --历史记录往后查找监听
    HandlerUpdateHistoryFront       = SL:AddLuaEvent(LUA_EVENT_CHAT_HISTORY_FRONT),  --历史记录往前查找监听
    HandlerUpdateAddItem            = SL:AddLuaEvent(LUA_EVENT_CHAT_ADD_ITEM),       --添加聊天item监听
    HandlerUpdateChatPrivateTarget  = SL:AddLuaEvent(LUA_EVENT_CHAT_PRIVATE_TARGET), --私聊对象监听
    HandlerUpdateRolePropertyInit   = SL:AddLuaEvent(LUA_EVENT_ROLE_PROPERTY_INITED),--历史记录输入监听
    HandlerUpdateChatSwitchChanel   = SL:AddLuaEvent(LUA_EVENT_CHAT_SWITCH_CHANEL),  --选择频道监听
    HandlerUpdateChatExShowNotice   = SL:AddLuaEvent(LUA_EVENT_CHAT_EX_SHOW_NOTICE), --置顶显示通知监听
    HandlerUpdateMapExchange        = SL:AddLuaEvent(LUA_EVENT_CHANGESCENE),         --地图切换
    HandlerUpdateMapStateChange     = SL:AddLuaEvent(LUA_EVENT_MAP_STATE_CHANGE),    --是否安全区
}

--------------------------------------------------------------

function main_ui_win32_chat_win32.Attach(layerRoot)
    root = layerRoot
    ui = GUI:ui_delegate(layerRoot)

    -------↓↓↓ main_ui_win32_chat_win32 script ↓↓↓---- UTF-8
    SL:Print("main_ui_win32/chat_win32 打开了！")
    

    -------↑↑↑ main_ui_win32_chat_win32 script ↑↑↑----

    main_ui_win32_chat_win32._input_history_index       = 1                 --历史记录下标
    main_ui_win32_chat_win32._chat_show_mode            = SHOW_MODE.mini    --聊天显示模式
    main_ui_win32_chat_win32._mouse_in_actor_id         = nil               --鼠标actor
    main_ui_win32_chat_win32._input_ing                 = false             --输入ing
    main_ui_win32_chat_win32._is_show_chanels           = false             --是否显示聊天类型
    main_ui_win32_chat_win32._select_chatnel_id         = GUIFunction:GetChatChannel().Near  --当前选中频道
    main_ui_win32_chat_win32._chat_panel_size           = GUI:getContentSize(ui["Panel_1"])  --聊天框大小
    main_ui_win32_chat_win32._filter_select             = 0         --记录选择的频道（默认综合）
    main_ui_win32_chat_win32._filter_state              = {}        --记录频道选中/未选中状态
    main_ui_win32_chat_win32._scroll_update_time_down   = 1         --滑动滚动刷新时间间隔
    main_ui_win32_chat_win32._chat_scroll_view          = {}        --聊天scrollView
    main_ui_win32_chat_win32._chat_click_panel          = {}        --点击panel
    main_ui_win32_chat_win32._chat_items                = {}        --聊天item
    main_ui_win32_chat_win32._chat_ex_items             = {}        --置顶item
    main_ui_win32_chat_win32._chat_private_select_idx   = 1         --记录选中的私聊目标下标
    main_ui_win32_chat_win32._image_head_size           = ui.Image_head and GUI:getContentSize(ui.Image_head) or GUI:Size(0, 0) --初始头像宽度

    
    main_ui_win32_chat_win32._chat_items[SHOW_MODE.large] = SL:GetMetaValue("GET_ENCIRCLE_LIST_OBJ")
    main_ui_win32_chat_win32._chat_items[SHOW_MODE.large]:setSize(GUIFunction:GetChatLimitConfig().LimitCountWin)
    main_ui_win32_chat_win32._chat_items[SHOW_MODE.mini] = SL:GetMetaValue("GET_ENCIRCLE_LIST_OBJ")
    main_ui_win32_chat_win32._chat_items[SHOW_MODE.mini]:setSize(GUIFunction:GetChatLimitConfig().MiniLimitCountWin)

    main_ui_win32_chat_win32._chat_limit_count = {
        [SHOW_MODE.large] = GUIFunction:GetChatLimitConfig().LimitCountWin,
        [SHOW_MODE.mini]  = GUIFunction:GetChatLimitConfig().MiniLimitCountWin,
    }

    main_ui_win32_chat_win32.chat_scroll_view = {
        [ADAPTER_MODE.stab]     = {},
        [ADAPTER_MODE.dynamic]  = {}
    }                              --聊天框滚动控件

    local largePanel = GUI:getChildByName(ui["Panel_dynamic"], "Panel_large")
    main_ui_win32_chat_win32.mLargeSlider = GUI:getChildByName(largePanel, "Slider_chart")           --查看聊天滚轮   大聊天框
    local smallPanel = GUI:getChildByName(ui["Panel_dynamic"], "Panel_small")
    main_ui_win32_chat_win32.mSmallSlider = GUI:getChildByName(smallPanel, "Slider_small_chart")     --查看聊天滚轮   小聊天框

    main_ui_win32_chat_win32.mChatExListView     = ui["ListView_chat_ex"]                            --置顶聊天框
    main_ui_win32_chat_win32.mChatLargeListView  = GUI:getChildByName(largePanel, "ScrollView_msg")  --大聊天框
    main_ui_win32_chat_win32.mChatMiniListView   = GUI:getChildByName(smallPanel, "ScrollView_msg")  --小聊天框
    main_ui_win32_chat_win32.mChatMiniListViewSize = GUI:getContentSize(main_ui_win32_chat_win32.mChatMiniListView) --聊天框大小
    main_ui_win32_chat_win32.mChatLargeListViewSize = GUI:getContentSize(main_ui_win32_chat_win32.mChatLargeListView) --聊天框大小


    main_ui_win32_chat_win32.posChatExListView = GUI:getPosition(main_ui_win32_chat_win32.mChatExListView)

    --传音筒 layout item
    main_ui_win32_chat_win32._itemsChatEx = {}
     -- 开关： 传音筒 第4条信息需要把最上面一条信息顶掉
    main_ui_win32_chat_win32._bTopOffChatEx = false 
    if global.ConstantConfig.cytChatTopOff then
        main_ui_win32_chat_win32._bTopOffChatEx = tonumber(global.ConstantConfig.cytChatTopOff) == 1
    end


    main_ui_win32_chat_win32.InitUI()
end

function main_ui_win32_chat_win32.UnAttach()
    root = nil
    ui = nil
end

--- 检测频道等级限制
---@param channelID integer 频道
function main_ui_win32_chat_win32.CheckChatLevel(channelID)
    if not channelID then
        channelID = SL:GetMetaValue("CHAT_CHANNEL")
    end

    local roleLevel = SL:GetMetaValue("LEVEL")
    local canLevel  = 0

    if channelID == GUIFunction:GetChatChannel().Near then
        canLevel = SL:GetMetaValue("SERVER_OPTION", "CanFJShoutMsg")

    elseif channelID == GUIFunction:GetChatChannel().Private then
        canLevel = SL:GetMetaValue("SERVER_OPTION", "CanPrivateMsgLevel")

    elseif channelID == GUIFunction:GetChatChannel().Shout then
        canLevel = SL:GetMetaValue("SERVER_OPTION", "CanShoutMsgLevel")

    elseif channelID == GUIFunction:GetChatChannel().World then
        canLevel = SL:GetMetaValue("SERVER_OPTION", "CanSJShoutMsg")

    end 

    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    local inpitField = GUI:getChildByName(inputPanel, "TextField_input")
    if roleLevel < canLevel then
        GUI:TextInput_setPlaceHolder(inpitField, "等级达到" .. canLevel .. "级可发言")
        GUI:setContentSize(inpitField, GUI:getContentSize(inpitField))
        return false
    end

    GUI:TextInput_setPlaceHolder(inpitField, "")
    return true
end

--- 初始化
function main_ui_win32_chat_win32.InitUI()

    -- 头像触发小地图
    GUI:addOnClickEvent(ui["Image_head"], function()
        GUI:OpenLayer("main_ui_win32/chatMiniMap_win32")
    end)

    -- 注册事件
    local switchBgScrollView = GUI:getChildByName(GUI:getChildByName(ui["Panel_1"], "Panel_input"), "ScrollView_chanelbg")
    local switchScrollView   = GUI:getChildByName(switchBgScrollView, "ScrollView_chanel")
    for k,v in pairs(CHANNEL_IMG_BTN) do
        local colorImag = GUI:getChildByName(GUI:getChildByName(switchScrollView, v.."bg"), v.."_color")
        GUI:addMouseMoveEvent(colorImag, {
            onEnterFunc = function()
                GUI:setVisible(colorImag, true)
            end,

            onLeaveFunc = function()
                GUI:setVisible(colorImag, false)
            end,

            checkIsVisible = true
        })
    end

    -- 按键监听
    --回车触发输入框, 回车关闭私聊框
    local function releaseCB1()
        if GUI:IsLayerShow("page_store/calc_panel_n") then return end
        if GUI:getVisible(ui["listView_bg"]) then
            main_ui_win32_chat_win32.UpdateChangeChatTarget()
            main_ui_win32_chat_win32.HidePrivateList()
            main_ui_win32_chat_win32.UpdateTouchDownAction()
        end
        main_ui_win32_chat_win32.UpdateTouchDownAction()
    end
    GUI:addKeyboardEvent("KEY_ENTER", nil, releaseCB1)
    GUI:addKeyboardEvent("KEY_KP_ENTER", nil, releaseCB1)

    --上下键改变私聊对象
    local function releaseCB2()
        if not GUI:getVisible(ui["listView_bg"]) then return end
        local targets = SL:GetMetaValue("CHAT_PRIVATE_TARGETS")
        main_ui_win32_chat_win32._chat_private_select_idx = main_ui_win32_chat_win32._chat_private_select_idx > 1 and (main_ui_win32_chat_win32._chat_private_select_idx-1) or main_ui_win32_chat_win32._chat_private_select_idx
        main_ui_win32_chat_win32.UpdateChangeChatTarget(main_ui_win32_chat_win32._chat_private_select_idx)
    end
    local function releaseCB3()
        if not GUI:getVisible(ui["listView_bg"]) then return end
        local targets = SL:GetMetaValue("CHAT_PRIVATE_TARGETS")
        main_ui_win32_chat_win32._chat_private_select_idx = main_ui_win32_chat_win32._chat_private_select_idx > 1 and (main_ui_win32_chat_win32._chat_private_select_idx+1) or main_ui_win32_chat_win32._chat_private_select_idx
        main_ui_win32_chat_win32.UpdateChangeChatTarget(main_ui_win32_chat_win32._chat_private_select_idx)
    end
    GUI:addKeyboardEvent("KEY_UP_ARROW", nil, releaseCB2)
    GUI:addKeyboardEvent("KEY_DOWN_ARROW", nil, releaseCB3)
    --/触发私聊狂
    local function releaseCB4()
        self:UpdateShowPrivateList()
    end
    GUI:addKeyboardEvent("KEY_KP_DIVIDE", nil, releaseCB4)
    GUI:addKeyboardEvent("KEY_SLASH", nil, releaseCB4)


    main_ui_win32_chat_win32.InitChat()
    main_ui_win32_chat_win32.InitInput()
    main_ui_win32_chat_win32.InitToolsPanel()
    main_ui_win32_chat_win32.InitChanelFilter()
    main_ui_win32_chat_win32.UpdateStartTimer()
    main_ui_win32_chat_win32.UpdateChangeShowMode(SHOW_MODE.mini)
    main_ui_win32_chat_win32.UpdateRoleLevel()
    main_ui_win32_chat_win32.CheckChatLevel(SL:GetMetaValue("CHAT_CHANNEL"))
    main_ui_win32_chat_win32.InitPrivateChat()
    main_ui_win32_chat_win32.UpdateInputSize()
end

--- 初始化聊天
function main_ui_win32_chat_win32.InitChat()
    --切换大小聊天框按钮
    local largePanel = GUI:getChildByName(ui["Panel_dynamic"], "Panel_large")
    main_ui_win32_chat_win32._chat_scroll_view[SHOW_MODE.large] = GUI:getChildByName(largePanel, "ScrollView_msg")
    main_ui_win32_chat_win32._chat_click_panel[SHOW_MODE.large] = GUI:getChildByName(largePanel, "Panel_e_large")
    local Panel_e_large = GUI:getChildByName(largePanel, "Panel_e_large")
    GUI:addOnClickEvent(GUI:getChildByName(largePanel, "Panel_e_large"), function()
        main_ui_win32_chat_win32.UpdateChangeShowMode(SHOW_MODE.mini)
        main_ui_win32_chat_win32.UpdateChatScrollView()
    end)
    main_ui_win32_chat_win32.UpdateEnterLeaveShow(Panel_e_large, "聊天记录窗口(R)", {x = 0, y = -5}, {x = 0, y = 0.4})

    local smallPanel = GUI:getChildByName(ui["Panel_dynamic"], "Panel_small")
    main_ui_win32_chat_win32._chat_scroll_view[SHOW_MODE.mini] = GUI:getChildByName(smallPanel, "ScrollView_msg")
    main_ui_win32_chat_win32._chat_click_panel[SHOW_MODE.mini] = GUI:getChildByName(smallPanel, "Panel_e_small")
    local Panel_e_small = GUI:getChildByName(smallPanel, "Panel_e_small")
    GUI:addOnClickEvent(Panel_e_small, function()
        main_ui_win32_chat_win32.UpdateChangeShowMode(SHOW_MODE.large)
        main_ui_win32_chat_win32.UpdateChatScrollView()
    end)
    main_ui_win32_chat_win32.UpdateEnterLeaveShow(Panel_e_small, "聊天记录窗口(R)", {x = 0, y = -5}, {x = 0, y = 0.4})
    -- GUI:Image_loadTexture(Panel_e_small, IMAGE_PATH.."img_red.png")

    -- 注册滚动改变滑动条
    local function RegisterScrollViewToSlider(chatScrollView, chatSlider)
        GUI:ScrollView_addOnScrollEvent(chatScrollView, function(sender, event)
            local scrollSize = GUI:getContentSize(sender)
            local innerSize  = GUI:ScrollView_getInnerContainerSize(sender)
            local percent    = 100
            if innerSize.height > scrollSize.height then
                local moveSize = GUI:ScrollView_getInnerContainerPosition(sender)
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
            GUI:ScrollView_scrollToPercent(chatScrollView, percent)
        end)
    end

    local largeChatScrollView = GUI:getChildByName(ui["Panel_large"], "ScrollView_msg")
    GUI:ScrollView_addMouseScrollPercent(largeChatScrollView)
    RegisterScrollViewToSlider(largeChatScrollView, main_ui_win32_chat_win32.mLargeSlider)
    RegisterSliderToScrollView(largeChatScrollView, main_ui_win32_chat_win32.mLargeSlider)

    local smallChatScrollView = GUI:getChildByName(ui["Panel_small"], "ScrollView_msg")
    GUI:ScrollView_addMouseScrollPercent(smallChatScrollView)
    RegisterScrollViewToSlider(smallChatScrollView, main_ui_win32_chat_win32.mSmallSlider)
    RegisterSliderToScrollView(smallChatScrollView, main_ui_win32_chat_win32.mSmallSlider)
end

--- 初始化聊天输入框
function main_ui_win32_chat_win32.InitInput()
    -- 输入框
    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    local inpitField = GUI:getChildByName(inputPanel, "TextField_input")
    GUI:TextInput_setMaxLength(inpitField, 60)
    GUI:TextInput_setReturnType(inpitField, 2)
    GUI:TextInput_setInputMode(inpitField, 6)
    GUI:TextInput_setPlaceHolder(inpitField, "")
    GUI:TextInput_addOnHandler(inpitField, function(event)
        if event.name == "began" then   -- 开始输入
            main_ui_win32_chat_win32._input_ing = true

        elseif event.name == "return" then -- 确认
            main_ui_win32_chat_win32._input_ing = false

        elseif event.name == "changed" then  -- 输入ing
            if GUI:TextInput_getString(inpitField) == "/" then  --打开私聊
                main_ui_win32_chat_win32.UpdateShowPrivateList()
            else
                main_ui_win32_chat_win32.HidePrivateList()
            end

        elseif event.name == "send" then    -- 发送
            main_ui_win32_chat_win32._input_ing = false
            -- 发送
            local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
            local inpitField = GUI:getChildByName(inputPanel, "TextField_input")
            main_ui_win32_chat_win32.SendMsg(GUI:TextInput_getString(inpitField))
            main_ui_win32_chat_win32.UpdateReplaceInput("")
            main_ui_win32_chat_win32.HidePrivateList()
        end
    end)


    GUI:setVisible(GUI:getChildByName(inputPanel, "Button_switch_show"), false)
    GUI:setVisible(GUI:getChildByName(inputPanel, "Button_switch_hide"), true)

    GUI:addOnClickEvent(GUI:getChildByName(inputPanel, "Image_chanel"), function()
        main_ui_win32_chat_win32._is_show_chanels = not main_ui_win32_chat_win32._is_show_chanels
        main_ui_win32_chat_win32.UpdateChanels()
    end)

    GUI:addOnClickEvent(GUI:getChildByName(inputPanel, "Button_switch_show"), function()
        main_ui_win32_chat_win32._is_show_chanels = true
        main_ui_win32_chat_win32.UpdateChanels()
    end)

    GUI:addOnClickEvent(GUI:getChildByName(inputPanel, "Button_switch_hide"), function()
        main_ui_win32_chat_win32._is_show_chanels = false
        main_ui_win32_chat_win32.UpdateChanels()
    end)

    local switchScrollView = GUI:getChildByName(GUI:getChildByName(inputPanel, "ScrollView_chanelbg"), "ScrollView_chanel")
    for channelID,btnName in pairs(CHANNEL_IMG_BTN) do
        local btnImage = GUI:getChildByName(GUI:getChildByName(switchScrollView, btnName .. "bg"), btnName)

        GUI:addOnClickEvent(btnImage, function()
            main_ui_win32_chat_win32.UpdateSelectChannel(channelID)
            main_ui_win32_chat_win32._is_show_chanels = false
            main_ui_win32_chat_win32.UpdateChanels()
            main_ui_win32_chat_win32.CheckChatLevel(channelID)
        end)
    end

    main_ui_win32_chat_win32.UpdateChanels()
end

--- 初始化聊天工具栏
function main_ui_win32_chat_win32.InitToolsPanel()
    local funcPanel = GUI:getChildByName(ui["Panel_1"], "Panel_function_dynamic")

    -- 表情
    GUI:addOnClickEvent(GUI:getChildByName(funcPanel, "Button_emoji"), function()
        SL:OpenChatExtendUI(2)
    end)

    -- 背包
    GUI:addOnClickEvent(GUI:getChildByName(funcPanel, "Button_bag"), function()
        SL:OpenChatExtendUI(3)
    end)

    -- 坐标
    GUI:addOnClickEvent(GUI:getChildByName(funcPanel, "Button_coordinate"), function()
        SL:SendPosMsgToChat()
    end)
    
    -- 历史记录
    GUI:addOnClickEvent(GUI:getChildByName(funcPanel, "Button_history"), function()
        local inputCache = SL:GetMetaValue("CHAT_INPUT_CACHE_R")
        if #inputCache == 0 then
            return
        end

        main_ui_win32_chat_win32.UpdateTouchDownAction()
        local cache = table.remove(inputCache, #inputCache)
        main_ui_win32_chat_win32.UpdateReplaceInput(cache)
    end)

    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    local inpitField = GUI:getChildByName(inputPanel, "TextField_input")
    GUI:addKeyboardEvent(100, function()
        main_ui_win32_chat_win32.SendMsg(GUI:TextInput_getString(inpitField))
    end)
end

--- 初始化频道选中/未选中状态
function main_ui_win32_chat_win32.InitChanelFilter()
    local filterPanel = GUI:getChildByName(ui["Panel_1"], "Panel_chanel_filter")
    for channelID, imgBtnName in pairs(FILTER_BTN) do
        local cellParent = GUI:getChildByName(filterPanel, imgBtnName)
        if cellParent then
            --点击切频道
            GUI:addOnClickEvent(cellParent, function()
                main_ui_win32_chat_win32._filter_select = channelID
                main_ui_win32_chat_win32.UpdateChanelFilter()
                main_ui_win32_chat_win32.UpdateChatScrollView()
            end)
            --选择框
            local cb_chat = GUI:getChildByName(cellParent, "cb_chat")
            GUI:CheckBox_setSelected(cb_chat, true)
            GUI:CheckBox_addOnEvent(cb_chat, function()
                local state = GUI:CheckBox_isSelected(cb_chat)
                if channelID == 0 then
                    --综合修改所有
                    for k, v in pairs(FILTER_BTN) do
                        local cellParent = GUI:getChildByName(filterPanel, v)
                        local cb = GUI:getChildByName(cellParent, "cb_chat")
                        GUI:CheckBox_setSelected(cb, state)
                        main_ui_win32_chat_win32._filter_state[k] = not state
                    end
                else
                    main_ui_win32_chat_win32._filter_state[channelID] = not state
                end
            end)
        end 
    end
    main_ui_win32_chat_win32.UpdateChanelFilter()
end

--- 初始化聊天频道
function main_ui_win32_chat_win32.InitPrivateChat()
    main_ui_win32_chat_win32._chat_private_select_idx = 1
    GUI:addOnClickEvent(ui["img_lb_bg"], function()
        main_ui_win32_chat_win32.UpdateShowPrivateList()
    end)
end

--- 刷新显示私聊目标
function main_ui_win32_chat_win32.UpdateShowPrivateList()
    local targets = SL:GetMetaValue("CHAT_PRIVATE_TARGETS")
    if not targets[1] then
        return
    end

    local showType = GUI:getVisible(ui["listView_bg"])
    GUI:setVisible(ui["listView_bg"], not showType)
    main_ui_win32_chat_win32._chat_private_select_idx = 1

    GUI:removeAllChildren(ui["ListView_target"])

    for i,v in ipairs(targets) do
        local item = GUI:Clone(ui["target_item"])
        GUI:ListView_pushBackCustomItem(ui["ListView_target"], item)

        GUI:setVisible(item, true)

        local itemUI = GUI:ui_delegate(item)
        GUI:Text_setString(itemUI.target_name, v.name)
        GUI:setVisible(itemUI.targer_select, i == main_ui_win32_chat_win32._chat_private_select_idx)
        GUI:addOnClickEvent(item, function()
            main_ui_win32_chat_win32.UpdateChangeChatTarget(i)

            main_ui_win32_chat_win32.HidePrivateList()
            main_ui_win32_chat_win32.UpdateTouchDownAction()
        end)
    end
end

--- 刷新聊天滚动
function main_ui_win32_chat_win32.UpdateStartTimer()
    GUI:stopAllActions(ui["Panel_1"])

    SL:schedule(ui["Panel_1"], function()
        if main_ui_win32_chat_win32._scroll_update_time_down > 0 then
            main_ui_win32_chat_win32._scroll_update_time_down = main_ui_win32_chat_win32._scroll_update_time_down - 1
        end

        if main_ui_win32_chat_win32._scroll_update_time_down == 0 then
            main_ui_win32_chat_win32._scroll_update_time_down = -1
            main_ui_win32_chat_win32.UpdateChatScrollView()
        end
    end, 0.1)
end

--- 刷新私聊目标更改
---@param index integer 私聊目标下标
function main_ui_win32_chat_win32.UpdateChangeChatTarget(index)
    main_ui_win32_chat_win32._chat_private_select_idx = index
    local childrens = GUI:getChildren(ui["ListView_target"])
    for i,v in ipairs(childrens) do
        GUI:setVisible(GUI:getChildByName(v, "targer_select"), i == index)
    end

    local targets = SL:GetMetaValue("CHAT_PRIVATE_TARGETS")
    main_ui_win32_chat_win32.UpdateReplaceInput("/" .. targets[index].name .. " ")
end

--- 刷新聊天滚动
function main_ui_win32_chat_win32.UpdateChatScrollView()
    local chatScrollView = main_ui_win32_chat_win32._chat_scroll_view[main_ui_win32_chat_win32._chat_show_mode]
    GUI:ScrollView_removeAllChildren(chatScrollView)

    local chatMsgs          = main_ui_win32_chat_win32._chat_items[main_ui_win32_chat_win32._chat_show_mode]:getTableData()
    local scrollViewWidth   = main_ui_win32_chat_win32._chat_panel_size.width - 10
    if main_ui_win32_chat_win32._chat_show_mode == SHOW_MODE.mini then
        scrollViewWidth = scrollViewWidth - 20
    end

    local height = 0
    local children = {}
    for index, msg in ipairs(chatMsgs) do
        local item = msg.item
        if not msg.item then
            local type = main_ui_win32_chat_win32._chat_show_mode
            local data = msg.data
            local width = type == SHOW_MODE.large and main_ui_win32_chat_win32.GetLargeChatWidth() or main_ui_win32_chat_win32.GetMiniChatWidth()
            item = SL:GetChatItem(type, data, width)

            GUI:Retain(item)

            height      = GUI:getContentSize(item).height
            msg.item    = item
            msg.height  = height
        end

        local channelId = msg.data.ChannelId or 1
        if main_ui_win32_chat_win32._filter_select == 0 or channelId == main_ui_win32_chat_win32._filter_select then
            GUI:ScrollView_addChild(chatScrollView, item)
            table.insert(children, item)
        end
    end

    GUI:ScrollView_sortChildrenToTop(chatScrollView, children)
    GUI:ListView_jumpToBottom(chatScrollView)

    GUI:Slider_setPercent(main_ui_win32_chat_win32.mLargeSlider, 100)
    GUI:Slider_setPercent(main_ui_win32_chat_win32.mSmallSlider, 100)
    main_ui_win32_chat_win32._is_scroll_ing = false
end

--- 刷新频道选中/未选中状态
function main_ui_win32_chat_win32.UpdateChanelFilter()
    local filterPanel = GUI:getChildByName(ui["Panel_1"], "Panel_chanel_filter")
    for chanelID, imgBtnName in pairs(FILTER_BTN) do
        local cellParent = GUI:getChildByName(filterPanel, imgBtnName)
        if cellParent then
            local img_select = GUI:getChildByName(cellParent, "img_select")
            GUI:setVisible(img_select, chanelID == main_ui_win32_chat_win32._filter_select)
        end
    end
end

--- 发送聊天
---@param chatMsg string 聊天内容
function main_ui_win32_chat_win32.SendMsg(chatMsg)
    if not chatMsg or string.len(chatMsg) <= 0 then
        SL:ShowSystemTips("您还未输入任何信息！")
        return
    end

    -- 禁止聊天
    if SL:GetMetaValue("IS_FORBID_SAY", true) then
        return
    end
    
    local function sendChatMsg( input, bForbid )
         -- 存储到输入缓存
        SL:SetMetaValue("CHAT_ADD_INPUT_CACHE", input)

        -- 发送
        local msg = input
        if bForbid == 1 then 
            msg = "**********"
        end 
        SL:SendNormalMsgToChat(msg)
    end

    local startIndex, endIndex = string.find(chatMsg, "^@传 .-")
    local specialStr = nil
    if startIndex and endIndex then
        specialStr = string.sub(chatMsg, endIndex+1, -1)
    end

    local channlID, content = GUIFunction:GetChatChannelByMsg(chatMsg)
    local targetName  = GUIFunction:FindChatTargeByMsg(chatMsg)

    if not (string.find(chatMsg, "^@.-") and not specialStr) then
        local channelID = SL:GetMetaValue("CHAT_CHANNEL")
        local data = {
            channel_id = channelID
        }

        if channelID == GUIFunction:GetChatChannel().Private then
            local targets = SL:GetMetaValue("CHAT_PRIVATE_TARGETS")
            if not targets[1] then
                data.to_role_level = SL:GetMetaValue("ACTOR_LEVEL", targets[1])
                data.to_role_id    = targets[1]
                data.to_role_name  = SL:GetMetaValue("ACTOR_NAME", targets[1])
            end
        end

        if channelID == GUIFunction:GetChatChannel().Private then
            chatMsg = content
        end

        local function handle_Func(state, str, bForbid)
            if not str then
                SL:ShowSystemTips("请不要包含敏感字或者特殊字符！")
                return
            end

            if specialStr then
                str = "@传 " .. str
            elseif targetName and content then
                str = string.format("/%s %s", targetName, content)
            end

            sendChatMsg(str, bForbid)
        end
        SL:FixSensitiveTalkAddFilter(specialStr or chatMsg, handle_Func, nil, data)
    else
        sendChatMsg( chatMsg )
    end
end

--- 刷新频道cell
function main_ui_win32_chat_win32.UpdateChanels()

    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")

    GUI:setVisible(GUI:getChildByName(inputPanel, "Button_switch_show"), not main_ui_win32_chat_win32._is_show_chanels)
    GUI:setVisible(GUI:getChildByName(inputPanel, "Button_switch_hide"), main_ui_win32_chat_win32._is_show_chanels)
    GUI:setVisible(GUI:getChildByName(inputPanel, "ScrollView_chanelbg"), main_ui_win32_chat_win32._is_show_chanels)

    if main_ui_win32_chat_win32._is_show_chanels then
        local switchScrollView = GUI:getChildByName(GUI:getChildByName(inputPanel, "ScrollView_chanelbg"), "ScrollView_chanel")
        local childrens = GUI:getChildren(switchScrollView)
        
        -- 剔除选中的
        local channels = {}
        for k,v in pairs(CHANNEL_IMG_BTN) do
            if k ~= main_ui_win32_chat_win32._select_chatnel_id then
                table.insert(channels, k)
            end
        end
        table.sort(channels)

        for k, child in pairs(childrens) do
            GUI:setVisible(child, false)
        end

        local srollChildren = {}
        for i, chanel in ipairs(channels) do
            local childName = CHANNEL_IMG_BTN[chanel].."bg"
            local child = GUI:getChildByName(switchScrollView, childName)
            GUI:setVisible(child, true)
            table.insert(srollChildren, child)
        end

        GUI:ScrollView_sortChildrenToTop(switchScrollView, srollChildren)
    end
end

--- 刷新选中频道 
---@param channelID integer 频道
function main_ui_win32_chat_win32.UpdateSelectChannel(channelID)
    main_ui_win32_chat_win32._select_chatnel_id = channelID
    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    local imagePath = "res/private/main_win32/chat_input/" .. CHANNEL_RES[channelID]

    GUI:Image_loadTexture(GUI:getChildByName(inputPanel, "Image_chanel"), imagePath)

    SL:ShowSystemNotice({BColor=255, FColor=219, Msg=CHANNEL_TIPS[channelID]})
    GUI:setVisible(ui["img_lb_bg"], channelID == GUIFunction:GetChatChannel().Private)

    SL:SetMetaValue("CHAT_CHANNEL", channelID)
    main_ui_win32_chat_win32.UpdateReplaceInput("")
    main_ui_win32_chat_win32.UpdateInputSize()
end

--- 刷新显示模式更改(mini/large)
---@param showMode integer 模式
function main_ui_win32_chat_win32.UpdateChangeShowMode(showMode)
    -- // 刷新显示模式， 显示大聊天窗口时： 扩展聊天也显示
    main_ui_win32_chat_win32._chat_show_mode = showMode
    for k,_scroll_view in pairs(main_ui_win32_chat_win32._chat_scroll_view) do
        GUI:setVisible(_scroll_view, showMode == k)
    end

    for k,_click_panel in pairs(main_ui_win32_chat_win32._chat_click_panel) do
        GUI:setVisible(_click_panel, showMode == k)
    end

    GUI:setVisible(GUI:getChildByName(ui["Panel_1"], "Panel_chanel_filter"), showMode == SHOW_MODE.large)
    
    main_ui_win32_chat_win32.UpdateDynamic()
    main_ui_win32_chat_win32.UpdateFunctionPanel()
    main_ui_win32_chat_win32.UpdateInputPos()
    main_ui_win32_chat_win32.UpdateInputSize()

    main_ui_win32_chat_win32._is_show_chanels = false
    main_ui_win32_chat_win32.UpdateChanels()

    main_ui_win32_chat_win32.UpdateChatExtentPos()

end

function main_ui_win32_chat_win32.UpdateDynamic()
    local dynamicPanel = GUI:getChildByName(ui["Panel_1"], "Panel_dynamic")
    local isLarge = main_ui_win32_chat_win32._chat_show_mode == SHOW_MODE.large

    GUI:setVisible(GUI:getChildByName(dynamicPanel, "Panel_large"), isLarge)
    GUI:setVisible(GUI:getChildByName(dynamicPanel, "Panel_small"), not isLarge)

end

--- 刷新显示模式更改(mini/large)
function main_ui_win32_chat_win32.UpdateFunctionPanel()
    local dynamicFuncPanel = GUI:getChildByName(ui["Panel_1"], "Panel_function_dynamic")
    local isLarge = main_ui_win32_chat_win32._chat_show_mode == SHOW_MODE.large
    GUI:setVisible(dynamicFuncPanel, isLarge)
end

--- 刷新输入位置
function main_ui_win32_chat_win32.UpdateInputPos()
    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    local x,y = 0,5
    if main_ui_win32_chat_win32._chat_show_mode == SHOW_MODE.large then
        y = 40
    end
    GUI:setPosition(inputPanel, x, y)
end

--- 刷新输入框大小
function main_ui_win32_chat_win32.UpdateInputSize()
    local posX = main_ui_win32_chat_win32._select_chatnel_id == GUIFunction:GetChatChannel().Private and 125 or 70
    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    local inpitField = GUI:getChildByName(inputPanel, "TextField_input")
    GUI:setPositionX(inpitField, posX)

    local size = cc.size(main_ui_win32_chat_win32._chat_panel_size.width, 17)
    size.width = main_ui_win32_chat_win32._chat_show_mode == SHOW_MODE.mini and (size.width - 180) or (size. width - 90)
    size.width = main_ui_win32_chat_win32._select_chatnel_id == GUIFunction:GetChatChannel().Private and (size.width - 55) or size. width

    GUI:setContentSize(inpitField, size)
end

--- 刷新角色等级
function main_ui_win32_chat_win32.UpdateRoleLevel()
    main_ui_win32_chat_win32.CheckChatLevel()

    local level = SL:GetMetaValue("LEVEL")

    local dynamicPanel  = GUI:getChildByName(ui["Panel_1"], "Panel_dynamic")
    local largePanel    = GUI:getChildByName(dynamicPanel, "Panel_large")
    local largemidImage = GUI:getChildByName(largePanel, "Image_large_mid")
    GUI:Text_setString(GUI:getChildByName(largemidImage, "Text_level"), level)

    local smallPanel    = GUI:getChildByName(dynamicPanel, "Panel_small")
    local midImage      = GUI:getChildByName(smallPanel, "Image_mid")
    GUI:Text_setString(GUI:getChildByName(midImage, "Text_level"), level)
end

--- 刷新历史输入
---@param str string
function main_ui_win32_chat_win32.UpdateReplaceInput(str)
    str = str or ""
    if str == "" then
        main_ui_win32_chat_win32._input_history_index = 1
    end

    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    local inpitField = GUI:getChildByName(inputPanel, "TextField_input")
    GUI:TextInput_setString(inpitField, str)
end

--- 隐藏私聊目标选中界面
function main_ui_win32_chat_win32.HidePrivateList()
    GUI:setVisible(ui["listView_bg"], false)
end

--- 添加表情item刷新
---@param str string
function main_ui_win32_chat_win32.UpdateAddChatEmojiInput(str)
    if not str then
        return
    end
    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    local inpitField = GUI:getChildByName(inputPanel, "TextField_input")
    -- 是否超出上限
    if string.utf8len(GUI:TextInput_getString(inpitField) .. str) > GUIFunction:GetChatLimitConfig().InputLength then
        GUI:ShowWorldTips("已超出输入上限")
    else
        main_ui_win32_chat_win32.UpdateReplaceInput(GUI:TextInput_getString(inpitField) .. str)
    end
end

--- 刷新聊天扩展
function main_ui_win32_chat_win32.UpdateChatExtent()
    local mode = main_ui_win32_chat_win32._chat_show_mode == 1 and 2 or 1
    main_ui_win32_chat_win32.UpdateChangeShowMode(mode)
    main_ui_win32_chat_win32.UpdateChatScrollView()
    main_ui_win32_chat_win32.UpdateChatExtentPos()

   
end

function main_ui_win32_chat_win32.UpdateChatExtentPos(...)
     --  扩展聊天也显示在大聊天窗口顶端
     if main_ui_win32_chat_win32._chat_show_mode == SHOW_MODE.large then
        GUI:setPosition(main_ui_win32_chat_win32.mChatExListView,main_ui_win32_chat_win32.posChatExListView.x-4,  main_ui_win32_chat_win32.posChatExListView.y + 166)
    else 
        GUI:setPosition(main_ui_win32_chat_win32.mChatExListView, main_ui_win32_chat_win32.posChatExListView.x, main_ui_win32_chat_win32.posChatExListView.y)
    end 
end

--- 更新往后查看历史记录
function main_ui_win32_chat_win32.UpdateHistoryBack()
    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    if not inputPanel then
        return
    end

    local cache = SL:GetMetaValue("CHAT_INPUT_CACHE_R")
    local index = main_ui_win32_chat_win32._input_history_index
    main_ui_win32_chat_win32._input_history_index = main_ui_win32_chat_win32._input_history_index + 1
    if index > #cache then
        index = 1
    end
    local str = cache[index]
    main_ui_win32_chat_win32.UpdateReplaceInput(str)
end

--- 更新往前查看历史记录
function main_ui_win32_chat_win32.UpdateHistoryFront()
    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    if not inputPanel then
        return
    end

    local cache = SL:GetMetaValue("CHAT_INPUT_CACHE_R")
    local index = main_ui_win32_chat_win32._input_history_index
    main_ui_win32_chat_win32._input_history_index = main_ui_win32_chat_win32._input_history_index - 1
    if index > #cache then
        index = 1
    end
    if index <= 1 then
        index = #cache
    end
    local str = cache[index]
    main_ui_win32_chat_win32.UpdateReplaceInput(str)
end

--- 添加聊天item刷新
---@param data table
function main_ui_win32_chat_win32.UpdateChatAddItem(data)
    if not data then
        return
    end

    data.FColor     = data.FColor or 0
    data.BColor     = data.BColor or 255

    if main_ui_win32_chat_win32._filter_state[data.ChannelId] then
        return false
    end

    -- 黑名单
    if data.SendId and data.SendName and SL:GetMetaValue("SOCIAL_IS_BLICKLIST", data.SendName) then
        return false
    end

    -- item
    for showMode, items in pairs(main_ui_win32_chat_win32._chat_items) do
        if items:getSize() >= main_ui_win32_chat_win32._chat_limit_count[showMode] then
            local item = items:getAndRemoveOne()
            if item.item then
                GUI:Release(item.item)
            end
        end
        items:push({data = data})
    end

    main_ui_win32_chat_win32._scroll_update_time_down = 1
end

--- 刷新私聊目标
---@param data table
function main_ui_win32_chat_win32.UpdateChatPrivateTarget(data)
    local bChat = main_ui_win32_chat_win32.CheckChatLevel(GUIFunction:GetChatChannel().Private)
    if not bChat then return end
    main_ui_win32_chat_win32.UpdateReplaceInput(string.format("/%s %s", data.name, (data.Msg or "")))
    main_ui_win32_chat_win32.HidePrivateList()
    main_ui_win32_chat_win32.UpdateTouchDownAction()
end

--- 角色数据初始化完成刷新
---@param data any
function main_ui_win32_chat_win32.UpdateRolePropertyInit(data)
    main_ui_win32_chat_win32.UpdateRoleLevel()
    main_ui_win32_chat_win32._mouse_in_actor_id = -1 --强制刷新
    main_ui_win32_chat_win32.UpdateActorMouseInOut()
end

--- 刷新聊天选择频道
---@param data any
function main_ui_win32_chat_win32.UpdateChatSwitchChanel(data)
    local channelID = SL:GetMetaValue("CHAT_CHANNEL")
    local mode      = (channelID+1) % (#CHANNEL_IMG_BTN+1)
    while not CHANNEL_IMG_BTN[mode] do
        mode = (mode+1) % (#CHANNEL_IMG_BTN+1)
        if mode > #CHANNEL_IMG_BTN + 10 then
            return
        end
    end

    main_ui_win32_chat_win32.UpdateSelectChannel(mode)
    main_ui_win32_chat_win32._is_show_chanels = false
    main_ui_win32_chat_win32.UpdateChanels()
    main_ui_win32_chat_win32.CheckChatLevel(mode)
end

--- 刷新扩展消息显示
---@param data table 聊天内容表数据
function main_ui_win32_chat_win32.UpdateChatExShowNotice(data)
    table.insert(main_ui_win32_chat_win32._chat_ex_items, data)
    main_ui_win32_chat_win32.UpdateChatCheckExNotice()
end

--- 扩展消息检测
function main_ui_win32_chat_win32.UpdateChatCheckExNotice()
    local chatExListView = main_ui_win32_chat_win32.mChatExListView

    local defineSize = GET_SIZE_BYID(998)
    local chatExWidth = GUI:getContentSize(chatExListView).width
    local chatExHeight = defineSize + 4
    local capacitySize= {width = chatExWidth, height = chatExHeight}

    local function resetListview()
        local items     = GUI:ListView_getItems(chatExListView)
        local height    = 0
        for i,v in ipairs(items) do
            height = height + GUI:getContentSize(v).height
        end
        GUI:setContentSize(chatExListView, chatExWidth, height)

        local chatExPanel = GUI:getChildByName(ui["Panel_1"], "Panel_dynamic")
        local contentSize = main_ui_win32_chat_win32.mChatMiniListViewSize

        GUI:setContentSize(main_ui_win32_chat_win32.mChatMiniListView, contentSize.width, contentSize.height-height)
        GUI:ListView_jumpToBottom(main_ui_win32_chat_win32.mChatMiniListView)

         -- 设置大聊天窗口的大小
        local largeContentSize = main_ui_win32_chat_win32.mChatLargeListViewSize
        GUI:setContentSize(main_ui_win32_chat_win32.mChatLargeListView, largeContentSize.width, largeContentSize.height-height)
        GUI:ListView_jumpToBottom(main_ui_win32_chat_win32.mChatLargeListView)
    end

    local function removeExItem(layout)
        if layout then
            for index, value in ipairs(main_ui_win32_chat_win32._itemsChatEx) do
                if value == layout then
                    table.remove(main_ui_win32_chat_win32._itemsChatEx, index)

                    local layoutIndex = GUI:ListView_getItemIndex(chatExListView, layout)
                    GUI:ListView_removeItemByIndex(chatExListView, layoutIndex)

                    break;
                end
            end
        else    
            -- 删除第一个
            if #main_ui_win32_chat_win32._itemsChatEx > 0 then
                layout = table.remove(main_ui_win32_chat_win32._itemsChatEx, 1)
   
                local layoutIndex = GUI:ListView_getItemIndex(chatExListView, layout)
                GUI:ListView_removeItemByIndex(chatExListView, layoutIndex)
            end
        end

    end

    if #chatExListView:getItems() >= 3 then
        if main_ui_win32_chat_win32._bTopOffChatEx then
            removeExItem()
            resetListview()
        else 
            return
        end
    end

    if #main_ui_win32_chat_win32._chat_ex_items == 0 then
        return
    end
    
    local defineSize = GET_SIZE_BYID(998)

    local data      = table.remove(main_ui_win32_chat_win32._chat_ex_items, 1)
    data.Time       = data.Time or 5
    data.Label      = data.Label or ""
    data.Y          = data.Y or 0
    data.Count      = data.Count or 1
    data.FColor     = data.FColor or 255
    data.BColor     = data.BColor or 255
    -- data.SendName   = data.SendName and (data.SendName .. ":") or "" -- 名字不可以加入其他字符， 点击panel获取名字
    data.SendName   = data.SendName or "" -- 名字不可以加入其他字符， 点击panel获取名字
    local FColorRGB = SL:GetColorByStyleId(data.FColor)
    local BColorRGB = SL:GetColorByStyleId(data.BColor)

    local layout = GUI:Layout_Create(-1, "CHAT_EX_LAYOUT", 0, 0, chatExWidth, chatExHeight, true)
    GUI:Layout_setBackGroundColor(layout, SL:GetColorXHexFromRBG(BColorRGB))
    GUI:Layout_setBackGroundColorType(layout, 0)
    GUI:Layout_setBackGroundColorOpacity(layout, 255)
    GUI:setAnchorPoint(layout, 0.5, 0.5)
    GUI:setPosition(layout, 0, chatExHeight/2)
    GUI:ListView_pushBackCustomItem(chatExListView, layout)
    resetListview()

    local scrollWidget = GUI:Widget_Create(layout, "SCROLL_VIEW", 0, 0, capacitySize.width, capacitySize.height)
    GUI:setAnchorPoint(layout, 0, 0)

    table.insert(main_ui_win32_chat_win32._itemsChatEx, layout) 

    local scrollAble = nil
    local scrollSize = GUI:Size(0, 0)
    local remaining  = data.Time
    -- ↓↓↓ //FIXME 这里想要实现倒计时功能吗？ 没看懂。要实现倒计时的 应该是 "%s" or "%d" 
    local Msg        = string.gsub(data.Msg, "%%S", "%%s")
    local hasFormat  = string.find(Msg, "%%s") or string.find(Msg, "%%d")


    -- 创建置顶聊天 + 加入表情包显示
    local function createExRichText()
        data.Msg = (hasFormat and string.format(Msg, remaining) or Msg)
        GUI:removeAllChildren(scrollWidget)
        local richText = SL:GetChatItem(SHOW_MODE.ex, data, capacitySize.width, capacitySize.height, defineSize)
        GUI:addChild(scrollWidget, richText)
        if scrollAble == nil then
            GUI:RichTextCombine_format(richText)
            scrollSize = GUI:getContentSize(richText)
            scrollAble = scrollSize.width > capacitySize.width
        end
        local richTextSize = GUI:getContentSize(richText)
        GUI:setContentSize(scrollWidget, capacitySize.width, richTextSize.height)
        
    end 

    createExRichText()

    local function callback()

        remaining = remaining - 1
        if remaining < 0 then
            removeExItem(layout)
            resetListview()
            main_ui_win32_chat_win32.UpdateChatCheckExNotice()
            return
        end
        if hasFormat then
            createExRichText()
        end
    end
    SL:schedule(layout, callback, 1)

    -- 滚动
    if scrollAble then
        local actionT = (scrollSize.width - capacitySize.width) / 50
        local aciton1 = GUI:ActionMoveTo(actionT, scrollSize.width - capacitySize.width, 0)
        local action2 = GUI:DelayTime(3)
        local action3 = GUI:ActionMoveTo(0, 0, 0)
        local action4 = GUI:ActionSequence(aciton1, action2, action3)
        local action5 = GUI:ActionRepeatForever(action4)
        GUI:runAction(scrollWidget, action5)
    end
end

--- 刷新输入框按下状态
function main_ui_win32_chat_win32.UpdateTouchDownAction()
    local inputPanel = GUI:getChildByName(ui["Panel_1"], "Panel_input")
    local inpitField = GUI:getChildByName(inputPanel, "TextField_input")
    GUI:TextInput_touchDownAction(inpitField, 2)
end

--- 鼠标进入移除目标刷新
---@param actorID string actor id
function main_ui_win32_chat_win32.UpdateActorMouseInOut(actorID)
    local isNpc = SL:GetMetaValue("ACTOR_IS_NPC", actorID)
    if not actorID or actorID == "" or SL:GetMetaValue("ACTOR_IS_NPC", actorID) then
        GUI:setVisible(ui.nd_minimap, true)
    else
        GUI:setVisible(ui.nd_minimap, false)
    end

    if main_ui_win32_chat_win32._mouse_in_actor_id == actorID then
        return
    end

    main_ui_win32_chat_win32._mouse_in_actor_id = actorID
    
    actorID = SL:GetMetaValue("ACTOR_ID", actorID)
    if not actorID then
        actorID = SL:GetMetaValue("MAIN_ACTOR_ID")
    end

    if not actorID or actorID == "" then
        return
    end

    local function updateHeadImageSize(head)
        local headSize = GUI:getContentSize(head)
        if headSize.width ~= IMAGE_SIZE.width or headSize.height ~= IMAGE_SIZE.height then
            local scale = math.min(IMAGE_SIZE.width/headSize.width, IMAGE_SIZE.height/headSize.height)
            GUI:setIgnoreContentAdaptWithSize(head, false)
            GUI:setScale(head, scale)
        end
    end

    local smallPanel    = GUI:getChildByName(ui["Panel_dynamic"], "Panel_small")
    local headImage     = GUI:getChildByName(smallPanel, "Image_head")
    local raceImage     = GUI:getChildByName(headImage, "Image_race")
    local propertyPanel = GUI:getChildByName(smallPanel, "Panel_property")

    GUI:setIgnoreContentAdaptWithSize(headImage, true)
    GUI:setScale(headImage, 1)
    GUI:setVisible(propertyPanel, false)
    GUI:setVisible(raceImage, false)

    if SL:GetMetaValue("ACTOR_IS_PLAYER", actorID) then
        local job       = SL:GetMetaValue("ACTOR_JOB_ID", actorID)
        local sex       = SL:GetMetaValue("ACTOR_SEX", actorID)
        local headPath  = string.format("res/private/main_win32/player_head/head_%s_%s.png", job, sex)
        GUI:Image_loadTexture(headImage, headPath)
        updateHeadImageSize(headImage)
        return
    end

    if not SL:GetMetaValue("ACTOR_IS_MONSTER", actorID) then
        return
    end

    local monMapY = SL:GetMetaValue("ACTOR_MAP_Y", actorID)
    local myMapY = SL:GetMetaValue("Y")
    if (monMapY - myMapY) >= 6 then return  end

    local typeIndex = SL:GetMetaValue("ACTOR_TYPE_INDEX", actorID)
    local config    = SL:GetMetaValue("MONSTER_CONFIG_BY_ID", typeIndex)
    if not config then
        GUI:Image_loadTexture(headImage, "res/MonImg/1999.png")
        updateHeadImageSize(headImage)
        return
    end
    GUI:setVisible(propertyPanel, true)
    GUI:setVisible(raceImage, true)
    local headPath  = string.format("res/MonImg/%s.png", config.Appr)
    if SL:IsFileExist(headPath) then
        GUI:Image_loadTexture(headImage, headPath)
    else
        GUI:Image_loadTexture(headImage, "res/MonImg/1999.png")
    end
    updateHeadImageSize(headImage)

    
    
    local sx, sy = 12, 78
    local dominateimage= GUI:getChildByName(propertyPanel, "Image_dominate")
    if config.Undead == 1 then
        GUI:Image_loadTexture(raceImage, "res/private/main/Target/" .. "icon_4.png")
        GUI:Image_loadTexture(dominateimage, "res/private/main/Target/" .. "icon_2.png")
    else
        GUI:Image_loadTexture(raceImage, "res/private/main/Target/" .. "icon_3.png")
        GUI:Image_loadTexture(dominateimage, string.format("res/private/main/Target/" .. "icon_%s.png", config.Desc == 32 and 2 or 1))
    end
    GUI:setPosition(dominateimage, sx, sy)

    local attackImage = GUI:getChildByName(propertyPanel, "Image_attack")
    if config.McType and config.McType ~= 0 then
        sx = sx + 21
        GUI:setVisible(attackImage, true)
        GUI:Image_loadTexture(attackImage, "res/private/main/Target/icon_ys_" .. config.McType .. ".png")
        GUI:setPosition(attackImage, sx, sy)
    else
        GUI:setVisible(attackImage, false)
    end

    local speedImage = GUI:getChildByName(propertyPanel, "Image_move")
    GUI:setVisible(speedImage, false)
    -- 移除怪物移动速度图标
    -- local walkSpeed  = tonumber(config.WALK_SPD)
    -- if walkSpeed then
    --     sx = sx + 21
    --     GUI:setVisible(speedImage, true)
    --     local speedName = nil
    --     if walkSpeed == 0 then
    --         speedName = "speed_0"
    --     else
    --         local slv = 7
    --         for i,v in ipairs(SPEED_LEVEL) do
    --             if walkSpeed > v then
    --                 slv = i
    --                 break
    --             end
    --         end
    --         speedName = "speed_" .. slv
    --     end
    --     GUI:Image_loadTexture(speedImage, "res/private/main/Target/" .. speedName .. ".png")
    --     GUI:setPosition(speedImage, sx, sy)
    -- else
    --     GUI:setVisible(speedImage, false)
    -- end

    local bAutoHide = false
    if global.ConstantConfig.hideMonsterAttrs == 1 then
        bAutoHide = true
    end

    local idx = 0
    for k,v in pairs(YS_NAME) do
        local value = config[v] or 0
        local attrImage = GUI:getChildByName(propertyPanel, "Image_attr_" .. k)
        if value ~= 0 or not bAutoHide then
            if value >= 0 then value = "+"..value end
            GUI:Text_setString(GUI:getChildByName(attrImage, "Text_val"), value)
    
            GUI:setVisible(attrImage, true)
            GUI:setPosition(attrImage, 14 + ((idx % 3) * 42), 56 - (math.floor(idx / 3) * 22))
    
            idx = idx + 1
        else
            GUI:setVisible(attrImage, false)
        end
    end
end

--鼠标移入图片变化
function main_ui_win32_chat_win32.UpdateEnterLeaveShow(clickPanel, tips, offset, anchor, param)
    GUI:addMouseMoveEvent(clickPanel, {
        onEnterFunc = function()
            if not SL:getUserInputIsTouching() and GUI:getVisible(clickPanel) then
                GUI:Button_loadTextureNormal(clickPanel, IMAGE_PATH.."img_red.png")
                SL:showMouseOverTips(clickPanel, tips, {x = 0, y = -5}, {x = 0, y = 0.4})
            end
        end,
        onLeaveFunc = function()
            GUI:Button_loadTextureNormal(clickPanel, IMAGE_PATH.."img_blue.png")
            SL:hideMouseOverTips()
        end,
    })
end

--获取小聊天框长度
function main_ui_win32_chat_win32.GetMiniChatWidth()
    local width = main_ui_win32_chat_win32.mChatMiniListViewSize.width
    if ui.Image_head then
        width = width - main_ui_win32_chat_win32._image_head_size.width
    end
    return width
end
--获取大聊天框长度
function main_ui_win32_chat_win32.GetLargeChatWidth()
    return GUI:getContentSize(main_ui_win32_chat_win32.mChatLargeListView).width
end

--更新彩虹显示
function main_ui_win32_chat_win32.UpdateRainBowShow()
    local mapSafeType = SL:GetMetaValue("MAP_SAFE_TYPE")
    local mapRainBow = mapSafeType and mapSafeType or "other"
    local imgType = RAINBOW_IMG_NAME[mapRainBow] or 2
    if SL:GetMetaValue("IN_SAFE_AREA") then
        imgType = RAINBOW_IMG_NAME["SAFE"]
    end
    local spPath = string.format("res/private/main/rainbow_%s.png", imgType)
    GUI:setIgnoreContentAdaptWithSize(ui.img_large_rainbow, true)
    GUI:setIgnoreContentAdaptWithSize(ui.img_small_rainbow, true)
    GUI:Image_loadTexture(ui.img_large_rainbow, spPath)
    GUI:Image_loadTexture(ui.img_small_rainbow, spPath)
end
----------------------------------------handle event begin---------------------------
function main_ui_win32_chat_win32.HandlerUpdateActorMouseIn(actorID)
    main_ui_win32_chat_win32.UpdateActorMouseInOut(actorID)
end

function main_ui_win32_chat_win32.HandlerUpdateActorMouseOut(actorID)
    main_ui_win32_chat_win32.UpdateActorMouseInOut()
end

function main_ui_win32_chat_win32.HandlerUpdateLevelChange()
    main_ui_win32_chat_win32.UpdateRoleLevel()
end

function main_ui_win32_chat_win32.HandlerUpdateChatEmojiInput(data)
    main_ui_win32_chat_win32.UpdateAddChatEmojiInput(data)
end

function main_ui_win32_chat_win32.HandlerUpdateChatReplaceInput(data)
    main_ui_win32_chat_win32.UpdateReplaceInput(data)
end

function main_ui_win32_chat_win32.HandlerUpdateChatEnterSend()
    main_ui_win32_chat_win32.UpdateTouchDownAction()
end

function main_ui_win32_chat_win32.HandlerUpdateChatExtent()
    -- 打开扩展聊天窗口 -- 传音筒
    main_ui_win32_chat_win32.UpdateChatExtent()
end

function main_ui_win32_chat_win32.HandlerUpdateHistoryBack()
    main_ui_win32_chat_win32.UpdateHistoryBack()
end

function main_ui_win32_chat_win32.HandlerUpdateHistoryFront()
    main_ui_win32_chat_win32.UpdateHistoryFront()
end

function main_ui_win32_chat_win32.HandlerUpdateAddItem(data)
    main_ui_win32_chat_win32.UpdateChatAddItem(data)
end

function main_ui_win32_chat_win32.HandlerUpdateChatPrivateTarget(data)
    main_ui_win32_chat_win32.UpdateChatPrivateTarget(data)
end

function main_ui_win32_chat_win32.HandlerUpdateRolePropertyInit(data)
    main_ui_win32_chat_win32.UpdateRolePropertyInit(data)
end

function main_ui_win32_chat_win32.HandlerUpdateChatSwitchChanel(data)
    main_ui_win32_chat_win32.UpdateChatSwitchChanel(data)
end

function main_ui_win32_chat_win32.HandlerUpdateChatExShowNotice(data)
    main_ui_win32_chat_win32.UpdateChatExShowNotice(data)
end

function main_ui_win32_chat_win32.HandlerUpdateMapExchange(data)
    main_ui_win32_chat_win32.UpdateRainBowShow(data)
end

function main_ui_win32_chat_win32.HandlerUpdateMapStateChange(data)
    main_ui_win32_chat_win32.UpdateRainBowShow(data)
end
----------------------------------------handle event end-----------------------------

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
main_ui_win32_chat_win32.events = events
main_ui_win32_chat_win32.key = "main_ui_win32_chat_win32"
_G["main_ui_win32_chat_win32"] = main_ui_win32_chat_win32
return main_ui_win32_chat_win32