package flight._cpp;

private extern class ThreeDsMaterial_Ffi {
	@:native("flight_field_get_three_ds_material_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_three_ds_material_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_three_ds_material_opacity") static function get_opacity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_three_ds_material_opacity") static function set_opacity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ThreeDsMaterial(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = ThreeDsMaterial_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ThreeDsMaterial_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var opacity(get, set):Single;

	inline function get_opacity():Single return ThreeDsMaterial_Ffi.get_opacity(this);

	inline function set_opacity(value:Single):Single { ThreeDsMaterial_Ffi.set_opacity(this, value); return value; }
}
