package flight._cpp._fn;

extern class Tray {
	@:native("flight_disable_tray_guards")
	public static function disableTrayGuards(state:flight._cpp.TrayAnimationState):Void;
	@:native("flight_is_tray_destroyed")
	public static function isTrayDestroyed(tray:cpp.Star<cpp.Void>):Bool;
	@:native("flight_is_tray_icon_animating")
	public static function isTrayIconAnimating(tray:cpp.Star<cpp.Void>):Bool;
	@:native("flight_stop_tray_icon_animation")
	public static function stopTrayIconAnimation(tray:cpp.Star<cpp.Void>):Int;
}
