package flight._cpp;

private extern class ObjMaterial_Ffi {
	@:native("flight_get_obj_material_dissolve") static function get_dissolve(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_obj_material_dissolve") static function set_dissolve(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_obj_material_illumination") static function get_illumination(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_obj_material_illumination") static function set_illumination(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_obj_material_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_obj_material_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_obj_material_specular_exponent") static function get_specularExponent(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_obj_material_specular_exponent") static function set_specularExponent(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ObjMaterial(cpp.Star<cpp.Void>) {
	public var dissolve(get, set):Single;

	inline function get_dissolve():Single return ObjMaterial_Ffi.get_dissolve(this);

	inline function set_dissolve(value:Single):Single { ObjMaterial_Ffi.set_dissolve(this, value); return value; }
	public var illumination(get, set):Single;

	inline function get_illumination():Single return ObjMaterial_Ffi.get_illumination(this);

	inline function set_illumination(value:Single):Single { ObjMaterial_Ffi.set_illumination(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = ObjMaterial_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ObjMaterial_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var specularExponent(get, set):Single;

	inline function get_specularExponent():Single return ObjMaterial_Ffi.get_specularExponent(this);

	inline function set_specularExponent(value:Single):Single { ObjMaterial_Ffi.set_specularExponent(this, value); return value; }
}
