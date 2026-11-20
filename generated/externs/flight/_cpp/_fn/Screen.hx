package flight._cpp._fn;

extern class Screen {
	@:native("flight_create_screen_info")
	public static function createScreenInfo():flight._cpp.ScreenInfo;
	@:native("flight_create_screen_mode")
	public static function createScreenMode():flight._cpp.ScreenMode;
	@:native("flight_create_screen_permission_change")
	public static function createScreenPermissionChange():flight._cpp.ScreenPermissionChange;
	@:native("flight_create_screen_signals")
	public static function createScreenSignals():flight._cpp.ScreenSignals;
	@:native("flight_attach_screen_permission_change")
	public static function attachScreenPermissionChange(hostScreenPermissionChange:flight._cpp.HostScreenPermissionChangeCapability, permissionChange:flight._cpp.ScreenPermissionChange):Void;
	@:native("flight_attach_screen_signals")
	public static function attachScreenSignals(hostScreenChange:flight._cpp.HostScreenChangeCapability, signals:flight._cpp.ScreenSignals):Void;
	@:native("flight_detach_screen_permission_change")
	public static function detachScreenPermissionChange(permissionChange:flight._cpp.ScreenPermissionChange):Void;
	@:native("flight_detach_screen_signals")
	public static function detachScreenSignals(signals:flight._cpp.ScreenSignals):Void;
	@:native("flight_dip_to_screen_point")
	public static function dipToScreenPoint(out:flight._cpp.Vector2, screen:flight._cpp.ScreenInfo, point:flight._cpp.Vector2):Void;
	@:native("flight_dip_to_screen_rect")
	public static function dipToScreenRect(out:flight._cpp.Rectangle, screen:flight._cpp.ScreenInfo, rect:flight._cpp.Rectangle):Void;
	@:native("flight_dispose_screen_permission_change")
	public static function disposeScreenPermissionChange(permissionChange:flight._cpp.ScreenPermissionChange):Void;
	@:native("flight_dispose_screen_signals")
	public static function disposeScreenSignals(signals:flight._cpp.ScreenSignals):Void;
	@:native("flight_get_primary_screen")
	public static function getPrimaryScreen(out:flight._cpp.ScreenInfo, hostScreenQuery:flight._cpp.HostScreenQueryCapability):Void;
	@:native("flight_get_screen_bounds")
	public static function getScreenBounds(out:flight._cpp.Rectangle, screen:flight._cpp.ScreenInfo):Void;
	@:native("flight_get_screen_by_id")
	public static function getScreenById(out:flight._cpp.ScreenInfo, scratch:flight._cpp.ScreenQueryScratch, hostScreenQuery:flight._cpp.HostScreenQueryCapability, id:Float):Bool;
	@:native("flight_get_screen_containing_rect")
	public static function getScreenContainingRect(out:flight._cpp.ScreenInfo, scratch:flight._cpp.ScreenQueryScratch, hostScreenQuery:flight._cpp.HostScreenQueryCapability, rect:flight._cpp.Rectangle):Void;
	@:native("flight_get_screen_current_mode")
	public static function getScreenCurrentMode(out:flight._cpp.ScreenMode, screen:flight._cpp.ScreenInfo):Void;
	@:native("flight_get_screen_cursor_position")
	public static function getScreenCursorPosition(out:flight._cpp.Vector2, hostScreenQuery:flight._cpp.HostScreenQueryCapability):Void;
	@:native("flight_get_screen_cursor_screen")
	public static function getScreenCursorScreen(out:flight._cpp.ScreenInfo, scratch:flight._cpp.ScreenQueryScratch, hostScreenQuery:flight._cpp.HostScreenQueryCapability):Void;
	@:native("flight_get_screen_nearest_point")
	public static function getScreenNearestPoint(out:flight._cpp.ScreenInfo, scratch:flight._cpp.ScreenQueryScratch, hostScreenQuery:flight._cpp.HostScreenQueryCapability, point:flight._cpp.Vector2):Void;
	@:native("flight_get_screen_nearest_rect")
	public static function getScreenNearestRect(out:flight._cpp.ScreenInfo, scratch:flight._cpp.ScreenQueryScratch, hostScreenQuery:flight._cpp.HostScreenQueryCapability, rect:flight._cpp.Rectangle):Void;
	@:native("flight_get_screen_work_area")
	public static function getScreenWorkArea(out:flight._cpp.Rectangle, screen:flight._cpp.ScreenInfo):Void;
	@:native("flight_get_screens")
	public static function getScreens(out:cpp.Star<cpp.Void>, hostScreenQuery:flight._cpp.HostScreenQueryCapability):Void;
	@:native("flight_screen_to_dip_point")
	public static function screenToDipPoint(out:flight._cpp.Vector2, screen:flight._cpp.ScreenInfo, point:flight._cpp.Vector2):Void;
	@:native("flight_screen_to_dip_rect")
	public static function screenToDipRect(out:flight._cpp.Rectangle, screen:flight._cpp.ScreenInfo, rect:flight._cpp.Rectangle):Void;
	@:native("flight_free_screen_info")
	public static function freeScreenInfo(ptr:flight._cpp.ScreenInfo):Void;
	@:native("flight_free_screen_mode")
	public static function freeScreenMode(ptr:flight._cpp.ScreenMode):Void;
	@:native("flight_free_screen_permission_change")
	public static function freeScreenPermissionChange(ptr:flight._cpp.ScreenPermissionChange):Void;
	@:native("flight_free_screen_signals")
	public static function freeScreenSignals(ptr:flight._cpp.ScreenSignals):Void;
}
