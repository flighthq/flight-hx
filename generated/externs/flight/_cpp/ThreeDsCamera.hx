package flight._cpp;

private extern class ThreeDsCamera_Ffi {
	@:native("flight_get_three_ds_camera_focal_length") static function get_focalLength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_three_ds_camera_focal_length") static function set_focalLength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_three_ds_camera_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_three_ds_camera_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_three_ds_camera_roll") static function get_roll(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_three_ds_camera_roll") static function set_roll(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ThreeDsCamera(cpp.Star<cpp.Void>) {
	public var focalLength(get, set):Single;

	inline function get_focalLength():Single return ThreeDsCamera_Ffi.get_focalLength(this);

	inline function set_focalLength(value:Single):Single { ThreeDsCamera_Ffi.set_focalLength(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = ThreeDsCamera_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ThreeDsCamera_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var roll(get, set):Single;

	inline function get_roll():Single return ThreeDsCamera_Ffi.get_roll(this);

	inline function set_roll(value:Single):Single { ThreeDsCamera_Ffi.set_roll(this, value); return value; }
}
