package flight._js;

@:jsRequire("flight")
private extern class AsepriteArrayFrame_Ffi {
	@:native("flight_get_aseprite_array_frame_duration") static function get_duration(ptr:Dynamic):Float;
	@:native("flight_set_aseprite_array_frame_duration") static function set_duration(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_aseprite_array_frame_rotated") static function get_rotated(ptr:Dynamic):Bool;
	@:native("flight_set_aseprite_array_frame_rotated") static function set_rotated(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_aseprite_array_frame_trimmed") static function get_trimmed(ptr:Dynamic):Bool;
	@:native("flight_set_aseprite_array_frame_trimmed") static function set_trimmed(ptr:Dynamic, value:Bool):Bool;
}

abstract AsepriteArrayFrame(Dynamic) {
	public var duration(get, set):Float;

	inline function get_duration():Float return AsepriteArrayFrame_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float return AsepriteArrayFrame_Ffi.set_duration(this, value);
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return AsepriteArrayFrame_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool return AsepriteArrayFrame_Ffi.set_rotated(this, value);
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return AsepriteArrayFrame_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool return AsepriteArrayFrame_Ffi.set_trimmed(this, value);
}
