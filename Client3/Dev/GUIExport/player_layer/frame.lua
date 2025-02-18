local ui = {} 
function ui.init(parent)
local Layer = GUI:Layout_Create(parent, "Layer", 0, 0, 452, 612, false)
GUI:Layout_setBackGroundColorOpacity(Layer, 255)
GUI:Layout_setBackGroundImage(Layer, "")
GUI:setAnchorPoint(Layer, 0.5, 0.5)

local Layout_1 = GUI:Layout_Create(Layer, "Layout_1", 0, 0, 40, 600, false)
GUI:Layout_setBackGroundColorOpacity(Layout_1, 255)
GUI:Layout_setBackGroundImage(Layout_1, "")

local Button_equip = GUI:Button_Create(Layout_1, "Button_equip", 40, 540, "res/public/1900000641.png")
GUI:Button_loadTextureDisabled(Button_equip, "res/public/1900000640.png")
GUI:Button_loadTexturePressed(Button_equip, "res/public/1900000640.png")
GUI:Button_setTitleFontSize(Button_equip, 16)
GUI:Button_setTitleText(Button_equip, "")
GUI:setAnchorPoint(Button_equip, 1, 0.5)
GUI:setContentSize(Button_equip, 36, 80)

local Text_1 = GUI:Text_Create(Button_equip, "Text_1", 12, 19, 18, "#FFFFFF", "装\n备")
GUI:Text_enableOutline(Text_1, "#000000", 0)
GUI:setContentSize(Text_1, 24, 40)

local Button_skill = GUI:Button_Create(Layout_1, "Button_skill", 40, 457, "res/public/1900000641.png")
GUI:Button_loadTextureDisabled(Button_skill, "res/public/1900000640.png")
GUI:Button_loadTexturePressed(Button_skill, "res/public/1900000640.png")
GUI:Button_setTitleFontSize(Button_skill, 16)
GUI:Button_setTitleText(Button_skill, "")
GUI:setAnchorPoint(Button_skill, 1, 0.5)
GUI:setContentSize(Button_skill, 36, 80)

Text_1 = GUI:Text_Create(Button_skill, "Text_1", 12, 19, 18, "#FFFFFF", "技\n能")
GUI:Text_enableOutline(Text_1, "#000000", 0)
GUI:setContentSize(Text_1, 24, 40)

local Button_god_equip = GUI:Button_Create(Layout_1, "Button_god_equip", 40, 374, "res/public/1900000641.png")
GUI:Button_loadTextureDisabled(Button_god_equip, "res/public/1900000640.png")
GUI:Button_loadTexturePressed(Button_god_equip, "res/public/1900000640.png")
GUI:Button_setTitleFontSize(Button_god_equip, 16)
GUI:Button_setTitleText(Button_god_equip, "")
GUI:setAnchorPoint(Button_god_equip, 1, 0.5)
GUI:setContentSize(Button_god_equip, 36, 80)

Text_1 = GUI:Text_Create(Button_god_equip, "Text_1", 12, 19, 18, "#FFFFFF", "兽魂")
GUI:Text_enableOutline(Text_1, "#000000", 0)
GUI:setContentSize(Text_1, 24, 40)

local Button_super_equip = GUI:Button_Create(Layout_1, "Button_super_equip", 40, 293, "res/public/1900000641.png")
GUI:Button_loadTextureDisabled(Button_super_equip, "res/public/1900000640.png")
GUI:Button_loadTexturePressed(Button_super_equip, "res/public/1900000640.png")
GUI:Button_setTitleFontSize(Button_super_equip, 16)
GUI:Button_setTitleText(Button_super_equip, "")
GUI:setAnchorPoint(Button_super_equip, 1, 0.5)
GUI:setContentSize(Button_super_equip, 36, 80)

Text_1 = GUI:Text_Create(Button_super_equip, "Text_1", 12, 19, 18, "#FFFFFF", "神器")
GUI:Text_enableOutline(Text_1, "#000000", 0)
GUI:setContentSize(Text_1, 24, 40)

local Button_title = GUI:Button_Create(Layout_1, "Button_title", 40, 210, "res/public/1900000641.png")
GUI:Button_loadTextureDisabled(Button_title, "res/public/1900000640.png")
GUI:Button_loadTexturePressed(Button_title, "res/public/1900000640.png")
GUI:Button_setTitleFontSize(Button_title, 16)
GUI:Button_setTitleText(Button_title, "")
GUI:setAnchorPoint(Button_title, 1, 0.5)
GUI:setContentSize(Button_title, 36, 80)

Text_1 = GUI:Text_Create(Button_title, "Text_1", 12, 19, 18, "#FFFFFF", "称号")
GUI:Text_enableOutline(Text_1, "#000000", 0)
GUI:setContentSize(Text_1, 24, 40)

local player_layer_equip = GUI:FileNode_Create(Layout_1, "player_layer_equip", 36, 0, "player_layer/frame", "player_layer/equip", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=true,["bindNpc"]=0,["exclusion"]=3,["initPos"]=1,})

local player_layer_skill = GUI:FileNode_Create(Layout_1, "player_layer_skill", 36, 0, "player_layer/frame", "player_layer/skill", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=true,["bindNpc"]=0,["exclusion"]=3,["initPos"]=1,})

local player_layer_god_equip = GUI:FileNode_Create(Layout_1, "player_layer_god_equip", 36, 0, "player_layer/frame", "player_layer/god_equip", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=true,["bindNpc"]=0,["exclusion"]=3,["initPos"]=1,})

local player_layer_super_equip = GUI:FileNode_Create(Layout_1, "player_layer_super_equip", 36, 0, "player_layer/frame", "player_layer/super_equip", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=true,["bindNpc"]=0,["exclusion"]=3,["initPos"]=1,})

local player_layer_title = GUI:FileNode_Create(Layout_1, "player_layer_title", 36, 0, "player_layer/frame", "player_layer/title", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=true,["bindNpc"]=0,["exclusion"]=3,["initPos"]=1,})

local Button_close = GUI:Button_Create(Layout_1, "Button_close", 405, 563, "res/public/001425.png")
GUI:Button_loadTexturePressed(Button_close, "res/public/001426.png")
GUI:Button_setTitleFontSize(Button_close, 10)
GUI:Button_setTitleText(Button_close, "")
GUI:setContentSize(Button_close, 32, 30)

 
end 
return ui