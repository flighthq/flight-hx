package flight._hl;

private extern class ObjMaterial_Ffi {
	@:hlNative("flight", "flight_field_get_obj_material_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_obj_material_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ObjMaterial(hl.Bytes) {
	public var dissolve(get, set):Single;

	inline function get_dissolve():Single return this.getF32(336);

	inline function set_dissolve(value:Single):Single { this.setF32(336, value); return value; }
	public var illumination(get, set):Single;

	inline function get_illumination():Single return this.getF32(340);

	inline function set_illumination(value:Single):Single { this.setF32(340, value); return value; }
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
		ObjMaterial_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var specularExponent(get, set):Single;

	inline function get_specularExponent():Single return this.getF32(356);

	inline function set_specularExponent(value:Single):Single { this.setF32(356, value); return value; }
}
