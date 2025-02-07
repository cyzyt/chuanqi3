local ui = {}
function ui.init(parent)
	-- Create Panel_title_cell
	local Panel_title_cell = GUI:Layout_Create(parent, "Panel_title_cell", 0.00, 0.00, 392.00, 60.00, false)
	GUI:setTouchEnabled(Panel_title_cell, true)
	GUI:setTag(Panel_title_cell, 14)

	-- Create Image_bg
	local Image_bg = GUI:Layout_Create(Panel_title_cell, "Image_bg", 40.00, 6.00, 40.00, 40.00, false)
	GUI:setTouchEnabled(Image_bg, false)
	GUI:setTag(Image_bg, 25)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Image_bg, "Image_3", 44.00, 20.00, "res/private/title_layer_ui/title_1.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.50)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 26)

	-- Create Button_icon
	local Button_icon = GUI:Button_Create(Image_bg, "Button_icon", 14.00, 20.00, "res/private/title_layer_ui/title_4.png")
	GUI:Button_setScale9Slice(Button_icon, 15, 15, 11, 11)
	GUI:setContentSize(Button_icon, 52, 52)
	GUI:setIgnoreContentAdaptWithSize(Button_icon, false)
	GUI:Button_setTitleText(Button_icon, "")
	GUI:Button_setTitleColor(Button_icon, "#414146")
	GUI:Button_setTitleFontSize(Button_icon, 14)
	GUI:Button_titleDisableOutLine(Button_icon)
	GUI:setAnchorPoint(Button_icon, 0.50, 0.50)
	GUI:setTouchEnabled(Button_icon, true)
	GUI:setTag(Button_icon, 19)

	-- Create Text_name
	local Text_name = GUI:Text_Create(Image_bg, "Text_name", 54.00, 20.00, 16, "#00b300", "Text Label")
	GUI:setAnchorPoint(Text_name, 0.00, 0.50)
	GUI:setTouchEnabled(Text_name, false)
	GUI:setTag(Text_name, 39)
	GUI:Text_enableOutline(Text_name, "#111111", 1)
end
return ui