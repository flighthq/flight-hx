package flight._hl._fn;

extern class Screen {
	@:hlNative("flight", "flight_create_screen_info")
	public static function createScreenInfo():flight._hl.ScreenInfo;
	@:hlNative("flight", "flight_create_screen_mode")
	public static function createScreenMode():flight._hl.ScreenMode;
	@:hlNative("flight", "flight_create_screen_permission_change")
	public static function createScreenPermissionChange():flight._hl.ScreenPermissionChange;
	@:hlNative("flight", "flight_create_screen_signals")
	public static function createScreenSignals():flight._hl.ScreenSignals;
	@:hlNative("flight", "flight_attach_screen_permission_change")
	public static function attachScreenPermissionChange(hostScreenPermissionChange:flight._hl.HostScreenPermissionChangeCapability, permissionChange:flight._hl.ScreenPermissionChange):Void;
	@:hlNative("flight", "flight_attach_screen_signals")
	public static function attachScreenSignals(hostScreenChange:flight._hl.HostScreenChangeCapability, signals:flight._hl.ScreenSignals):Void;
	@:hlNative("flight", "flight_detach_screen_permission_change")
	public static function detachScreenPermissionChange(permissionChange:flight._hl.ScreenPermissionChange):Void;
	@:hlNative("flight", "flight_detach_screen_signals")
	public static function detachScreenSignals(signals:flight._hl.ScreenSignals):Void;
	@:hlNative("flight", "flight_dip_to_screen_point")
	public static function dipToScreenPoint(out:flight._hl.Vector2, screen:flight._hl.ScreenInfo, point:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_dip_to_screen_rect")
	public static function dipToScreenRect(out:flight._hl.Rectangle, screen:flight._hl.ScreenInfo, rect:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_dispose_screen_permission_change")
	public static function disposeScreenPermissionChange(permissionChange:flight._hl.ScreenPermissionChange):Void;
	@:hlNative("flight", "flight_dispose_screen_signals")
	public static function disposeScreenSignals(signals:flight._hl.ScreenSignals):Void;
	@:hlNative("flight", "flight_get_primary_screen")
	public static function getPrimaryScreen(out:flight._hl.ScreenInfo, hostScreenQuery:flight._hl.HostScreenQueryCapability):Void;
	@:hlNative("flight", "flight_get_screen_bounds")
	public static function getScreenBounds(out:flight._hl.Rectangle, screen:flight._hl.ScreenInfo):Void;
	@:hlNative("flight", "flight_get_screen_by_id")
	public static function getScreenById(out:flight._hl.ScreenInfo, scratch:flight._hl.ScreenQueryScratch, hostScreenQuery:flight._hl.HostScreenQueryCapability, id:Float):Bool;
	@:hlNative("flight", "flight_get_screen_containing_rect")
	public static function getScreenContainingRect(out:flight._hl.ScreenInfo, scratch:flight._hl.ScreenQueryScratch, hostScreenQuery:flight._hl.HostScreenQueryCapability, rect:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_get_screen_current_mode")
	public static function getScreenCurrentMode(out:flight._hl.ScreenMode, screen:flight._hl.ScreenInfo):Void;
	@:hlNative("flight", "flight_get_screen_cursor_position")
	public static function getScreenCursorPosition(out:flight._hl.Vector2, hostScreenQuery:flight._hl.HostScreenQueryCapability):Void;
	@:hlNative("flight", "flight_get_screen_cursor_screen")
	public static function getScreenCursorScreen(out:flight._hl.ScreenInfo, scratch:flight._hl.ScreenQueryScratch, hostScreenQuery:flight._hl.HostScreenQueryCapability):Void;
	@:hlNative("flight", "flight_get_screen_nearest_point")
	public static function getScreenNearestPoint(out:flight._hl.ScreenInfo, scratch:flight._hl.ScreenQueryScratch, hostScreenQuery:flight._hl.HostScreenQueryCapability, point:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_get_screen_nearest_rect")
	public static function getScreenNearestRect(out:flight._hl.ScreenInfo, scratch:flight._hl.ScreenQueryScratch, hostScreenQuery:flight._hl.HostScreenQueryCapability, rect:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_get_screen_work_area")
	public static function getScreenWorkArea(out:flight._hl.Rectangle, screen:flight._hl.ScreenInfo):Void;
	@:hlNative("flight", "flight_get_screens")
	public static function getScreens(out:hl.Bytes, hostScreenQuery:flight._hl.HostScreenQueryCapability):Void;
	@:hlNative("flight", "flight_screen_to_dip_point")
	public static function screenToDipPoint(out:flight._hl.Vector2, screen:flight._hl.ScreenInfo, point:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_screen_to_dip_rect")
	public static function screenToDipRect(out:flight._hl.Rectangle, screen:flight._hl.ScreenInfo, rect:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_free_screen_info")
	public static function freeScreenInfo(ptr:flight._hl.ScreenInfo):Void;
	@:hlNative("flight", "flight_free_screen_mode")
	public static function freeScreenMode(ptr:flight._hl.ScreenMode):Void;
	@:hlNative("flight", "flight_free_screen_permission_change")
	public static function freeScreenPermissionChange(ptr:flight._hl.ScreenPermissionChange):Void;
	@:hlNative("flight", "flight_free_screen_signals")
	public static function freeScreenSignals(ptr:flight._hl.ScreenSignals):Void;
}
