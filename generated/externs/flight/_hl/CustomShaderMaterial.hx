package flight._hl;

private extern class CustomShaderMaterial_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_custom_shader_material_shader_key")
	static function get_shaderKey(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_custom_shader_material_shader_key")
	static function set_shaderKey(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract CustomShaderMaterial(hl.Bytes) {
	public var shaderKey(get, set):String;
	inline function get_shaderKey():String { var raw = CustomShaderMaterial_Ffi.get_shaderKey(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CustomShaderMaterial_Ffi.freeString(raw); return value; }
	inline function set_shaderKey(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CustomShaderMaterial_Ffi.set_shaderKey(this, raw); return value; }
}
