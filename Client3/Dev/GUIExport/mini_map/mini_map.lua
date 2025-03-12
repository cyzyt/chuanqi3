local ui = {} 
function ui.init(parent)
local Scene = GUI:Node_Create(parent, "Scene", 0, 0)

local Panel_2 = GUI:Layout_Create(Scene, "Panel_2", -379, -232, 642, 476, false)
GUI:Layout_setBackGroundColorOpacity(Panel_2, 255)
GUI:Layout_setBackGroundImage(Panel_2, "")

local Panel_1 = GUI:Layout_Create(Scene, "Panel_1", 23, -30, 630, 420, false)
GUI:Layout_setBackGroundColorOpacity(Panel_1, 255)
GUI:Layout_setBackGroundImage(Panel_1, "")
GUI:setAnchorPoint(Panel_1, 0.5, 0.5)
GUI:setTag(Panel_1, 55)

local img_under = GUI:Image_Create(Panel_1, "img_under", -64, 0, "res/private/minimap/1900012103.png")
GUI:setContentSize(img_under, 630, 420)

local Image_inner_bg = GUI:Image_Create(Panel_1, "Image_inner_bg", 380, 210, "res/private/minimap/bg_02.png")
GUI:setAnchorPoint(Image_inner_bg, 0.5, 0.5)
GUI:setContentSize(Image_inner_bg, 630, 420)
GUI:setTag(Image_inner_bg, 88)

local Panel_map = GUI:Layout_Create(Panel_1, "Panel_map", -61, 420, 630, 420, false)
GUI:Layout_setBackGroundColorOpacity(Panel_map, 255)
GUI:Layout_setBackGroundImage(Panel_map, "")
GUI:setAnchorPoint(Panel_map, 0, 1)
GUI:setTag(Panel_map, 56)

local Panel_minimap = GUI:Layout_Create(Panel_map, "Panel_minimap", 304, 210, 610, 420, false)
GUI:Layout_setBackGroundColorOpacity(Panel_minimap, 255)
GUI:Layout_setBackGroundImage(Panel_minimap, "")
GUI:setAnchorPoint(Panel_minimap, 0.5, 0.5)
GUI:setTag(Panel_minimap, 58)

local Image_mini_map = GUI:Image_Create(Panel_minimap, "Image_mini_map", 310, 210, "Default/ImageFile.png")
GUI:setAnchorPoint(Image_mini_map, 0.5, 0.5)
GUI:setContentSize(Image_mini_map, 46, 46)
GUI:setTag(Image_mini_map, 59)

local Image_clip = GUI:Image_Create(Panel_minimap, "Image_clip", 308, 210, "res/private/minimap/1900012104.png")
GUI:setAnchorPoint(Image_clip, 0.5, 0.5)
GUI:setContentSize(Image_clip, 620, 420)
GUI:setTag(Image_clip, 60)

local Panel_event = GUI:Layout_Create(Panel_minimap, "Panel_event", 315, 210, 200, 200, false)
GUI:Layout_setBackGroundColorOpacity(Panel_event, 255)
GUI:Layout_setBackGroundImage(Panel_event, "")
GUI:setAnchorPoint(Panel_event, 0.5, 0.5)
GUI:setTag(Panel_event, 61)
GUI:setTouchEnabled(Panel_event, true)

local Node_monsters = GUI:Node_Create(Panel_minimap, "Node_monsters", 0, 0)
GUI:setTag(Node_monsters, 17)

local Node_portals = GUI:Node_Create(Panel_minimap, "Node_portals", 0, 0)
GUI:setTag(Node_portals, 18)

local Node_path = GUI:Node_Create(Panel_minimap, "Node_path", 0, 0)
GUI:setTag(Node_path, 62)

local Node_npc = GUI:Node_Create(Panel_minimap, "Node_npc", 0, 0)
GUI:setTag(Node_npc, 20)

local Node_boss = GUI:Node_Create(Panel_minimap, "Node_boss", 0, 0)
GUI:setTag(Node_boss, 20)

local Node_pet = GUI:Node_Create(Panel_minimap, "Node_pet", 0, 0)
GUI:setTag(Node_pet, 20)

local Image_point = GUI:Layout_Create(Panel_minimap, "Image_point", 100, 80, 100, 25, false)
GUI:Layout_setBackGroundColorOpacity(Image_point, 255)
GUI:Layout_setBackGroundImage(Image_point, "")
GUI:Layout_setBackGroundImageScale9Enabled(Image_point, true)
GUI:setAnchorPoint(Image_point, 0.5, 0.5)
GUI:setTag(Image_point, 63)
GUI:setTouchEnabled(Image_point, true)

local Text_point = GUI:Text_Create(Image_point, "Text_point", 50, 12, 21, "#00FF00", "(123，123）")
GUI:Text_enableOutline(Text_point, "#000000", 0)
GUI:setAnchorPoint(Text_point, 0.5, 0.5)
GUI:setContentSize(Text_point, 122, 22)
GUI:setIgnoreContentAdaptWithSize(Text_point, true)
GUI:setScaleX(Text_point, 0.69999998807907)
GUI:setScaleY(Text_point, 0.69999998807907)
GUI:setTag(Text_point, 64)

local Node_team = GUI:Node_Create(Panel_minimap, "Node_team", 0, 0)
GUI:setTag(Node_team, 20)

local Image_player = GUI:Image_Create(Panel_minimap, "Image_player", 100, 50, "res/private/minimap/icon_xdtzy_02.png")
GUI:setAnchorPoint(Image_player, 0.5, 0.5)
GUI:setContentSize(Image_player, 12, 10)
GUI:setTag(Image_player, 65)

local Image_name = GUI:Image_Create(Panel_map, "Image_name", 312, 492, "res/private/minimap/1900012107.png")
GUI:setAnchorPoint(Image_name, 0.5, 1)
GUI:setContentSize(Image_name, 200, 26)
GUI:setTag(Image_name, 66)
GUI:setVisible(Image_name, false)

local Text_name = GUI:Text_Create(Panel_map, "Text_name", 30, -73, 18, "#FFFFFF", "中州皇城")
GUI:Text_enableOutline(Text_name, "#000000", 0)
GUI:setAnchorPoint(Text_name, 0, 0.5)
GUI:setContentSize(Text_name, 72, 20)
GUI:setIgnoreContentAdaptWithSize(Text_name, true)
GUI:setTag(Text_name, 67)
GUI:setVisible(Text_name, false)

local ListView_btn = GUI:ListView_Create(Panel_1, "ListView_btn", -5, 432, 37, 243, 1)
GUI:Layout_setBackGroundColorOpacity(ListView_btn, 255)
GUI:Layout_setBackGroundImage(ListView_btn, "")
GUI:Layout_setClippingEnabled(ListView_btn, true)
GUI:ListView_setGravity(ListView_btn, 2)
GUI:ListView_setItemsMargin(ListView_btn, 5)
GUI:setAnchorPoint(ListView_btn, 1, 1)
GUI:setTag(ListView_btn, 90)
GUI:setVisible(ListView_btn, false)

local Image_bg = GUI:Image_Create(Panel_1, "Image_bg", 315, 228, "res/private/minimap/map_k_bg.png")
GUI:Image_setScale9Enabled(Image_bg, true)
GUI:Image_setScale9Slice(Image_bg, 10, 10, 0, 0)
GUI:setAnchorPoint(Image_bg, 0.5, 0.5)
GUI:setContentSize(Image_bg, 770, 478)
GUI:setTag(Image_bg, 57)

local Button_close = GUI:Button_Create(Panel_1, "Button_close", 658, 465, "res/public/1900000510.png")
GUI:Button_loadTexturePressed(Button_close, "res/public/1900000511.png")
GUI:Button_setTitleColor(Button_close, "#414146")
GUI:Button_setTitleFontSize(Button_close, 10)
GUI:Button_setTitleText(Button_close, "")
GUI:setAnchorPoint(Button_close, 0, 1)
GUI:setContentSize(Button_close, 34, 34)
GUI:setTag(Button_close, 16)

local Image_title = GUI:Image_Create(Panel_1, "Image_title", 312, 438, "res/private/minimap/img_title.png")
GUI:setAnchorPoint(Image_title, 0.5, 0.5)
GUI:setContentSize(Image_title, 52, 30)
GUI:setTag(Image_title, 93)

local Panel_deliver = GUI:Layout_Create(Panel_1, "Panel_deliver", -61, 0, 620, 420, false)
GUI:Layout_setBackGroundColorOpacity(Panel_deliver, 255)
GUI:Layout_setBackGroundImage(Panel_deliver, "")
GUI:setTag(Panel_deliver, 89)
GUI:setTouchEnabled(Panel_deliver, true)

local Button_type = GUI:Button_Create(Panel_1, "Button_type", 0, 0, "res/public/1900000641.png")
GUI:Button_loadTextureDisabled(Button_type, "res/public/1900000640.png")
GUI:Button_loadTexturePressed(Button_type, "res/public/1900000640.png")
GUI:Button_setTitleColor(Button_type, "#414146")
GUI:Button_setTitleFontSize(Button_type, 10)
GUI:Button_setTitleText(Button_type, "")
GUI:setAnchorPoint(Button_type, 1, 0.5)
GUI:setContentSize(Button_type, 37, 80)
GUI:setTag(Button_type, 91)
GUI:setVisible(Button_type, false)

local Image_type = GUI:Image_Create(Button_type, "Image_type", 21, 40, "res/private/minimap/text_1_n.png")
GUI:setAnchorPoint(Image_type, 0.5, 0.5)
GUI:setContentSize(Image_type, 20, 40)
GUI:setTag(Image_type, 92)

 
end 
return ui