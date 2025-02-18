local ui = {} 
function ui.init(parent)
local Scene = GUI:Node_Create(parent, "Scene", 0, 0)

local Panel_1 = GUI:Layout_Create(Scene, "Panel_1", 0, 0, 396, 604, false)
GUI:Layout_setBackGroundColorOpacity(Panel_1, 255)
GUI:Layout_setBackGroundImage(Panel_1, "")
GUI:setAnchorPoint(Panel_1, 0.5, 0.5)
GUI:setTag(Panel_1, 2)

local Image_bg = GUI:Image_Create(Panel_1, "Image_bg", -4, -2, "res/private/bag_ui/bag_ui_mobile/bg_beibao_01.png")
GUI:setContentSize(Image_bg, 404, 608)
GUI:setTag(Image_bg, 3)

local Image_title = GUI:Image_Create(Panel_1, "Image_title", 36, 556, "res/private/bag_ui/bag_ui_mobile/title_1.png")
GUI:setContentSize(Image_title, 56, 28)

local Panel_notouch = GUI:Layout_Create(Panel_1, "Panel_notouch", 12, 88, 380, 460, false)
GUI:Layout_setBackGroundColorOpacity(Panel_notouch, 255)
GUI:Layout_setBackGroundImage(Panel_notouch, "")
GUI:setTag(Panel_notouch, 35)
GUI:setTouchEnabled(Panel_notouch, true)

local Button_close = GUI:Button_Create(Panel_1, "Button_close", 368, 572, "res/private/bag_ui/bag_ui_mobile/close_btn.png")
GUI:Button_setTitleColor(Button_close, "#414146")
GUI:Button_setTitleFontSize(Button_close, 10)
GUI:Button_setTitleText(Button_close, "")
GUI:setAnchorPoint(Button_close, 0.5, 0.5)
GUI:setContentSize(Button_close, 30, 30)
GUI:setTag(Button_close, 8)

local Sv_items = GUI:ScrollView_Create(Panel_1, "Sv_items", 20, 540, 336, 448, 1)
GUI:Layout_setBackGroundColorOpacity(Sv_items, 255)
GUI:Layout_setBackGroundImage(Sv_items, "")
GUI:Layout_setClippingEnabled(Sv_items, true)
GUI:ScrollView_setInnerContainerSize(Sv_items, 340, 448)
GUI:setAnchorPoint(Sv_items, 0, 1)
GUI:setTouchEnabled(Sv_items, true)

local Panel_bg = GUI:Layout_Create(Sv_items, "Panel_bg", 0, 448, 336, 448, false)
GUI:Layout_setBackGroundColorOpacity(Panel_bg, 255)
GUI:Layout_setBackGroundImage(Panel_bg, "")
GUI:setAnchorPoint(Panel_bg, 0, 1)

local Panel_items = GUI:Layout_Create(Sv_items, "Panel_items", 0, 448, 336, 448, false)
GUI:Layout_setBackGroundColorOpacity(Panel_items, 255)
GUI:Layout_setBackGroundImage(Panel_items, "")
GUI:setAnchorPoint(Panel_items, 0, 1)
GUI:setTag(Panel_items, 4)

local Panel_addItems = GUI:Layout_Create(Sv_items, "Panel_addItems", 0, 448, 336, 448, false)
GUI:Layout_setBackGroundColorOpacity(Panel_addItems, 255)
GUI:Layout_setBackGroundImage(Panel_addItems, "")
GUI:setAnchorPoint(Panel_addItems, 0, 1)
GUI:setTouchEnabled(Panel_addItems, true)

local scrollBarLayout = GUI:Layout_Create(Panel_1, "scrollBarLayout", 366, 540, 14, 448, false)
GUI:Layout_setBackGroundColorOpacity(scrollBarLayout, 255)
GUI:Layout_setBackGroundImage(scrollBarLayout, "")
GUI:setAnchorPoint(scrollBarLayout, 0, 1)

local Node_1 = GUI:Node_Create(Panel_1, "Node_1", 120, 558)
GUI:setTag(Node_1, 27)

local Image_1 = GUI:Image_Create(Node_1, "Image_1", 0, 0, "res/private/bag_ui/bag_ui_mobile/title_4.png")
GUI:setContentSize(Image_1, 42, 24)

local Text_bag_num = GUI:Text_Create(Node_1, "Text_bag_num", 48, 14, 12, "#FFFFFF", "")
GUI:Text_enableOutline(Text_bag_num, "#000000", 0)
GUI:setAnchorPoint(Text_bag_num, 0, 0.5)
GUI:setContentSize(Text_bag_num, 0, 0)
GUI:setIgnoreContentAdaptWithSize(Text_bag_num, true)
GUI:setTag(Text_bag_num, 29)

local Node_weight = GUI:Node_Create(Panel_1, "Node_weight", 250, 558)
GUI:setTag(Node_weight, 27)

local Image_2 = GUI:Image_Create(Node_weight, "Image_2", 0, 0, "res/private/bag_ui/bag_ui_mobile/title_5.png")
GUI:setContentSize(Image_2, 42, 24)

local Text_weight_num = GUI:Text_Create(Node_weight, "Text_weight_num", 48, 14, 12, "#FFFFFF", "11/22")
GUI:Text_enableOutline(Text_weight_num, "#000000", 0)
GUI:setAnchorPoint(Text_weight_num, 0, 0.5)
GUI:setContentSize(Text_weight_num, 34, 14)
GUI:setIgnoreContentAdaptWithSize(Text_weight_num, true)
GUI:setTag(Text_weight_num, 29)

local Button_sell = GUI:Button_Create(Panel_1, "Button_sell", 38, 30, "res/private/bag_ui/bag_ui_mobile/sell_btn.png")
GUI:Button_setTitleFontSize(Button_sell, 10)
GUI:Button_setTitleText(Button_sell, "")
GUI:setContentSize(Button_sell, 80, 32)
GUI:setVisible(Button_sell, false)

local Image_sell = GUI:Image_Create(Button_sell, "Image_sell", 40, 14, "res/private/bag_ui/bag_ui_mobile/sell_title.png")
GUI:setAnchorPoint(Image_sell, 0.5, 0.5)
GUI:setContentSize(Image_sell, 44, 30)

local Button_refresh = GUI:Button_Create(Panel_1, "Button_refresh", 144, 28, "res/private/bag_ui/bag_ui_mobile/refresh_btn.png")
GUI:Button_setTitleFontSize(Button_refresh, 10)
GUI:Button_setTitleText(Button_refresh, "")
GUI:setContentSize(Button_refresh, 40, 38)
GUI:setVisible(Button_refresh, false)

local Panel_coins = GUI:Layout_Create(Panel_1, "Panel_coins", 196, 20, 172, 56, false)
GUI:Layout_setBackGroundColorOpacity(Panel_coins, 255)
GUI:Layout_setBackGroundImage(Panel_coins, "")

local Image_coin_bg = GUI:Image_Create(Panel_coins, "Image_coin_bg", 0, 0, "res/private/bag_ui/bag_ui_mobile/coin_bg.png")
GUI:setContentSize(Image_coin_bg, 172, 56)
GUI:setVisible(Image_coin_bg, false)

local Text_coin_num = GUI:Text_Create(Panel_coins, "Text_coin_num", 90, 26, 14, "#FFFFFF", "9999")
GUI:Text_enableOutline(Text_coin_num, "#000000", 0)
GUI:Text_setTextHorizontalAlignment(Text_coin_num, 1)
GUI:setAnchorPoint(Text_coin_num, 0.5, 0)
GUI:setContentSize(Text_coin_num, 140, 16)
GUI:setVisible(Text_coin_num, false)

 
end 
return ui