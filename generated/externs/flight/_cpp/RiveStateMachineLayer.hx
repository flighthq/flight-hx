package flight._cpp;

private extern class RiveStateMachineLayer_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_rive_state_machine_layer_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_rive_state_machine_layer_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract RiveStateMachineLayer(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = RiveStateMachineLayer_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RiveStateMachineLayer_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; RiveStateMachineLayer_Ffi.set_name(this, raw); return value; }
}
