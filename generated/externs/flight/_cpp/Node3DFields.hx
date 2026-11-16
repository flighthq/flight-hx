package flight._cpp;

private extern class Node3DFields_Ffi {
	@:native("flight_get_node3_dfields_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_node3_dfields_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_node3_dfields_visible") static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node3_dfields_visible") static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract Node3DFields(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return Node3DFields_Ffi.get_alpha(this);

	inline function set_alpha(value:Single):Single { Node3DFields_Ffi.set_alpha(this, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return Node3DFields_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool { Node3DFields_Ffi.set_visible(this, value); return value; }
}
