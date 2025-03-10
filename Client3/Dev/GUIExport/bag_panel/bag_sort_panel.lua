local ui = {} 
function ui.init(parent)
local Scene = GUI:Node_Create(parent, "Scene", 0, 0)

local Panel_1 = GUI:Layout_Create(Scene, "Panel_1", 0, 0, 492, 604, false)
GUI:Layout_setBackGroundColorOpacity(Panel_1, 255)
GUI:Layout_setBackGroundImage(Panel_1, "")
GUI:setAnchorPoint(Panel_1, 0.5, 0.5)
GUI:setTag(Panel_1, 2)

local Image_bg = GUI:Image_Create(Panel_1, "Image_bg", 0, 0, "res/private/bag_ui/bag_ui_sort/bg_1.png")
GUI:setContentSize(Image_bg, 492, 604)
GUI:setTag(Image_bg, 3)

local Panel_notouch = GUI:Layout_Create(Image_bg, "Panel_notouch", 14, 15, 464, 538, false)
GUI:Layout_setBackGroundColorOpacity(Panel_notouch, 255)
GUI:Layout_setBackGroundImage(Panel_notouch, "")
GUI:setTag(Panel_notouch, 35)
GUI:setTouchEnabled(Panel_notouch, true)

local Image_title = GUI:Image_Create(Panel_1, "Image_title", 244, 558, "res/private/bag_ui/bag_ui_sort/title_1.png")
GUI:setAnchorPoint(Image_title, 0.5, 0)
GUI:setContentSize(Image_title, 52, 30)

local Button_close = GUI:Button_Create(Panel_1, "Button_close", 464, 580, "res/public/btn_sifud_01.png")
GUI:Button_setTitleColor(Button_close, "#414146")
GUI:Button_setTitleFontSize(Button_close, 10)
GUI:Button_setTitleText(Button_close, "")
GUI:setAnchorPoint(Button_close, 0.5, 0.5)
GUI:setContentSize(Button_close, 34, 34)
GUI:setTag(Button_close, 8)

local Sv_items = GUI:ScrollView_Create(Panel_1, "Sv_items", 14, 102, 336, 448, 1)
GUI:Layout_setBackGroundColorOpacity(Sv_items, 255)
GUI:Layout_setBackGroundImage(Sv_items, "")
GUI:Layout_setClippingEnabled(Sv_items, true)
GUI:ScrollView_setInnerContainerSize(Sv_items, 419, 448)
GUI:setTag(Sv_items, 41)
GUI:setTouchEnabled(Sv_items, true)

local Panel_bg = GUI:Layout_Create(Sv_items, "Panel_bg", 0, 448, 336, 448, false)
GUI:Layout_setBackGroundColorOpacity(Panel_bg, 255)
GUI:Layout_setBackGroundImage(Panel_bg, "")
GUI:setAnchorPoint(Panel_bg, 0, 1)
GUI:setTag(Panel_bg, 74)

local Panel_items = GUI:Layout_Create(Sv_items, "Panel_items", 0, 448, 336, 448, false)
GUI:Layout_setBackGroundColorOpacity(Panel_items, 255)
GUI:Layout_setBackGroundImage(Panel_items, "")
GUI:setAnchorPoint(Panel_items, 0, 1)
GUI:setTag(Panel_items, 4)
GUI:setTouchEnabled(Panel_items, true)

local Panel_addItems = GUI:Layout_Create(Sv_items, "Panel_addItems", 0, 448, 336, 448, false)
GUI:Layout_setBackGroundColorOpacity(Panel_addItems, 255)
GUI:Layout_setBackGroundImage(Panel_addItems, "")
GUI:setAnchorPoint(Panel_addItems, 0, 1)

local scrollBarLayout = GUI:Layout_Create(Panel_1, "scrollBarLayout", 352, 102, 16, 448, false)
GUI:Layout_setBackGroundColorOpacity(scrollBarLayout, 255)
GUI:Layout_setBackGroundImage(scrollBarLayout, "")

local Node_weight = GUI:Node_Create(Panel_1, "Node_weight", 374, 234)
GUI:setTag(Node_weight, 27)

local Image_weight_bg = GUI:Image_Create(Node_weight, "Image_weight_bg", 0, 0, "res/private/bag_ui/bag_ui_sort/weight_bg.png")
GUI:setContentSize(Image_weight_bg, 106, 50)

local Image_weight_title = GUI:Image_Create(Node_weight, "Image_weight_title", 54, 18, "res/private/bag_ui/bag_ui_sort/weight_title.png")
GUI:setAnchorPoint(Image_weight_title, 0.5, 0)
GUI:setContentSize(Image_weight_title, 74, 26)

local Text_weight_num = GUI:Text_Create(Node_weight, "Text_weight_num", 54, 12, 13, "#FFFBF0", "0/0")
GUI:Text_enableOutline(Text_weight_num, "#000000", 0)
GUI:Text_setTextHorizontalAlignment(Text_weight_num, 1)
GUI:Text_setTextVerticalAlignment(Text_weight_num, 1)
GUI:setAnchorPoint(Text_weight_num, 0.5, 0.5)
GUI:setContentSize(Text_weight_num, 20, 14)
GUI:setIgnoreContentAdaptWithSize(Text_weight_num, true)
GUI:setTag(Text_weight_num, 29)

local Panel_sel = GUI:Layout_Create(Panel_1, "Panel_sel", 378, 550, 100, 532, false)
GUI:Layout_setBackGroundColorOpacity(Panel_sel, 255)
GUI:Layout_setBackGroundImage(Panel_sel, "")
GUI:setAnchorPoint(Panel_sel, 0, 1)
GUI:setTag(Panel_sel, 45)

local btn_sel_0 = GUI:Button_Create(Panel_sel, "btn_sel_0", 48, 512, "res/private/bag_ui/bag_ui_sort/btn_1.png")
GUI:Button_loadTextureDisabled(btn_sel_0, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_loadTexturePressed(btn_sel_0, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_setTitleColor(btn_sel_0, "#414146")
GUI:Button_setTitleFontSize(btn_sel_0, 10)
GUI:Button_setTitleText(btn_sel_0, "")
GUI:setAnchorPoint(btn_sel_0, 0.5, 0.5)
GUI:setContentSize(btn_sel_0, 80, 32)
GUI:setTag(btn_sel_0, 42)

local Image_type = GUI:Image_Create(btn_sel_0, "Image_type", 40, 16, "res/private/bag_ui/bag_ui_sort/title_0_0.png")
GUI:setAnchorPoint(Image_type, 0.5, 0.5)
GUI:setContentSize(Image_type, 46, 28)

local btn_sel_1 = GUI:Button_Create(Panel_sel, "btn_sel_1", 48, 472, "res/private/bag_ui/bag_ui_sort/btn_1.png")
GUI:Button_loadTextureDisabled(btn_sel_1, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_loadTexturePressed(btn_sel_1, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_setTitleColor(btn_sel_1, "#414146")
GUI:Button_setTitleFontSize(btn_sel_1, 10)
GUI:Button_setTitleText(btn_sel_1, "")
GUI:setAnchorPoint(btn_sel_1, 0.5, 0.5)
GUI:setContentSize(btn_sel_1, 80, 32)
GUI:setTag(btn_sel_1, 47)

Image_type = GUI:Image_Create(btn_sel_1, "Image_type", 40, 16, "res/private/bag_ui/bag_ui_sort/title_1_0.png")
GUI:setAnchorPoint(Image_type, 0.5, 0.5)
GUI:setContentSize(Image_type, 46, 30)

local btn_sel_2 = GUI:Button_Create(Panel_sel, "btn_sel_2", 48, 432, "res/private/bag_ui/bag_ui_sort/btn_1.png")
GUI:Button_loadTextureDisabled(btn_sel_2, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_loadTexturePressed(btn_sel_2, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_setTitleColor(btn_sel_2, "#414146")
GUI:Button_setTitleFontSize(btn_sel_2, 10)
GUI:Button_setTitleText(btn_sel_2, "")
GUI:setAnchorPoint(btn_sel_2, 0.5, 0.5)
GUI:setContentSize(btn_sel_2, 80, 32)
GUI:setTag(btn_sel_2, 52)

Image_type = GUI:Image_Create(btn_sel_2, "Image_type", 40, 16, "res/private/bag_ui/bag_ui_sort/title_2_0.png")
GUI:setAnchorPoint(Image_type, 0.5, 0.5)
GUI:setContentSize(Image_type, 44, 28)

local btn_sel_3 = GUI:Button_Create(Panel_sel, "btn_sel_3", 48, 392, "res/private/bag_ui/bag_ui_sort/btn_1.png")
GUI:Button_loadTextureDisabled(btn_sel_3, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_loadTexturePressed(btn_sel_3, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_setTitleColor(btn_sel_3, "#414146")
GUI:Button_setTitleFontSize(btn_sel_3, 10)
GUI:Button_setTitleText(btn_sel_3, "")
GUI:setAnchorPoint(btn_sel_3, 0.5, 0.5)
GUI:setContentSize(btn_sel_3, 80, 32)
GUI:setTag(btn_sel_3, 54)

Image_type = GUI:Image_Create(btn_sel_3, "Image_type", 40, 16, "res/private/bag_ui/bag_ui_sort/title_3_0.png")
GUI:setAnchorPoint(Image_type, 0.5, 0.5)
GUI:setContentSize(Image_type, 46, 28)

local btn_sel_4 = GUI:Button_Create(Panel_sel, "btn_sel_4", 48, 352, "res/private/bag_ui/bag_ui_sort/btn_1.png")
GUI:Button_loadTextureDisabled(btn_sel_4, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_loadTexturePressed(btn_sel_4, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_setTitleColor(btn_sel_4, "#414146")
GUI:Button_setTitleFontSize(btn_sel_4, 10)
GUI:Button_setTitleText(btn_sel_4, "")
GUI:setAnchorPoint(btn_sel_4, 0.5, 0.5)
GUI:setContentSize(btn_sel_4, 80, 32)
GUI:setTag(btn_sel_4, 56)

Image_type = GUI:Image_Create(btn_sel_4, "Image_type", 40, 16, "res/private/bag_ui/bag_ui_sort/title_4_0.png")
GUI:setAnchorPoint(Image_type, 0.5, 0.5)
GUI:setContentSize(Image_type, 46, 28)

local btn_sel_5 = GUI:Button_Create(Panel_sel, "btn_sel_5", 48, 312, "res/private/bag_ui/bag_ui_sort/btn_1.png")
GUI:Button_loadTextureDisabled(btn_sel_5, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_loadTexturePressed(btn_sel_5, "res/private/bag_ui/bag_ui_sort/btn_2.png")
GUI:Button_setTitleColor(btn_sel_5, "#414146")
GUI:Button_setTitleFontSize(btn_sel_5, 10)
GUI:Button_setTitleText(btn_sel_5, "")
GUI:setAnchorPoint(btn_sel_5, 0.5, 0.5)
GUI:setContentSize(btn_sel_5, 80, 32)
GUI:setTag(btn_sel_5, 58)

Image_type = GUI:Image_Create(btn_sel_5, "Image_type", 40, 16, "res/private/bag_ui/bag_ui_sort/title_5_0.png")
GUI:setAnchorPoint(Image_type, 0.5, 0.5)
GUI:setContentSize(Image_type, 44, 28)

local Button_sell = GUI:Button_Create(Panel_1, "Button_sell", 38, 30, "res/private/bag_ui/bag_ui_mobile/sell_btn.png")
GUI:Button_setTitleFontSize(Button_sell, 10)
GUI:Button_setTitleText(Button_sell, "")
GUI:setContentSize(Button_sell, 80, 32)
GUI:setVisible(Button_sell, false)

local Image_sell = GUI:Image_Create(Button_sell, "Image_sell", 40, 14, "res/private/bag_ui/bag_ui_mobile/sell_title.png")
GUI:setAnchorPoint(Image_sell, 0.5, 0.5)
GUI:setContentSize(Image_sell, 44, 30)

local Button_refresh = GUI:Button_Create(Panel_1, "Button_refresh", 142, 28, "res/private/bag_ui/bag_ui_mobile/refresh_btn.png")
GUI:Button_setTitleFontSize(Button_refresh, 10)
GUI:Button_setTitleText(Button_refresh, "")
GUI:setContentSize(Button_refresh, 40, 38)
GUI:setVisible(Button_refresh, false)

local Panel_coins = GUI:Layout_Create(Panel_1, "Panel_coins", 194, 20, 172, 56, false)
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