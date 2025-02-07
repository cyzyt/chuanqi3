local ui = {} 
function ui.init(parent)
local Node = GUI:Node_Create(parent, "Node", 0, 0)

local Panel_1 = GUI:Layout_Create(Node, "Panel_1", 0, 0, 416, 608, false)
GUI:Layout_setBackGroundColorOpacity(Panel_1, 255)
GUI:Layout_setBackGroundImage(Panel_1, "")
GUI:setTag(Panel_1, 47)

local Image_1 = GUI:Image_Create(Panel_1, "Image_1", 0, 0, "res/private/title_layer_ui/title_bg.png")
GUI:setContentSize(Image_1, 416, 608)
GUI:setTag(Image_1, 48)

local Image_cur = GUI:Layout_Create(Panel_1, "Image_cur", 44, 477, 40, 40, false)
GUI:Layout_setBackGroundColorOpacity(Image_cur, 255)
GUI:Layout_setBackGroundImage(Image_cur, "")
GUI:setTag(Image_cur, 49)

local Button_curTitle = GUI:Button_Create(Image_cur, "Button_curTitle", 20, 20, "res/private/title_layer_ui/title_4.png")
GUI:Button_setScale9Slice(Button_curTitle, 15, 15, 10.999998092651, 10.999998092651)
GUI:Button_setTitleFontSize(Button_curTitle, 10)
GUI:Button_setTitleText(Button_curTitle, "")
GUI:setAnchorPoint(Button_curTitle, 0.5, 0.5)
GUI:setContentSize(Button_curTitle, 52, 52)
GUI:setTag(Button_curTitle, 50)

local Image_11 = GUI:Image_Create(Image_cur, "Image_11", 50, 20, "res/private/title_layer_ui/title_1.png")
GUI:setAnchorPoint(Image_11, 0, 0.5)
GUI:setContentSize(Image_11, 284, 52)
GUI:setTag(Image_11, 51)

local Text_curTitle = GUI:Text_Create(Image_11, "Text_curTitle", 10, 26, 16, "#00B300", "")
GUI:Text_enableOutline(Text_curTitle, "#000000", 0)
GUI:setAnchorPoint(Text_curTitle, 0, 0.5)
GUI:setContentSize(Text_curTitle, 0, 0)
GUI:setIgnoreContentAdaptWithSize(Text_curTitle, true)
GUI:setTag(Text_curTitle, 52)

local Image_12 = GUI:Image_Create(Panel_1, "Image_12", 208, 567, "res/private/title_layer_ui/title_0.png")
GUI:setAnchorPoint(Image_12, 0.5, 0.5)
GUI:setContentSize(Image_12, 80, 23)
GUI:setTag(Image_12, 53)

local Image_13 = GUI:Image_Create(Panel_1, "Image_13", 208, 430, "res/private/title_layer_ui/z_title.png")
GUI:setAnchorPoint(Image_13, 0.5, 0.5)
GUI:setContentSize(Image_13, 102, 22)
GUI:setTag(Image_13, 54)

local ListView_cells = GUI:ListView_Create(Panel_1, "ListView_cells", 12, 14, 392, 394, 1)
GUI:Layout_setBackGroundColorOpacity(ListView_cells, 255)
GUI:Layout_setBackGroundImage(ListView_cells, "")
GUI:Layout_setClippingEnabled(ListView_cells, true)
GUI:ListView_setGravity(ListView_cells, 5)
GUI:setTag(ListView_cells, 55)

local title_cell = GUI:FileNode_Create(Node, "title_cell", 0, 0, "player_layer/title", "player_layer/title_cell", {["bAttach"]=false,["bDrag"]=false,["bHideMain"]=false,["bSticky"]=false,["bindNpc"]=0,["exclusion"]=1,["initPos"]=1,})

 
end 
return ui