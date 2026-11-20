package flight._hl._fn;

extern class Menu {
	@:hlNative("flight", "flight_clone_menu_template")
	public static function cloneMenuTemplate(template:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_enable_menu_signals")
	public static function enableMenuSignals(state:flight._hl.MenuSignalsState):hl.Bytes;
	@:hlNative("flight", "flight_get_menu_signals")
	public static function getMenuSignals(state:flight._hl.MenuSignalsState):hl.Bytes;
	@:hlNative("flight", "flight_validate_menu_item_template")
	public static function validateMenuItemTemplate(template:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_create_menu_highlight")
	public static function createMenuHighlight():flight._hl.MenuHighlight;
	@:hlNative("flight", "flight_create_menu_select")
	public static function createMenuSelect():flight._hl.MenuSelect;
	@:hlNative("flight", "flight_attach_menu_highlight")
	public static function attachMenuHighlight(hostMenuHighlight:flight._hl.HostMenuHighlightCapability, highlight:flight._hl.MenuHighlight):Void;
	@:hlNative("flight", "flight_attach_menu_select")
	public static function attachMenuSelect(hostMenuSelect:flight._hl.HostMenuSelectCapability, select:flight._hl.MenuSelect):Void;
	@:hlNative("flight", "flight_detach_menu_highlight")
	public static function detachMenuHighlight(highlight:flight._hl.MenuHighlight):Void;
	@:hlNative("flight", "flight_detach_menu_select")
	public static function detachMenuSelect(select:flight._hl.MenuSelect):Void;
	@:hlNative("flight", "flight_dispose_menu_highlight")
	public static function disposeMenuHighlight(highlight:flight._hl.MenuHighlight):Void;
	@:hlNative("flight", "flight_dispose_menu_select")
	public static function disposeMenuSelect(select:flight._hl.MenuSelect):Void;
	@:hlNative("flight", "flight_free_menu_item_template_ref")
	public static function freeMenuItemTemplateRef(ptr:flight._hl.MenuItemTemplate):Void;
	@:hlNative("flight", "flight_free_menu_signals_ref")
	public static function freeMenuSignalsRef(ptr:flight._hl.MenuSignals):Void;
	@:hlNative("flight", "flight_free_menu_highlight")
	public static function freeMenuHighlight(ptr:flight._hl.MenuHighlight):Void;
	@:hlNative("flight", "flight_free_menu_select")
	public static function freeMenuSelect(ptr:flight._hl.MenuSelect):Void;
}
