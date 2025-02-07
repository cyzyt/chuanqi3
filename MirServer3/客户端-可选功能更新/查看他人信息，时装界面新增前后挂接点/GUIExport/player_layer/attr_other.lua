local ui = {}
function ui.init(parent)
	-- Create Node
	local Node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
	GUI:setTag(Node, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node, "Panel_1", 0.00, 0.00, 238.00, 608.00, false)
	GUI:setTouchEnabled(Panel_1, false)
	GUI:setTag(Panel_1, 41)

	-- Create Image_bg
	local Image_bg = GUI:Image_Create(Panel_1, "Image_bg", 0.00, 0.00, "res/private/player_main_layer_ui/player_main_layer_ui_mobile/bg_attr.png")
	GUI:setTouchEnabled(Image_bg, false)
	GUI:setTag(Image_bg, 42)

	-- Create ListView_attr
	local ListView_attr = GUI:ListView_Create(Panel_1, "ListView_attr", 4.00, 538.00, 220.00, 520.00, 1)
	GUI:ListView_setGravity(ListView_attr, 5)
	GUI:setAnchorPoint(ListView_attr, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_attr, true)
	GUI:setTag(ListView_attr, 17)

	-- Create Image_title
	local Image_title = GUI:Image_Create(Panel_1, "Image_title", 100.00, 556.00, "res/private/player_main_layer_ui/player_main_layer_ui_mobile/attr_title.png")
	GUI:setAnchorPoint(Image_title, 0.50, 0.00)
	GUI:setTouchEnabled(Image_title, false)
	GUI:setTag(Image_title, -1)

	-- Create Button_close
	local Button_close = GUI:Button_Create(Panel_1, "Button_close", 192.00, 564.00, "res/private/player_main_layer_ui/player_main_layer_ui_mobile/attr_close.png")
	GUI:Button_setTitleText(Button_close, "")
	GUI:Button_setTitleColor(Button_close, "#ffffff")
	GUI:Button_setTitleFontSize(Button_close, 14)
	GUI:Button_titleEnableOutline(Button_close, "#000000", 0)
	GUI:setTouchEnabled(Button_close, true)
	GUI:setTag(Button_close, -1)
end
return ui