package flight._js._fn;

@:jsRequire("flight")
extern class Tween {
	@:native("flight_get_active_tween_count")
	public static function getActiveTweenCount(manager:flight._js.TweenManager):Int;
	@:native("flight_kill_tweens_of_property")
	public static function killTweensOfProperty(manager:flight._js.TweenManager, key:String):Void;
	@:native("flight_pause_all_tweens")
	public static function pauseAllTweens(manager:flight._js.TweenManager):Void;
	@:native("flight_reset_all_tweens")
	public static function resetAllTweens(manager:flight._js.TweenManager):Void;
	@:native("flight_resume_all_tweens")
	public static function resumeAllTweens(manager:flight._js.TweenManager):Void;
	@:native("flight_stop_all_tweens")
	public static function stopAllTweens(manager:flight._js.TweenManager, options:flight._js.StopTweenOptions):Void;
	@:native("flight_create_tween_manager")
	public static function createTweenManager(options:flight._js.TweenManagerOptions):flight._js.TweenManager;
	@:native("flight_default_manager")
	public static function defaultManager(context:flight._js.TweenContext):flight._js.TweenManager;
	@:native("flight_create_tween_context")
	public static function createTweenContext():flight._js.TweenContext;
	@:native("flight_update_tweens")
	public static function updateTweens(manager:flight._js.TweenManager, deltaTime:Float):Void;
	@:native("flight_free_tween_manager")
	public static function freeTweenManager(ptr:flight._js.TweenManager):Void;
	@:native("flight_free_tween_context")
	public static function freeTweenContext(ptr:flight._js.TweenContext):Void;
}
