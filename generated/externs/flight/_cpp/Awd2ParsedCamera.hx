package flight._cpp;

private extern class Awd2ParsedCamera_Ffi {
	@:native("flight_get_awd2_parsed_camera_bottom") static function get_bottom(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_camera_bottom") static function set_bottom(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_camera_fov") static function get_fov(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_camera_fov") static function set_fov(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_camera_left") static function get_left(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_camera_left") static function set_left(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_awd2_parsed_camera_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_awd2_parsed_camera_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_awd2_parsed_camera_parent_id") static function get_parentId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_camera_parent_id") static function set_parentId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_camera_projection_type") static function get_projectionType(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_camera_projection_type") static function set_projectionType(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_camera_right") static function get_right(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_camera_right") static function set_right(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_awd2_parsed_camera_top") static function get_top(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_awd2_parsed_camera_top") static function set_top(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Awd2ParsedCamera(cpp.Star<cpp.Void>) {
	public var bottom(get, set):Single;

	inline function get_bottom():Single return Awd2ParsedCamera_Ffi.get_bottom(this);

	inline function set_bottom(value:Single):Single { Awd2ParsedCamera_Ffi.set_bottom(this, value); return value; }
	public var fov(get, set):Single;

	inline function get_fov():Single return Awd2ParsedCamera_Ffi.get_fov(this);

	inline function set_fov(value:Single):Single { Awd2ParsedCamera_Ffi.set_fov(this, value); return value; }
	public var left(get, set):Single;

	inline function get_left():Single return Awd2ParsedCamera_Ffi.get_left(this);

	inline function set_left(value:Single):Single { Awd2ParsedCamera_Ffi.set_left(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Awd2ParsedCamera_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2ParsedCamera_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var parentId(get, set):Int;

	inline function get_parentId():Int return Awd2ParsedCamera_Ffi.get_parentId(this);

	inline function set_parentId(value:Int):Int { Awd2ParsedCamera_Ffi.set_parentId(this, value); return value; }
	public var projectionType(get, set):Int;

	inline function get_projectionType():Int return Awd2ParsedCamera_Ffi.get_projectionType(this);

	inline function set_projectionType(value:Int):Int { Awd2ParsedCamera_Ffi.set_projectionType(this, value); return value; }
	public var right(get, set):Single;

	inline function get_right():Single return Awd2ParsedCamera_Ffi.get_right(this);

	inline function set_right(value:Single):Single { Awd2ParsedCamera_Ffi.set_right(this, value); return value; }
	public var top(get, set):Single;

	inline function get_top():Single return Awd2ParsedCamera_Ffi.get_top(this);

	inline function set_top(value:Single):Single { Awd2ParsedCamera_Ffi.set_top(this, value); return value; }
}
