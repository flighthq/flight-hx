package flight._js._fn;

@:jsRequire("@flighthq/menu")
extern class Menu {
	@:native("cloneMenuTemplate")
	public static function cloneMenuTemplate(template:Dynamic):Dynamic;
	@:native("enableMenuSignals")
	public static function enableMenuSignals(state:flight._js.MenuSignalsState):Dynamic;
	@:native("getMenuSignals")
	public static function getMenuSignals(state:flight._js.MenuSignalsState):Null<Dynamic>;
	@:native("validateMenuItemTemplate")
	public static function validateMenuItemTemplate(template:Dynamic):Null<String>;
	@:native("createMenuHighlight")
	public static function createMenuHighlight():flight._js.MenuHighlight;
	@:native("createMenuSelect")
	public static function createMenuSelect():flight._js.MenuSelect;
	@:native("attachMenuHighlight")
	public static function attachMenuHighlight(hostMenuHighlight:flight._js.HostMenuHighlightCapability, highlight:flight._js.MenuHighlight):Void;
	@:native("attachMenuSelect")
	public static function attachMenuSelect(hostMenuSelect:flight._js.HostMenuSelectCapability, select:flight._js.MenuSelect):Void;
	@:native("detachMenuHighlight")
	public static function detachMenuHighlight(highlight:flight._js.MenuHighlight):Void;
	@:native("detachMenuSelect")
	public static function detachMenuSelect(select:flight._js.MenuSelect):Void;
	@:native("disposeMenuHighlight")
	public static function disposeMenuHighlight(highlight:flight._js.MenuHighlight):Void;
	@:native("disposeMenuSelect")
	public static function disposeMenuSelect(select:flight._js.MenuSelect):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMenuItemTemplateRef(ptr:flight._js.MenuItemTemplate):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMenuSignalsRef(ptr:flight._js.MenuSignals):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMenuHighlight(ptr:flight._js.MenuHighlight):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMenuSelect(ptr:flight._js.MenuSelect):Void {}
}
