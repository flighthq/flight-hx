package flight._cpp;

private extern class Awd2ParsedMaterial_Ffi {
	@:native("flight_get_awd2_parsed_material_diffuse_texture_id") static function get_diffuseTextureId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_material_diffuse_texture_id") static function set_diffuseTextureId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_awd2_parsed_material_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_awd2_parsed_material_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_awd2_parsed_material_normal_texture_id") static function get_normalTextureId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_material_normal_texture_id") static function set_normalTextureId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_material_num_methods") static function get_numMethods(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_material_num_methods") static function set_numMethods(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_parsed_material_specular_texture_id") static function get_specularTextureId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_parsed_material_specular_texture_id") static function set_specularTextureId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2ParsedMaterial(cpp.Star<cpp.Void>) {
	public var diffuseTextureId(get, set):Int;

	inline function get_diffuseTextureId():Int return Awd2ParsedMaterial_Ffi.get_diffuseTextureId(this);

	inline function set_diffuseTextureId(value:Int):Int { Awd2ParsedMaterial_Ffi.set_diffuseTextureId(this, value); return value; }
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
		Awd2ParsedMaterial_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var normalTextureId(get, set):Int;

	inline function get_normalTextureId():Int return Awd2ParsedMaterial_Ffi.get_normalTextureId(this);

	inline function set_normalTextureId(value:Int):Int { Awd2ParsedMaterial_Ffi.set_normalTextureId(this, value); return value; }
	public var numMethods(get, set):Int;

	inline function get_numMethods():Int return Awd2ParsedMaterial_Ffi.get_numMethods(this);

	inline function set_numMethods(value:Int):Int { Awd2ParsedMaterial_Ffi.set_numMethods(this, value); return value; }
	public var specularTextureId(get, set):Int;

	inline function get_specularTextureId():Int return Awd2ParsedMaterial_Ffi.get_specularTextureId(this);

	inline function set_specularTextureId(value:Int):Int { Awd2ParsedMaterial_Ffi.set_specularTextureId(this, value); return value; }
}
