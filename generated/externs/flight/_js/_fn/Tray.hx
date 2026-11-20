package flight._js._fn;

@:jsRequire("@flighthq/tray")
extern class Tray {
	@:native("disableTrayGuards")
	public static function disableTrayGuards(state:flight._js.TrayAnimationState):Void;
	@:native("enableTrayGuards")
	public static function enableTrayGuards(state:flight._js.TrayAnimationState, logState:Dynamic, clock:Dynamic):Void;
	@:native("isTrayDestroyed")
	public static function isTrayDestroyed(tray:Dynamic):Bool;
	@:native("isTrayIconAnimating")
	public static function isTrayIconAnimating(tray:Dynamic):Bool;
	@:native("stopTrayIconAnimation")
	public static function stopTrayIconAnimation(tray:Dynamic):Dynamic;
}
