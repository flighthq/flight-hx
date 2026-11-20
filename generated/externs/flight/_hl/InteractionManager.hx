package flight._hl;

private extern class InteractionManager_Ffi {
	@:hlNative("flight", "flight_get_interaction_manager_double_click_delay")
	static function get_doubleClickDelay(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_interaction_manager_double_click_delay")
	static function set_doubleClickDelay(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_interaction_manager_double_click_distance")
	static function get_doubleClickDistance(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_interaction_manager_double_click_distance")
	static function set_doubleClickDistance(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_interaction_manager_enabled")
	static function get_enabled(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_interaction_manager_enabled")
	static function set_enabled(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_interaction_manager_precise")
	static function get_precise(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_interaction_manager_precise")
	static function set_precise(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_interaction_manager_suppress_touch_hover")
	static function get_suppressTouchHover(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_interaction_manager_suppress_touch_hover")
	static function set_suppressTouchHover(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_interaction_manager_tracked_subscribers_only")
	static function get_trackedSubscribersOnly(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_interaction_manager_tracked_subscribers_only")
	static function set_trackedSubscribersOnly(ptr:hl.Bytes, value:Bool):Bool;
}

abstract InteractionManager(hl.Bytes) {
	public var doubleClickDelay(get, set):Float;

	inline function get_doubleClickDelay():Float return InteractionManager_Ffi.get_doubleClickDelay(this);

	inline function set_doubleClickDelay(value:Float):Float { InteractionManager_Ffi.set_doubleClickDelay(this, value); return value; }
	public var doubleClickDistance(get, set):Float;

	inline function get_doubleClickDistance():Float return InteractionManager_Ffi.get_doubleClickDistance(this);

	inline function set_doubleClickDistance(value:Float):Float { InteractionManager_Ffi.set_doubleClickDistance(this, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return InteractionManager_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { InteractionManager_Ffi.set_enabled(this, value); return value; }
	public var precise(get, set):Bool;

	inline function get_precise():Bool return InteractionManager_Ffi.get_precise(this);

	inline function set_precise(value:Bool):Bool { InteractionManager_Ffi.set_precise(this, value); return value; }
	public var suppressTouchHover(get, set):Bool;

	inline function get_suppressTouchHover():Bool return InteractionManager_Ffi.get_suppressTouchHover(this);

	inline function set_suppressTouchHover(value:Bool):Bool { InteractionManager_Ffi.set_suppressTouchHover(this, value); return value; }
	public var trackedSubscribersOnly(get, set):Bool;

	inline function get_trackedSubscribersOnly():Bool return InteractionManager_Ffi.get_trackedSubscribersOnly(this);

	inline function set_trackedSubscribersOnly(value:Bool):Bool { InteractionManager_Ffi.set_trackedSubscribersOnly(this, value); return value; }
}
