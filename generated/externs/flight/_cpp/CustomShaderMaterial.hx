package flight._cpp;

private extern class CustomShaderMaterial_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_custom_shader_material_shader_key") static function get_shaderKey(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_custom_shader_material_shader_key") static function set_shaderKey(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract CustomShaderMaterial(cpp.Star<cpp.Void>) {
	public var shaderKey(get, set):String;
	inline function get_shaderKey():String { var raw = CustomShaderMaterial_Ffi.get_shaderKey(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); CustomShaderMaterial_Ffi.freeString(raw); return value; }
	inline function set_shaderKey(value:String):String { var raw:cpp.ConstCharStar = cast value; CustomShaderMaterial_Ffi.set_shaderKey(this, raw); return value; }
}
