package flight._cpp;

private extern class RiveStateMachineState_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_rive_state_machine_state_animation_id") static function get_animationId(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rive_state_machine_state_animation_id") static function set_animationId(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_rive_state_machine_state_kind") static function get_kind(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_rive_state_machine_state_kind") static function set_kind(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract RiveStateMachineState(cpp.Star<cpp.Void>) {
	public var animationId(get, set):Float;

	inline function get_animationId():Float return RiveStateMachineState_Ffi.get_animationId(this);

	inline function set_animationId(value:Float):Float { RiveStateMachineState_Ffi.set_animationId(this, value); return value; }
	public var kind(get, set):String;
	inline function get_kind():String { var raw = RiveStateMachineState_Ffi.get_kind(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RiveStateMachineState_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:cpp.ConstCharStar = cast value; RiveStateMachineState_Ffi.set_kind(this, raw); return value; }
}
