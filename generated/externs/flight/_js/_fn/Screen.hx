package flight._js._fn;

@:jsRequire("@flighthq/screen")
extern class Screen {
	@:native("createScreenInfo")
	public static function createScreenInfo():flight._js.ScreenInfo;
	@:native("createScreenMode")
	public static function createScreenMode():flight._js.ScreenMode;
	@:native("createScreenPermissionChange")
	public static function createScreenPermissionChange():flight._js.ScreenPermissionChange;
	@:native("createScreenSignals")
	public static function createScreenSignals():flight._js.ScreenSignals;
	@:native("attachScreenPermissionChange")
	public static function attachScreenPermissionChange(hostScreenPermissionChange:flight._js.HostScreenPermissionChangeCapability, permissionChange:flight._js.ScreenPermissionChange):Void;
	@:native("attachScreenSignals")
	public static function attachScreenSignals(hostScreenChange:flight._js.HostScreenChangeCapability, signals:flight._js.ScreenSignals):Void;
	@:native("detachScreenPermissionChange")
	public static function detachScreenPermissionChange(permissionChange:flight._js.ScreenPermissionChange):Void;
	@:native("detachScreenSignals")
	public static function detachScreenSignals(signals:flight._js.ScreenSignals):Void;
	@:native("dipToScreenPoint")
	public static function dipToScreenPoint(out:flight._js.Vector2, screen:flight._js.ScreenInfo, point:flight._js.Vector2):Void;
	@:native("dipToScreenRect")
	public static function dipToScreenRect(out:flight._js.Rectangle, screen:flight._js.ScreenInfo, rect:flight._js.Rectangle):Void;
	@:native("disposeScreenPermissionChange")
	public static function disposeScreenPermissionChange(permissionChange:flight._js.ScreenPermissionChange):Void;
	@:native("disposeScreenSignals")
	public static function disposeScreenSignals(signals:flight._js.ScreenSignals):Void;
	@:native("getPrimaryScreen")
	public static function getPrimaryScreen(out:flight._js.ScreenInfo, hostScreenQuery:flight._js.HostScreenQueryCapability):Void;
	@:native("getScreenBounds")
	public static function getScreenBounds(out:flight._js.Rectangle, screen:flight._js.ScreenInfo):Void;
	@:native("getScreenById")
	public static function getScreenById(out:flight._js.ScreenInfo, scratch:flight._js.ScreenQueryScratch, hostScreenQuery:flight._js.HostScreenQueryCapability, id:Float):Bool;
	@:native("getScreenContainingRect")
	public static function getScreenContainingRect(out:flight._js.ScreenInfo, scratch:flight._js.ScreenQueryScratch, hostScreenQuery:flight._js.HostScreenQueryCapability, rect:flight._js.Rectangle):Void;
	@:native("getScreenCurrentMode")
	public static function getScreenCurrentMode(out:flight._js.ScreenMode, screen:flight._js.ScreenInfo):Void;
	@:native("getScreenCursorPosition")
	public static function getScreenCursorPosition(out:flight._js.Vector2, hostScreenQuery:flight._js.HostScreenQueryCapability):Void;
	@:native("getScreenCursorScreen")
	public static function getScreenCursorScreen(out:flight._js.ScreenInfo, scratch:flight._js.ScreenQueryScratch, hostScreenQuery:flight._js.HostScreenQueryCapability):Void;
	@:native("getScreenNearestPoint")
	public static function getScreenNearestPoint(out:flight._js.ScreenInfo, scratch:flight._js.ScreenQueryScratch, hostScreenQuery:flight._js.HostScreenQueryCapability, point:flight._js.Vector2):Void;
	@:native("getScreenNearestRect")
	public static function getScreenNearestRect(out:flight._js.ScreenInfo, scratch:flight._js.ScreenQueryScratch, hostScreenQuery:flight._js.HostScreenQueryCapability, rect:flight._js.Rectangle):Void;
	@:native("getScreenWorkArea")
	public static function getScreenWorkArea(out:flight._js.Rectangle, screen:flight._js.ScreenInfo):Void;
	@:native("getScreens")
	public static function getScreens(out:Dynamic, hostScreenQuery:flight._js.HostScreenQueryCapability):Void;
	@:native("screenToDipPoint")
	public static function screenToDipPoint(out:flight._js.Vector2, screen:flight._js.ScreenInfo, point:flight._js.Vector2):Void;
	@:native("screenToDipRect")
	public static function screenToDipRect(out:flight._js.Rectangle, screen:flight._js.ScreenInfo, rect:flight._js.Rectangle):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScreenInfo(ptr:flight._js.ScreenInfo):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScreenMode(ptr:flight._js.ScreenMode):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScreenPermissionChange(ptr:flight._js.ScreenPermissionChange):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScreenSignals(ptr:flight._js.ScreenSignals):Void {}
}
