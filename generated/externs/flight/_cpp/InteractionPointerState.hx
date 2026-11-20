package flight._cpp;

private extern class InteractionPointerState_Ffi {
	@:native("flight_get_interaction_pointer_state_last_click_time") static function get_lastClickTime(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_interaction_pointer_state_last_click_time") static function set_lastClickTime(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_interaction_pointer_state_last_pointer_click_button") static function get_lastPointerClickButton(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_interaction_pointer_state_last_pointer_click_button") static function set_lastPointerClickButton(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_interaction_pointer_state_last_pointer_click_time") static function get_lastPointerClickTime(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_interaction_pointer_state_last_pointer_click_time") static function set_lastPointerClickTime(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_interaction_pointer_state_last_pointer_click_x") static function get_lastPointerClickX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_interaction_pointer_state_last_pointer_click_x") static function set_lastPointerClickX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_interaction_pointer_state_last_pointer_click_y") static function get_lastPointerClickY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_interaction_pointer_state_last_pointer_click_y") static function set_lastPointerClickY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract InteractionPointerState(cpp.Star<cpp.Void>) {
	public var lastClickTime(get, set):Float;

	inline function get_lastClickTime():Float return InteractionPointerState_Ffi.get_lastClickTime(this);

	inline function set_lastClickTime(value:Float):Float { InteractionPointerState_Ffi.set_lastClickTime(this, value); return value; }
	public var lastPointerClickButton(get, set):Int;

	inline function get_lastPointerClickButton():Int return InteractionPointerState_Ffi.get_lastPointerClickButton(this);

	inline function set_lastPointerClickButton(value:Int):Int { InteractionPointerState_Ffi.set_lastPointerClickButton(this, value); return value; }
	public var lastPointerClickTime(get, set):Float;

	inline function get_lastPointerClickTime():Float return InteractionPointerState_Ffi.get_lastPointerClickTime(this);

	inline function set_lastPointerClickTime(value:Float):Float { InteractionPointerState_Ffi.set_lastPointerClickTime(this, value); return value; }
	public var lastPointerClickX(get, set):Float;

	inline function get_lastPointerClickX():Float return InteractionPointerState_Ffi.get_lastPointerClickX(this);

	inline function set_lastPointerClickX(value:Float):Float { InteractionPointerState_Ffi.set_lastPointerClickX(this, value); return value; }
	public var lastPointerClickY(get, set):Float;

	inline function get_lastPointerClickY():Float return InteractionPointerState_Ffi.get_lastPointerClickY(this);

	inline function set_lastPointerClickY(value:Float):Float { InteractionPointerState_Ffi.set_lastPointerClickY(this, value); return value; }
}
