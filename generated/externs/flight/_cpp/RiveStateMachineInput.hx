package flight._cpp;

private extern class RiveStateMachineInput_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_rive_state_machine_input_kind") static function get_kind(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_rive_state_machine_input_kind") static function set_kind(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_rive_state_machine_input_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_rive_state_machine_input_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract RiveStateMachineInput(cpp.Star<cpp.Void>) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = RiveStateMachineInput_Ffi.get_kind(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RiveStateMachineInput_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:cpp.ConstCharStar = cast value; RiveStateMachineInput_Ffi.set_kind(this, raw); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = RiveStateMachineInput_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RiveStateMachineInput_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; RiveStateMachineInput_Ffi.set_name(this, raw); return value; }
}
