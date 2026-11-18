package flight._hl._fn;

extern class Tween {
	@:hlNative("flight", "flight_get_active_tween_count")
	public static function getActiveTweenCount(manager:flight._hl.TweenManager):Int;
	@:hlNative("flight", "flight_kill_tweens_of_property")
	public static function killTweensOfProperty(manager:flight._hl.TweenManager, key:hl.Bytes):Void;
	@:hlNative("flight", "flight_pause_all_tweens")
	public static function pauseAllTweens(manager:flight._hl.TweenManager):Void;
	@:hlNative("flight", "flight_reset_all_tweens")
	public static function resetAllTweens(manager:flight._hl.TweenManager):Void;
	@:hlNative("flight", "flight_resume_all_tweens")
	public static function resumeAllTweens(manager:flight._hl.TweenManager):Void;
	@:hlNative("flight", "flight_stop_all_tweens")
	public static function stopAllTweens(manager:flight._hl.TweenManager, options:flight._hl.StopTweenOptions):Void;
	@:hlNative("flight", "flight_create_tween_manager")
	public static function createTweenManager(options:flight._hl.TweenManagerOptions):flight._hl.TweenManager;
	@:hlNative("flight", "flight_update_tweens")
	public static function updateTweens(manager:flight._hl.TweenManager, deltaTime:Single):Void;
	@:hlNative("flight", "flight_free_tween_manager")
	public static function freeTweenManager(ptr:flight._hl.TweenManager):Void;
}
