package flight._cpp;

private extern class ThreeDsCamera_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_three_ds_camera_focal_length") static function get_focalLength(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_three_ds_camera_focal_length") static function set_focalLength(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_three_ds_camera_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_three_ds_camera_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_three_ds_camera_roll") static function get_roll(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_three_ds_camera_roll") static function set_roll(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract ThreeDsCamera(cpp.Star<cpp.Void>) {
	public var focalLength(get, set):Float;

	inline function get_focalLength():Float return ThreeDsCamera_Ffi.get_focalLength(this);

	inline function set_focalLength(value:Float):Float { ThreeDsCamera_Ffi.set_focalLength(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = ThreeDsCamera_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ThreeDsCamera_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; ThreeDsCamera_Ffi.set_name(this, raw); return value; }
	public var roll(get, set):Float;

	inline function get_roll():Float return ThreeDsCamera_Ffi.get_roll(this);

	inline function set_roll(value:Float):Float { ThreeDsCamera_Ffi.set_roll(this, value); return value; }
}
