package flight._cpp._fn;

extern class Tween {
	@:native("flight_get_active_tween_count")
	public static function getActiveTweenCount(manager:flight._cpp.TweenManager):Int;
	@:native("flight_kill_tweens_of_property")
	public static function killTweensOfProperty(manager:flight._cpp.TweenManager, key:cpp.ConstCharStar):Void;
	@:native("flight_pause_all_tweens")
	public static function pauseAllTweens(manager:flight._cpp.TweenManager):Void;
	@:native("flight_reset_all_tweens")
	public static function resetAllTweens(manager:flight._cpp.TweenManager):Void;
	@:native("flight_resume_all_tweens")
	public static function resumeAllTweens(manager:flight._cpp.TweenManager):Void;
	@:native("flight_stop_all_tweens")
	public static function stopAllTweens(manager:flight._cpp.TweenManager, options:flight._cpp.StopTweenOptions):Void;
	@:native("flight_create_tween_manager")
	public static function createTweenManager(options:flight._cpp.TweenManagerOptions):flight._cpp.TweenManager;
	@:native("flight_update_tweens")
	public static function updateTweens(manager:flight._cpp.TweenManager, deltaTime:Float):Void;
	@:native("flight_free_tween_manager")
	public static function freeTweenManager(ptr:flight._cpp.TweenManager):Void;
}
