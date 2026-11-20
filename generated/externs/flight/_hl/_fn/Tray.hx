package flight._hl._fn;

extern class Tray {
	@:hlNative("flight", "flight_disable_tray_guards")
	public static function disableTrayGuards(state:flight._hl.TrayAnimationState):Void;
	@:hlNative("flight", "flight_is_tray_destroyed")
	public static function isTrayDestroyed(tray:hl.Bytes):Bool;
	@:hlNative("flight", "flight_is_tray_icon_animating")
	public static function isTrayIconAnimating(tray:hl.Bytes):Bool;
	@:hlNative("flight", "flight_stop_tray_icon_animation")
	public static function stopTrayIconAnimation(tray:hl.Bytes):Int;
}
