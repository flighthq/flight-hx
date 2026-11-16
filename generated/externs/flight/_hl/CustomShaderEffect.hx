package flight._hl;

private extern class CustomShaderEffect_Ffi {
	@:hlNative("flight", "flight_field_get_custom_shader_effect_shader_key")
	static function get_shaderKey(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_custom_shader_effect_shader_key")
	static function set_shaderKey(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract CustomShaderEffect(hl.Bytes) {
	public var shaderKey(get, set):String;
	inline function get_shaderKey():String {
		final bytes = CustomShaderEffect_Ffi.get_shaderKey(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_shaderKey(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		CustomShaderEffect_Ffi.set_shaderKey(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
