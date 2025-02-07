local ui = {} 
function ui.init(parent)
local Layer = GUI:Layout_Create(parent, "Layer", 0, 0, 1136, 640, false)
GUI:Layout_setBackGroundColorOpacity(Layer, 255)
GUI:Layout_setBackGroundImage(Layer, "")
GUI:setAnchorPoint(Layer, 0.5, 0.5)

local Nodes = GUI:Widget_Create(Layer, "Nodes", 568, 320, 0, 0)

local FileNode_1 = GUI:FileNode_Create(Nodes, "FileNode_1", 0, 0, "main/main_root_mm", "gang/entry", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_2 = GUI:FileNode_Create(Nodes, "FileNode_2", 0, 0, "main/main_root_mm", "gang/create_frame", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_3 = GUI:FileNode_Create(Nodes, "FileNode_3", 0, 0, "main/main_root_mm", "gang/home_frame", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_4 = GUI:FileNode_Create(Nodes, "FileNode_4", -220, 0, "main/main_root_mm", "player_layer/frame", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_5 = GUI:FileNode_Create(Nodes, "FileNode_5", 0, 0, "main/main_root_mm", "monster_intro/monster_intro", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_7 = GUI:FileNode_Create(Nodes, "FileNode_7", 0, 0, "main/main_root_mm", "mail/multi_layer", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_8 = GUI:FileNode_Create(Nodes, "FileNode_8", 0, 0, "main/main_root_mm", "page_store/page_store_fram", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_9 = GUI:FileNode_Create(Nodes, "FileNode_9", 0, 0, "main/main_root_mm", "page_store/quick_datail_panel_n", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_10 = GUI:FileNode_Create(Nodes, "FileNode_10", 0, 0, "main/main_root_mm", "page_store/calc_panel_n", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_11 = GUI:FileNode_Create(Nodes, "FileNode_11", 0, 0, "main/main_root_mm", "new_setting/new_setting_fram", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_12 = GUI:FileNode_Create(Nodes, "FileNode_12", 0, 0, "main/main_root_mm", "team/team_fram", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_13 = GUI:FileNode_Create(Nodes, "FileNode_13", 0, 0, "main/main_root_mm", "team/team_invite", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_14 = GUI:FileNode_Create(Nodes, "FileNode_14", 0, 0, "main/main_root_mm", "team/team_apply", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_15 = GUI:FileNode_Create(Nodes, "FileNode_15", 0, 0, "main/main_root_mm", "friend/friend_addenemy", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_16 = GUI:FileNode_Create(Nodes, "FileNode_16", 0, 0, "main/main_root_mm", "friend/friend_addfriend", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_36 = GUI:FileNode_Create(Nodes, "FileNode_36", 0, 0, "main/main_root_mm", "friend/friend_addblack", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_17 = GUI:FileNode_Create(Nodes, "FileNode_17", 0, 0, "main/main_root_mm", "friend/friend_apply", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_18 = GUI:FileNode_Create(Nodes, "FileNode_18", 0, 0, "main/main_root_mm", "rank/rank", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=1,})

local FileNode_19 = GUI:FileNode_Create(Nodes, "FileNode_19", 0, 0, "main/main_root_mm", "auction/auction_frame", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_20 = GUI:FileNode_Create(Nodes, "FileNode_20", 0, 0, "main/main_root_mm", "auction/auction_bid", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_21 = GUI:FileNode_Create(Nodes, "FileNode_21", 0, 0, "main/main_root_mm", "auction/auction_buuy", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_22 = GUI:FileNode_Create(Nodes, "FileNode_22", 0, 0, "main/main_root_mm", "auction/auction_putin", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_23 = GUI:FileNode_Create(Nodes, "FileNode_23", 0, 0, "main/main_root_mm", "auction/auction_timeout", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_24 = GUI:FileNode_Create(Nodes, "FileNode_24", 0, 0, "main/main_root_mm", "auction/auction_putout", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_25 = GUI:FileNode_Create(Nodes, "FileNode_25", 205, 0, "main/main_root_mm", "bag_panel/bag_panel", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_26 = GUI:FileNode_Create(Nodes, "FileNode_26", 205, 0, "main/main_root_mm", "bag_panel/bag_sort_panel", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_37 = GUI:FileNode_Create(Nodes, "FileNode_37", 0, 0, "main/main_root_mm", "bag_panel/bag_sell_panel", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_27 = GUI:FileNode_Create(Nodes, "FileNode_27", 0, 0, "main/main_root_mm", "npc/npc_storage_layer", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_28 = GUI:FileNode_Create(Nodes, "FileNode_28", 0, 0, "main/main_root_mm", "auto_trade/auto_trade", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_29 = GUI:FileNode_Create(Nodes, "FileNode_29", 0, 0, "main/main_root_mm", "auto_trade/auto_trade_put", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_30 = GUI:FileNode_Create(Nodes, "FileNode_30", 0, 0, "main/main_root_mm", "auto_trade/auto_trade_set", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_31 = GUI:FileNode_Create(Nodes, "FileNode_31", 0, 0, "main/main_root_mm", "mini_map/mini_map", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_32 = GUI:FileNode_Create(Nodes, "FileNode_32", 0, 0, "main/main_root_mm", "npc/npc_sell_or_require_layer", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_33 = GUI:FileNode_Create(Nodes, "FileNode_33", 0, 0, "main/main_root_mm", "gang/make_relation", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_34 = GUI:FileNode_Create(Nodes, "FileNode_34", 0, 0, "main/main_root_mm", "gang/make_enemy", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

FileNode_36 = GUI:FileNode_Create(Nodes, "FileNode_36", 0, 0, "main/main_root_mm", "skill_setting/ui_buttons", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_35 = GUI:FileNode_Create(Nodes, "FileNode_35", 0, 0, "main/main_root_mm", "npc/npc_talk_layer", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_38 = GUI:FileNode_Create(Nodes, "FileNode_38", 0, 0, "main/main_root_mm", "bag_panel/sell_filter_panel", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_39 = GUI:FileNode_Create(Nodes, "FileNode_39", 0, 0, "main/main_root_mm", "tips/split_layer", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=1,})

local FileNode_40 = GUI:FileNode_Create(Nodes, "FileNode_40", 0, 0, "main/main_root_mm", "team/team_beInvited", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_41 = GUI:FileNode_Create(Nodes, "FileNode_41", 0, 0, "main/main_root_mm", "trade_layer/trade_layer", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

local FileNode_42 = GUI:FileNode_Create(Nodes, "FileNode_42", 0, 0, "main/main_root_mm", "trade_layer/bubble_tips_layer", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=1,})

local FileNode_44 = GUI:FileNode_Create(Nodes, "FileNode_44", 0, 0, "main/main_root_mm", "common_tips/common_vui_tips_layer", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=1,})

local FileNode_43 = GUI:FileNode_Create(Nodes, "FileNode_43", 0, 0, "main/main_root_mm", "be_strong_ui/be_strong_list", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=1,})

local FileNode_45 = GUI:FileNode_Create(Nodes, "FileNode_45", 0, 0, "main/main_root_mm", "player_layer/frame_other", {["bAttach"]=false,["bDrag"]=true,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=3,})

 
end 
return ui