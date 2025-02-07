--------------------------------------------------------------
-- This file was automatically generated and called by F8.
--------------------------------------------------------------
local SL = _G["SL"]
local GUI = _G["GUI"]

local player_player_frame_other = {}
----------------- ↓↓↓ local variables ↓↓↓ --------------------
local root
local ui

local showLayer = nil

local page_url = "player_layer/"
local ui_name_list = {
    "equip_other", "title_other", "super_equip_other"
}
----------------- ↓↓↓ event callback ↓↓↓ ---------------------
local events = {
    Attach              = SL:AddAttachEvent("player_layer/frame_other"),
    UnAttach            = SL:AddUnAttachEvent("player_layer/frame_other"),

    Update              = SL:AddAttachEvent("player_layer/equip_other"),
    Update2             = SL:AddAttachEvent("player_layer/title_other"),
    Update3             = SL:AddAttachEvent("player_layer/super_equip_other"), 
}
--------------------------------------------------------------

function player_player_frame_other.Attach(layerRoot)
    root = layerRoot
    ui = GUI:ui_delegate(layerRoot)

    -------↓↓↓ player_player_frame_other script ↓↓↓---- UTF-8
    SL:Print("player_player/frame_other 打开了！")
    
    --按钮触发
    for i,name in ipairs(ui_name_list) do
        local pageName = page_url .. name
        GUI:addOnClickEvent(ui["Button_"..name], function()
            GUI:OpenLayer(pageName)  
        end)
    end
    --关闭
    GUI:addOnClickEvent(ui["Button_close"], function()
        GUI:CloseLayer("player_layer/frame_other")
    end)
    -------↑↑↑ player_player_frame_other script ↑↑↑----
end

function player_player_frame_other.Update()
    if not ui then return end
    --按钮显示刷新
    for i,name in ipairs(ui_name_list) do
        local pageName = page_url .. name
        GUI:Button_setBright(ui["Button_" .. name], (not GUI:IsLayerShow(pageName)))
    end
end

function player_player_frame_other.Update2()
    player_player_frame_other.Update()
end
function player_player_frame_other.Update3()
    player_player_frame_other.Update()
end

function player_player_frame_other.UnAttach()
    root = nil
    ui = nil
end

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
player_player_frame_other.events = events
player_player_frame_other.key = "player_player_frame_other"
_G["player_player_frame_other"] = player_player_frame_other
return player_player_frame_other