package flight._cpp._fn;

extern class Menu {
	@:native("flight_clone_menu_template")
	public static function cloneMenuTemplate(template:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_enable_menu_signals")
	public static function enableMenuSignals(state:flight._cpp.MenuSignalsState):cpp.Star<cpp.Void>;
	@:native("flight_get_menu_signals")
	public static function getMenuSignals(state:flight._cpp.MenuSignalsState):cpp.Star<cpp.Void>;
	@:native("flight_validate_menu_item_template")
	public static function validateMenuItemTemplate(template:cpp.Star<cpp.Void>):cpp.ConstCharStar;
	@:native("flight_create_menu_highlight")
	public static function createMenuHighlight():flight._cpp.MenuHighlight;
	@:native("flight_create_menu_select")
	public static function createMenuSelect():flight._cpp.MenuSelect;
	@:native("flight_attach_menu_highlight")
	public static function attachMenuHighlight(hostMenuHighlight:flight._cpp.HostMenuHighlightCapability, highlight:flight._cpp.MenuHighlight):Void;
	@:native("flight_attach_menu_select")
	public static function attachMenuSelect(hostMenuSelect:flight._cpp.HostMenuSelectCapability, select:flight._cpp.MenuSelect):Void;
	@:native("flight_detach_menu_highlight")
	public static function detachMenuHighlight(highlight:flight._cpp.MenuHighlight):Void;
	@:native("flight_detach_menu_select")
	public static function detachMenuSelect(select:flight._cpp.MenuSelect):Void;
	@:native("flight_dispose_menu_highlight")
	public static function disposeMenuHighlight(highlight:flight._cpp.MenuHighlight):Void;
	@:native("flight_dispose_menu_select")
	public static function disposeMenuSelect(select:flight._cpp.MenuSelect):Void;
	@:native("flight_free_menu_item_template_ref")
	public static function freeMenuItemTemplateRef(ptr:flight._cpp.MenuItemTemplate):Void;
	@:native("flight_free_menu_signals_ref")
	public static function freeMenuSignalsRef(ptr:flight._cpp.MenuSignals):Void;
	@:native("flight_free_menu_highlight")
	public static function freeMenuHighlight(ptr:flight._cpp.MenuHighlight):Void;
	@:native("flight_free_menu_select")
	public static function freeMenuSelect(ptr:flight._cpp.MenuSelect):Void;
}
