package flight._js._fn;

@:jsRequire("@flighthq/tween")
extern class Tween {
	@:native("getActiveTweenCount")
	public static function getActiveTweenCount(manager:flight._js.TweenManager):Int;
	@:native("killTweensOfProperty")
	public static function killTweensOfProperty(manager:flight._js.TweenManager, key:String):Void;
	@:native("pauseAllTweens")
	public static function pauseAllTweens(manager:flight._js.TweenManager):Void;
	@:native("resetAllTweens")
	public static function resetAllTweens(manager:flight._js.TweenManager):Void;
	@:native("resumeAllTweens")
	public static function resumeAllTweens(manager:flight._js.TweenManager):Void;
	@:native("stopAllTweens")
	public static function stopAllTweens(manager:flight._js.TweenManager, options:Null<flight._js.StopTweenOptions>):Void;
	@:native("createTweenManager")
	public static function createTweenManager(options:Null<flight._js.TweenManagerOptions>):flight._js.TweenManager;
	@:native("updateTweens")
	public static function updateTweens(manager:flight._js.TweenManager, deltaTime:Float):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTweenManager(ptr:flight._js.TweenManager):Void {}
}
