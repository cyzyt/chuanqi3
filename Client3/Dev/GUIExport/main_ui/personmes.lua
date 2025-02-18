local ui = {} 
function ui.init(parent)
local Node = GUI:Node_Create(parent, "Node", 0, 0)

local Panel_bg = GUI:Layout_Create(Node, "Panel_bg", 0, 2, 400, 100, false)
GUI:Layout_setBackGroundColorOpacity(Panel_bg, 255)
GUI:Layout_setBackGroundImage(Panel_bg, "")
GUI:setAnchorPoint(Panel_bg, 0, 1)
GUI:setTag(Panel_bg, 453)

local Panel_touch = GUI:Layout_Create(Panel_bg, "Panel_touch", 0, 98, 1136, 640, false)
GUI:Layout_setBackGroundColorOpacity(Panel_touch, 255)
GUI:Layout_setBackGroundImage(Panel_touch, "")
GUI:setAnchorPoint(Panel_touch, 0, 1)
GUI:setTag(Panel_touch, 87)
GUI:setTouchEnabled(Panel_touch, true)
GUI:setVisible(Panel_touch, false)

local Image_bg = GUI:Image_Create(Panel_bg, "Image_bg", 0, 0, "res/private/main/personmes/person_bg.png")
GUI:setContentSize(Image_bg, 308, 99)
GUI:setTag(Image_bg, 454)

local Text_name = GUI:Text_Create(Panel_bg, "Text_name", 105, 78, 16, "#FFFFFF", "")
GUI:Text_enableOutline(Text_name, "#000000", 1)
GUI:setAnchorPoint(Text_name, 0, 0.5)
GUI:setContentSize(Text_name, 0, 0)
GUI:setIgnoreContentAdaptWithSize(Text_name, true)
GUI:setTag(Text_name, 455)

local Sprite_z1 = GUI:Image_Create(Panel_bg, "Sprite_z1", 131, 59, "res/private/main/personmes/z_1.png")
GUI:setAnchorPoint(Sprite_z1, 0.5, 0.5)
GUI:setContentSize(Sprite_z1, 70, 50)
GUI:setTag(Sprite_z1, 121)
GUI:setVisible(Sprite_z1, false)

local TA_zl = GUI:TextAtlas_Create(Panel_bg, "TA_zl", 145, 39, "0", "res/private/main/personmes/tf_1.png", 19, 22, "0")
GUI:TextAtlas_setString(TA_zl, "0")
GUI:setTag(TA_zl, 457)
GUI:setVisible(TA_zl, false)

local btn_state = GUI:Layout_Create(Panel_bg, "btn_state", 90, 6, 54, 34, false)
GUI:Layout_setBackGroundColorOpacity(btn_state, 255)
GUI:Layout_setBackGroundImage(btn_state, "")
GUI:setTag(btn_state, 86)
GUI:setTouchEnabled(btn_state, true)

local Image_pk = GUI:Image_Create(btn_state, "Image_pk", 0, 0, "res/private/main/personmes/state_1.png")
GUI:setContentSize(Image_pk, 54, 34)
GUI:setTag(Image_pk, 88)

local Text_pk = GUI:Text_Create(btn_state, "Text_pk", 26, 17, 14, "#FFFFFF", "和平")
GUI:Text_enableOutline(Text_pk, "#000000", 1)
GUI:setAnchorPoint(Text_pk, 0.5, 0.5)
GUI:setContentSize(Text_pk, 28, 18)
GUI:setIgnoreContentAdaptWithSize(Text_pk, true)
GUI:setTag(Text_pk, 89)

local btn_buff = GUI:Layout_Create(Panel_bg, "btn_buff", 136, 13, 56, 24, false)
GUI:Layout_setBackGroundColorOpacity(btn_buff, 255)
GUI:Layout_setBackGroundImage(btn_buff, "")
GUI:setTag(btn_buff, 106)
GUI:setTouchEnabled(btn_buff, true)

local Image_buff = GUI:Image_Create(btn_buff, "Image_buff", 0, 0, "res/private/main/personmes/state_0.png")
GUI:setContentSize(Image_buff, 56, 24)
GUI:setTag(Image_buff, 109)

local Text_buff = GUI:Text_Create(btn_buff, "Text_buff", 30, 11, 14, "#FFFFFF", "BUFF")
GUI:Text_enableOutline(Text_buff, "#000000", 1)
GUI:setAnchorPoint(Text_buff, 0.5, 0.5)
GUI:setContentSize(Text_buff, 36, 18)
GUI:setIgnoreContentAdaptWithSize(Text_buff, true)
GUI:setTag(Text_buff, 110)

local btn_follow = GUI:Layout_Create(Panel_bg, "btn_follow", 184, 12, 74, 26, false)
GUI:Layout_setBackGroundColorOpacity(btn_follow, 255)
GUI:Layout_setBackGroundImage(btn_follow, "")
GUI:setTag(btn_follow, 81)
GUI:setTouchEnabled(btn_follow, true)

local Image_follow = GUI:Image_Create(btn_follow, "Image_follow", 37, 13, "res/private/main/personmes/follow_1.png")
GUI:setAnchorPoint(Image_follow, 0.5, 0.5)
GUI:setContentSize(Image_follow, 74, 26)
GUI:setTag(Image_follow, 82)

local Text_follow = GUI:Text_Create(btn_follow, "Text_follow", 37, 12, 12, "#FFFFFF", "主动攻击")
GUI:Text_enableOutline(Text_follow, "#000000", 1)
GUI:setAnchorPoint(Text_follow, 0.5, 0.5)
GUI:setContentSize(Text_follow, 48, 16)
GUI:setIgnoreContentAdaptWithSize(Text_follow, true)
GUI:setTag(Text_follow, 83)

local Text_level = GUI:Text_Create(Panel_bg, "Text_level", 39, -3, 16, "#FFFFFF", "")
GUI:Text_enableOutline(Text_level, "#000000", 1)
GUI:setAnchorPoint(Text_level, 0, 0.5)
GUI:setContentSize(Text_level, 0, 0)
GUI:setIgnoreContentAdaptWithSize(Text_level, true)
GUI:setTag(Text_level, 465)

local img_zs = GUI:Image_Create(Panel_bg, "img_zs", 19, 20, "res/private/main/personmes/img_zs.png")
GUI:setAnchorPoint(img_zs, 0.5, 0.5)
GUI:setContentSize(img_zs, 26, 26)
GUI:setTag(img_zs, 87)

local Text_rein = GUI:Text_Create(Panel_bg, "Text_rein", 18, 19, 16, "#FFFFFF", "")
GUI:Text_enableOutline(Text_rein, "#000000", 1)
GUI:setAnchorPoint(Text_rein, 0.5, 0.5)
GUI:setContentSize(Text_rein, 0, 0)
GUI:setIgnoreContentAdaptWithSize(Text_rein, true)
GUI:setTag(Text_rein, 77)

local Image_head = GUI:Image_Create(Panel_bg, "Image_head", 56, 52, "res/private/main/personmes/head_0_0.png")
GUI:setAnchorPoint(Image_head, 0.5, 0.5)
GUI:setContentSize(Image_head, 72, 72)
GUI:setTag(Image_head, 466)
GUI:setTouchEnabled(Image_head, true)

local img_buff_bg = GUI:Image_Create(Panel_bg, "img_buff_bg", 89, 9, "res/public/bg_buff.png")
GUI:setAnchorPoint(img_buff_bg, 0, 1)
GUI:setContentSize(img_buff_bg, 66, 41)
GUI:setTag(img_buff_bg, 102)
GUI:setVisible(img_buff_bg, false)

local Panel_po = GUI:Layout_Create(Panel_bg, "Panel_po", 91, 10, 160, 210, true)
GUI:Layout_setBackGroundColorOpacity(Panel_po, 255)
GUI:Layout_setBackGroundImage(Panel_po, "")
GUI:setAnchorPoint(Panel_po, 0, 1)
GUI:setTag(Panel_po, 495)

local Panel_di = GUI:Layout_Create(Panel_po, "Panel_di", 0, 210, 160, 200, false)
GUI:Layout_setBackGroundColor(Panel_di, "#000000")
GUI:Layout_setBackGroundColorOpacity(Panel_di, 51)
GUI:Layout_setBackGroundColorType(Panel_di, 1)
GUI:Layout_setBackGroundImage(Panel_di, "")
GUI:setTag(Panel_di, 508)

local Image_po_bg = GUI:Image_Create(Panel_di, "Image_po_bg", 0, 0, "res/private/main/assist/bg_kjtjzy_02.png")
GUI:setContentSize(Image_po_bg, 165, 34)
GUI:setTag(Image_po_bg, 497)

local ListView_po = GUI:ListView_Create(Panel_di, "ListView_po", 0, 0, 160, 200, 1)
GUI:Layout_setBackGroundColorOpacity(ListView_po, 255)
GUI:Layout_setBackGroundImage(ListView_po, "")
GUI:Layout_setClippingEnabled(ListView_po, true)
GUI:ListView_setGravity(ListView_po, 5)
GUI:setTag(ListView_po, 501)

local Panel_follow = GUI:Layout_Create(Panel_bg, "Panel_follow", 185, 13, 180, 210, true)
GUI:Layout_setBackGroundColorOpacity(Panel_follow, 255)
GUI:Layout_setBackGroundImage(Panel_follow, "")
GUI:setAnchorPoint(Panel_follow, 0, 1)
GUI:setTag(Panel_follow, 92)

local Panel_di_f = GUI:Layout_Create(Panel_follow, "Panel_di_f", 0, 210, 180, 200, false)
GUI:Layout_setBackGroundColor(Panel_di_f, "#000000")
GUI:Layout_setBackGroundColorOpacity(Panel_di_f, 51)
GUI:Layout_setBackGroundColorType(Panel_di_f, 1)
GUI:Layout_setBackGroundImage(Panel_di_f, "")
GUI:setTag(Panel_di_f, 93)

local Image_follow_bg = GUI:Image_Create(Panel_di_f, "Image_follow_bg", 0, 0, "res/private/main/assist/bg_kjtjzy_02.png")
GUI:setContentSize(Image_follow_bg, 165, 34)
GUI:setTag(Image_follow_bg, 94)

local ListView_follow = GUI:ListView_Create(Panel_di_f, "ListView_follow", 0, 0, 180, 200, 1)
GUI:Layout_setBackGroundColorOpacity(ListView_follow, 255)
GUI:Layout_setBackGroundImage(ListView_follow, "")
GUI:Layout_setClippingEnabled(ListView_follow, true)
GUI:ListView_setGravity(ListView_follow, 5)
GUI:setTag(ListView_follow, 95)

local FileNode_1 = GUI:FileNode_Create(Panel_bg, "FileNode_1", 0, 0, "main_ui/personmes", "main_ui/personmes/pk_cell", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=1,})

local FileNode_2 = GUI:FileNode_Create(Panel_bg, "FileNode_2", 0, 0, "main_ui/personmes", "main_ui/personmes/buff_cell", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=1,})

local FileNode_3 = GUI:FileNode_Create(Panel_bg, "FileNode_3", 0, 0, "main_ui/personmes", "main_ui/personmes/follow_cell", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=1,})

 
end 
return ui