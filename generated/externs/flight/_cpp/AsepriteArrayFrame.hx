package flight._cpp;

private extern class AsepriteArrayFrame_Ffi {
	@:native("flight_get_aseprite_array_frame_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_aseprite_array_frame_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_aseprite_array_frame_rotated") static function get_rotated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_aseprite_array_frame_rotated") static function set_rotated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_aseprite_array_frame_trimmed") static function get_trimmed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_aseprite_array_frame_trimmed") static function set_trimmed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract AsepriteArrayFrame(cpp.Star<cpp.Void>) {
	public var duration(get, set):Single;

	inline function get_duration():Single return AsepriteArrayFrame_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single { AsepriteArrayFrame_Ffi.set_duration(this, value); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return AsepriteArrayFrame_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool { AsepriteArrayFrame_Ffi.set_rotated(this, value); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return AsepriteArrayFrame_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool { AsepriteArrayFrame_Ffi.set_trimmed(this, value); return value; }
}
