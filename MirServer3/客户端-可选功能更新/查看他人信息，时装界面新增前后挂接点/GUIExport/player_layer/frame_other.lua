local ui = {} 
function ui.init(parent)
local Layer = GUI:Layout_Create(parent, "Layer", 0, 0, 452, 612, false)
GUI:Layout_setBackGroundColorOpacity(Layer, 255)
GUI:Layout_setBackGroundImage(Layer, "")
GUI:setAnchorPoint(Layer, 0.5, 0.5)

local Layout_1 = GUI:Layout_Create(Layer, "Layout_1", 0, 0, 40, 600, false)
GUI:Layout_setBackGroundColorOpacity(Layout_1, 255)
GUI:Layout_setBackGroundImage(Layout_1, "")

local Button_equip_other = GUI:Button_Create(Layout_1, "Button_equip_other", 40, 540, "res/public/1900000641.png")
GUI:Button_loadTextureDisabled(Button_equip_other, "res/public/1900000640.png")
GUI:Button_loadTexturePressed(Button_equip_other, "res/public/1900000640.png")
GUI:Button_setTitleFontSize(Button_equip_other, 16)
GUI:Button_setTitleText(Button_equip_other, "")
GUI:setAnchorPoint(Button_equip_other, 1, 0.5)
GUI:setContentSize(Button_equip_other, 36, 80)

local Text_1 = GUI:Text_Create(Button_equip_other, "Text_1", 12, 19, 18, "#FFFFFF", "装\n备")
GUI:Text_enableOutline(Text_1, "#000000", 0)
GUI:setContentSize(Text_1, 24, 40)

local Button_title_other = GUI:Button_Create(Layout_1, "Button_title_other", 40, 455, "res/public/1900000641.png")
GUI:Button_loadTextureDisabled(Button_title_other, "res/public/1900000640.png")
GUI:Button_loadTexturePressed(Button_title_other, "res/public/1900000640.png")
GUI:Button_setTitleFontSize(Button_title_other, 16)
GUI:Button_setTitleText(Button_title_other, "")
GUI:setAnchorPoint(Button_title_other, 1, 0.5)
GUI:setContentSize(Button_title_other, 36, 80)

Text_1 = GUI:Text_Create(Button_title_other, "Text_1", 12, 19, 18, "#FFFFFF", "称号")
GUI:Text_enableOutline(Text_1, "#000000", 0)
GUI:setContentSize(Text_1, 24, 40)

local Button_super_equip_other = GUI:Button_Create(Layout_1, "Button_super_equip_other", 40, 370, "res/public/1900000641.png")
GUI:Button_loadTextureDisabled(Button_super_equip_other, "res/public/1900000640.png")
GUI:Button_loadTexturePressed(Button_super_equip_other, "res/public/1900000640.png")
GUI:Button_setTitleFontSize(Button_super_equip_other, 16)
GUI:Button_setTitleText(Button_super_equip_other, "")
GUI:setAnchorPoint(Button_super_equip_other, 1, 0.5)
GUI:setContentSize(Button_super_equip_other, 36, 80)

Text_1 = GUI:Text_Create(Button_super_equip_other, "Text_1", 12, 19, 18, "#FFFFFF", "时装")
GUI:Text_enableOutline(Text_1, "#000000", 0)
GUI:setContentSize(Text_1, 24, 40)

local FileNode_1 = GUI:FileNode_Create(Layout_1, "FileNode_1", 38, 0, "player_layer/frame_other", "player_layer/equip_other", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=true,["bindNpc"]=0,["exclusion"]=3,["initPos"]=1,})

local FileNode_3 = GUI:FileNode_Create(Layout_1, "FileNode_3", 38, 0, "player_layer/frame_other", "player_layer/title_other", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=true,["bindNpc"]=0,["exclusion"]=3,["initPos"]=1,})

local FileNode_2 = GUI:FileNode_Create(Layout_1, "FileNode_2", 38, 0, "player_layer/frame_other", "player_layer/super_equip_other", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=true,["bindNpc"]=0,["exclusion"]=3,["initPos"]=1,})

local Button_close = GUI:Button_Create(Layout_1, "Button_close", 404, 557, "res/public/btn_sifud_01.png")
GUI:Button_setTitleFontSize(Button_close, 10)
GUI:Button_setTitleText(Button_close, "")
GUI:setContentSize(Button_close, 34, 34)

 
end 
return ui