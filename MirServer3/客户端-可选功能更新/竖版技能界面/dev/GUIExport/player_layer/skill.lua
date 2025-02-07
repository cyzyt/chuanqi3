local ui = {} 
function ui.init(parent)
local Node = GUI:Node_Create(parent, "Node", 0, 0)

local Panel_1 = GUI:Layout_Create(Node, "Panel_1", 0, 0, 412, 608, false)
GUI:Layout_setBackGroundColorOpacity(Panel_1, 255)
GUI:setTag(Panel_1, 41)

local Image_bg = GUI:Image_Create(Panel_1, "Image_bg", 0, 0, "res/custom/player_skill/img_bg.png")
GUI:setContentSize(Image_bg, 412, 608)
GUI:setTag(Image_bg, 42)

local img_title = GUI:Image_Create(Image_bg, "img_title", 206, 572, "res/custom/player_skill/img_title.png")
GUI:setAnchorPoint(img_title, 0.5, 0.5)
GUI:setContentSize(img_title, 52, 28)

local img_line = GUI:Image_Create(Image_bg, "img_line", 140, 36, "res/custom/player_skill/img_1.png")
GUI:setAnchorPoint(img_line, 0.5, 0.5)
GUI:setContentSize(img_line, 162, 52)

local ListView_sel = GUI:ListView_Create(Panel_1, "ListView_sel", 26, 510, 336, 36, 2)
GUI:Layout_setBackGroundColorOpacity(ListView_sel, 255)
GUI:Layout_setClippingEnabled(ListView_sel, true)
GUI:ListView_setGravity(ListView_sel, 5)
GUI:ListView_setItemsMargin(ListView_sel, 1)
GUI:setTag(ListView_sel, 17)

local Panel_btn = GUI:Layout_Create(Panel_1, "Panel_btn", 18, 510, 66, 36, false)
GUI:Layout_setBackGroundColorOpacity(Panel_btn, 255)
GUI:setTag(Panel_btn, 20)
GUI:setVisible(Panel_btn, false)

local Button_sel = GUI:Button_Create(Panel_btn, "Button_sel", 0, 0, "res/custom/player_skill/btn_3.png")
GUI:Button_loadTextureDisabled(Button_sel, "res/custom/player_skill/btn_3.png")
GUI:Button_loadTexturePressed(Button_sel, "res/custom/player_skill/btn_4.png")
GUI:Button_setTitleFontSize(Button_sel, 10)
GUI:Button_setTitleText(Button_sel, "")
GUI:setContentSize(Button_sel, 66, 36)
GUI:setTag(Button_sel, 21)

local btn_select = GUI:Image_Create(Panel_btn, "btn_select", 33, 18, "res/custom/player_skill/btn_select_1.png")
GUI:setAnchorPoint(btn_select, 0.5, 0.5)
GUI:setContentSize(btn_select, 64, 34)
GUI:setVisible(btn_select, false)

local Image_btn_bg = GUI:Image_Create(Panel_btn, "Image_btn_bg", 33, 36, "res/custom/player_skill/skicon1.png")
GUI:setAnchorPoint(Image_btn_bg, 0.5, 1)
GUI:setContentSize(Image_btn_bg, 25, 25)
GUI:setTag(Image_btn_bg, 22)

local Image_p_name = GUI:Image_Create(Panel_btn, "Image_p_name", 36, 19, "res/custom/player_skill/skp1.png")
GUI:setAnchorPoint(Image_p_name, 0.5, 1)
GUI:setContentSize(Image_p_name, 36, 22)

local Sv_show = GUI:ListView_Create(Panel_1, "Sv_show", 26, 80, 334, 421, 1)
GUI:Layout_setBackGroundColorOpacity(Sv_show, 255)
GUI:Layout_setClippingEnabled(Sv_show, true)
GUI:ListView_setGravity(Sv_show, 2)

local Panel_skill = GUI:Layout_Create(Panel_1, "Panel_skill", 193, 465, 328, 60, false)
GUI:Layout_setBackGroundColorOpacity(Panel_skill, 255)
GUI:setAnchorPoint(Panel_skill, 0.5, 0.5)
GUI:setTag(Panel_skill, 43)

local img_bg = GUI:Image_Create(Panel_skill, "img_bg", 0, 0, "res/custom/player_skill/img_item.png")
GUI:setContentSize(img_bg, 328, 60)

local item_select = GUI:Image_Create(img_bg, "item_select", -2, -1, "res/custom/player_skill/img_select_2.png")
GUI:setContentSize(item_select, 332, 62)
GUI:setVisible(item_select, false)

local iconA = GUI:Image_Create(Panel_skill, "iconA", 40, 31, "Default/ImageFile.png")
GUI:setAnchorPoint(iconA, 0.5, 0.5)
GUI:setContentSize(iconA, 42, 42)
GUI:setTag(iconA, 48)
GUI:setTouchEnabled(iconA, true)

local iconL = GUI:Image_Create(Panel_skill, "iconL", 40, 31, "Default/ImageFile.png")
GUI:setAnchorPoint(iconL, 0.5, 0.5)
GUI:setContentSize(iconL, 42, 42)
GUI:setTag(iconL, 44)
GUI:setVisible(iconL, false)

local Image_skill_name = GUI:Image_Create(Panel_skill, "Image_skill_name", 112, 36, "res/custom/player_skill/skill_name/142.png")
GUI:setAnchorPoint(Image_skill_name, 0.5, 0.5)
GUI:setContentSize(Image_skill_name, 86, 24)

local Text_name = GUI:Text_Create(Panel_skill, "Text_name", 108, 40, 14, "#BDBDB5", "乾坤大挪")
GUI:Text_enableOutline(Text_name, "#000000", 0)
GUI:setAnchorPoint(Text_name, 0.5, 0.5)
GUI:setContentSize(Text_name, 56, 16)
GUI:setIgnoreContentAdaptWithSize(Text_name, true)
GUI:setTag(Text_name, 45)
GUI:setVisible(Text_name, false)

local level_bg = GUI:Image_Create(Panel_skill, "level_bg", 83, 5, "res/custom/player_skill/img_tip3.png")
GUI:setContentSize(level_bg, 40, 24)

local Text_level = GUI:Text_Create(level_bg, "Text_level", 36, 4, 14, "#00FFFF", "10")
GUI:Text_enableOutline(Text_level, "#000000", 0)
GUI:setContentSize(Text_level, 16, 16)
GUI:setIgnoreContentAdaptWithSize(Text_level, true)
GUI:setTag(Text_level, 49)

local shortcut_bg = GUI:Image_Create(Panel_skill, "shortcut_bg", 276, 40, "res/custom/player_skill/btn_2.png")
GUI:setAnchorPoint(shortcut_bg, 0.5, 0.5)
GUI:setContentSize(shortcut_bg, 62, 20)

local Text_shortcut = GUI:Text_Create(shortcut_bg, "Text_shortcut", 31, 10, 12, "#FFFFFF", "快捷键")
GUI:Text_enableOutline(Text_shortcut, "#000000", 0)
GUI:setAnchorPoint(Text_shortcut, 0.5, 0.5)
GUI:setContentSize(Text_shortcut, 36, 14)
GUI:setIgnoreContentAdaptWithSize(Text_shortcut, true)
GUI:setTag(Text_shortcut, 244)
GUI:setVisible(Text_shortcut, false)

local img_tip2 = GUI:Image_Create(shortcut_bg, "img_tip2", 7, -3, "res/custom/player_skill/img_tip2.png")
GUI:setContentSize(img_tip2, 52, 24)

local exp_bg = GUI:Image_Create(Panel_skill, "exp_bg", 146, 10, "res/custom/player_skill/img_exp_bg.png")
GUI:setContentSize(exp_bg, 162, 12)

local LoadingBar_exp = GUI:LoadingBar_Create(exp_bg, "LoadingBar_exp", 1, 1, "res/custom/player_skill/img_exp.png", 0)
GUI:LoadingBar_setPercent(LoadingBar_exp, 100)
GUI:setContentSize(LoadingBar_exp, 160, 10)

local Text_exp = GUI:Text_Create(exp_bg, "Text_exp", 80, 5, 10, "#F0F0DF", "999/999")
GUI:Text_enableOutline(Text_exp, "#000000", 0)
GUI:Text_setTextHorizontalAlignment(Text_exp, 1)
GUI:Text_setTextVerticalAlignment(Text_exp, 1)
GUI:setAnchorPoint(Text_exp, 0.5, 0.5)
GUI:setContentSize(Text_exp, 100, 20)

local Text_no_level = GUI:Text_Create(Panel_skill, "Text_no_level", 108, 17, 14, "#E1E1E1", "未学习")
GUI:Text_enableOutline(Text_no_level, "#000000", 0)
GUI:Text_setTextHorizontalAlignment(Text_no_level, 1)
GUI:Text_setTextVerticalAlignment(Text_no_level, 1)
GUI:setAnchorPoint(Text_no_level, 0.5, 0.5)
GUI:setContentSize(Text_no_level, 60, 20)
GUI:setVisible(Text_no_level, false)

local Button_Set = GUI:Button_Create(Panel_1, "Button_Set", 337, 36, "res/custom/player_skill/btn_1.png")
GUI:Button_setTitleFontSize(Button_Set, 10)
GUI:Button_setTitleText(Button_Set, "")
GUI:setAnchorPoint(Button_Set, 0.5, 0.5)
GUI:setContentSize(Button_Set, 104, 34)
GUI:setTag(Button_Set, 21)

local img_set = GUI:Image_Create(Button_Set, "img_set", 52, 14, "res/custom/player_skill/img_tip1.png")
GUI:setAnchorPoint(img_set, 0.5, 0.5)
GUI:setContentSize(img_set, 76, 22)

local Slider_1 = GUI:Slider_Create(Panel_1, "Slider_1", 389, 529, "", "", "res/custom/player_skill/slider_icon.png")
GUI:setAnchorPoint(Slider_1, 0, 0.5)
GUI:setContentSize(Slider_1, 442, 14)
GUI:setRotation(Slider_1, 90)
GUI:setRotationSkewX(Slider_1, 90)
GUI:setRotationSkewY(Slider_1, 90)
GUI:setTouchEnabled(Slider_1, true)

 
end 
return ui