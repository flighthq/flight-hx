package flight._hl;

private extern class Awd2ParsedMaterial_Ffi {
	@:hlNative("flight", "flight_field_get_awd2_parsed_material_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_awd2_parsed_material_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Awd2ParsedMaterial(hl.Bytes) {
	public var diffuseTextureId(get, set):Int;

	inline function get_diffuseTextureId():Int return this.getI32(64);

	inline function set_diffuseTextureId(value:Int):Int { this.setI32(64, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Awd2ParsedMaterial_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2ParsedMaterial_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var normalTextureId(get, set):Int;

	inline function get_normalTextureId():Int return this.getI32(68);

	inline function set_normalTextureId(value:Int):Int { this.setI32(68, value); return value; }
	public var numMethods(get, set):Int;

	inline function get_numMethods():Int return this.getUI8(76);

	inline function set_numMethods(value:Int):Int { this.setUI8(76, value); return value; }
	public var specularTextureId(get, set):Int;

	inline function get_specularTextureId():Int return this.getI32(72);

	inline function set_specularTextureId(value:Int):Int { this.setI32(72, value); return value; }
}
